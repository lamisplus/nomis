/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fhi.nomis.OperationsManagement;

import com.fhi.kidmap.business.Caregiver;
import com.fhi.kidmap.business.ChildSchoolStatus;
import com.fhi.kidmap.business.HouseholdEnrollment;
import com.fhi.kidmap.business.Ovc;
import com.fhi.kidmap.business.ProcessMonitor;
import com.fhi.kidmap.dao.DaoUtil;
import com.fhi.kidmap.dao.ProcessMonitorDao;
import com.fhi.kidmap.dao.ProcessMonitorDaoImpl;
import com.fhi.nomis.nomisutils.AppUtility;
import com.fhi.nomis.nomisutils.DateManager;
import com.fhi.nomis.nomisutils.NomisConstant;
import com.fhi.nomis.nomisutils.TaskManager;
import com.nomis.databasemanagement.DatabaseCleanup;
import com.nomis.upgrade.NomisUpgrade;
import java.util.List;

/**
 *
 * @author smomoh
 */
public class BackgroundProcessManager 
{
  public boolean backgroundProcessExecuted(String processName,int repeatValue)
  {
      boolean executed=false;
      try
      {
        ProcessMonitorDao pmdao=new ProcessMonitorDaoImpl();
        ProcessMonitor pm=pmdao.getProcessMonitorByProcessName(processName);
        if(pm !=null && pm.getRepeatAction()>=repeatValue)
        executed=true;
      }
      catch(Exception ex)
      {
          ex.printStackTrace();
      }
      return executed;
  }
  public boolean markBackgroundProcessAsExecuted(String processName,int repeatValue)
  {
      boolean executed=false;
      try
      {
        AppUtility appUtil=new AppUtility();
        ProcessMonitorDao pmdao=new ProcessMonitorDaoImpl();
        ProcessMonitor pm=pmdao.getProcessMonitorByProcessName(processName);
        if(pm==null)
        {
            pm=new ProcessMonitor();
            pm.setProcessId(getUniqueRecordId());
            pm.setProcessName(processName);
            pm.setProcessStatus(1);
            pm.setAutogenerated(1);
            pm.setRepeatAction(repeatValue);
            pm.setLastModifiedDate(DateManager.getDateInstance(DateManager.getCurrentDate()));
            pmdao.saveProcessMonitor(pm);
            System.err.println("Process with name: "+pm.getProcessName()+" executed");
        }
        if(pm !=null)
        executed=true;
      }
      catch(Exception ex)
      {
          ex.printStackTrace();
      }
      return executed;
  }
  public String getUniqueRecordId()
    {
        AppUtility appUtil=new AppUtility();
        String uniqueId=appUtil.generateUniqueId(11);
        try
        {
            ProcessMonitorDao pmdao=new ProcessMonitorDaoImpl();
            if(pmdao.getProcessMonitorByProcessId(uniqueId) !=null)
            getUniqueRecordId();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        return uniqueId;
    }
  public void executeBackgroundProcess(String processName)
  {      
        String msg="Household followup assessment records migration interrupted";
        try
        {
            if(processName!=null)
            {
                TaskManager.setDatabaseLocked(true);
                if(processName.equalsIgnoreCase(BackgoundProcessConstant.UPDATE_WITHDRAWAL_STATUS) && !backgroundProcessExecuted(processName,1))
                {
                    DatabaseCleanup dbc=new DatabaseCleanup();
                    dbc.setAppropriateWithdrawalType();
                    NomisUpgrade nu=new NomisUpgrade();
                    msg=nu.updateWithdrawalStatus(true);
                    markBackgroundProcessAsExecuted(processName,0);
                    System.err.println(msg);
                }
                else if(processName.equalsIgnoreCase(BackgoundProcessConstant.COMPLETE_HOUSEHOLD_WITHDRAWAL) && !backgroundProcessExecuted(processName,1))
                {
                    NomisUpgrade nu=new NomisUpgrade();
                    nu.updateHouseholdWithdrawal();
                    msg="Household member withdrawal completed";
                    markBackgroundProcessAsExecuted(processName,0);
                    System.err.println(msg);
                }
                else if(processName.equalsIgnoreCase(BackgoundProcessConstant.REMOVE_HOUSEHOLDS_WITHOUT_OVC) && !backgroundProcessExecuted(processName,1))
                {
                    NomisUpgrade nu=new NomisUpgrade();
                    nu.withdrawHouseholdsWithoutOvc();
                    msg="Households without active OVC deactivated";
                    markBackgroundProcessAsExecuted(processName,0);
                    System.err.println(msg);
                }
                else if(processName.equalsIgnoreCase(BackgoundProcessConstant.UPDATE_BIRTH_REGISTRATION) && !backgroundProcessExecuted(processName,1))
                {
                    NomisUpgrade nu=new NomisUpgrade();
                    nu.updateBirthRegistrationStatus(true);
                    msg="Birth registration information updated";
                    markBackgroundProcessAsExecuted(processName,0);
                    System.err.println(msg);
                }
                else if(processName.equalsIgnoreCase(BackgoundProcessConstant.HHVA_CLEANUP) && !backgroundProcessExecuted(processName,1))
                {
                    DatabaseCleanup dbc=new DatabaseCleanup();
                    dbc.removeDuplicatesFromHHVA();
                    msg="Household assessment records cleaned successfully";
                    markBackgroundProcessAsExecuted(processName,0);
                    System.err.println(msg);
                }
                else if(processName.equalsIgnoreCase(BackgoundProcessConstant.BASELINE_HHVA_MIGRATION) && !backgroundProcessExecuted(processName,1))
                {
                    msg="Household baseline assessment records migration interrupted";
                    DatabaseCleanup dbc=new DatabaseCleanup();
                    int success=dbc.fillBaselineAssessmentInhouseholdEnrollment();
                    if(success==1)
                    {
                        msg="Household baseline assessment records migrated successfully";
                        markBackgroundProcessAsExecuted(processName,0);
                    }
                    System.err.println(msg);
                }//UPDATESERVICESTATUS
                else if(processName.equalsIgnoreCase(BackgoundProcessConstant.FOLLOWUP_HHVA_MIGRATION) && !backgroundProcessExecuted(processName,1))
                {
                    msg="Household followup assessment records migration interrupted";
                    DatabaseCleanup dbc=new DatabaseCleanup();
                    int success=dbc.fillAssessmentScoresForFollowupRecords();
                    if(success==1)
                    {
                        msg="Household followup assessment records migrated successfully";
                        markBackgroundProcessAsExecuted(processName,0);
                    }
                    System.err.println(msg);
                }
                else if(processName.equalsIgnoreCase(BackgoundProcessConstant.UPDATESERVICESTATUS))
                {
                    DatabaseCleanup dbc=new DatabaseCleanup();
                    int count=dbc.updateOvcWithLastServiceDate(false);
                    msg=count+" OVC service status updated";
                                        
                    if(count>0)
                    {
                        //msg=count+" OVC service status updated successfully";
                        markBackgroundProcessAsExecuted(processName,0);
                    }
                    System.err.println(msg);
                }
                TaskManager.setDatabaseLocked(false);
            }
        }
        catch(Exception ex)
        {
            msg=ex.getMessage();
            System.err.println("Error "+msg);

        }
  }
  public void executeBackgroundProcesses()
  {
      executeBackgroundProcess(BackgoundProcessConstant.UPDATESERVICESTATUS);
     //executeBackgroundProcess(BackgoundProcessConstant.COMPLETE_HOUSEHOLD_WITHDRAWAL);
     //executeBackgroundProcess(BackgoundProcessConstant.REMOVE_HOUSEHOLDS_WITHOUT_OVC);
     //executeBackgroundProcess(BackgoundProcessConstant.UPDATE_WITHDRAWAL_STATUS);
     //executeBackgroundProcess(BackgoundProcessConstant.UPDATE_BIRTH_REGISTRATION);
         
     //executeBackgroundProcess(BackgoundProcessConstant.HHVA_CLEANUP);
     //executeBackgroundProcess(BackgoundProcessConstant.BASELINE_HHVA_MIGRATION);
     //executeBackgroundProcess(BackgoundProcessConstant.FOLLOWUP_HHVA_MIGRATION);
  }
  public void updateHivStatus(String clientId,String beneficiaryType)
  {
      try
      {
        DaoUtil util=new DaoUtil();
        List list=util.getHivStatusUpdateDaoInstance().getAllHivStatusUpdatesPerClient(clientId);
        if(list==null || list.isEmpty())
        {
            if(beneficiaryType !=null)
            {
                if(beneficiaryType.equalsIgnoreCase(NomisConstant.OVC_TYPE))
                {
                    Ovc ovc=util.getOvcDaoInstance().getOvc(clientId);
                    if(ovc !=null)
                    {
                        util.getOvcDaoInstance().saveOvcHIVStatus(ovc);
                    }
                }
                else if(beneficiaryType.equalsIgnoreCase(NomisConstant.Caregiver_TYPE))
                {
                    Caregiver cgiver=util.getCaregiverDaoInstance().getCaregiverByCaregiverId(clientId);
                    if(cgiver !=null)
                    {
                        util.getCaregiverDaoInstance().saveCaregiverHIVStatus(cgiver);
                    }
                }
                else if(beneficiaryType.equalsIgnoreCase(NomisConstant.HOUSEHOLD_TYPE))
                {
                    HouseholdEnrollment hhe=util.getHouseholdEnrollmentDaoInstance().getHouseholdEnrollment(clientId);
                    if(hhe !=null)
                    {
                        util.getHouseholdEnrollmentDaoInstance().saveHouseholdHeadHIVStatus(hhe);
                    }
                }
            }
        }
      }
      catch(Exception ex)
      {
          ex.printStackTrace();
      }
  }
  public void updateSchoolStatus(String ovcId)
  {
      try
      {
        DaoUtil util=new DaoUtil();
        ChildSchoolStatus schStatus=util.getChildSchoolStatusDaoInstance().getChildSchoolStatus(ovcId);
        if(schStatus==null)
        {
            Ovc ovc=util.getOvcDaoInstance().getOvc(ovcId);
            if(ovc !=null)
            {
                SchoolAttendanceManager.saveOrUpdateChildSchoolStatus(ovc);
            }
        }
      }
      catch(Exception ex)
      {
          ex.printStackTrace();
      }
  }
  public void updateHivStatusAndSchoolStatus(String clientId,String beneficiaryType)
  {
      if(beneficiaryType !=null)
      {
          if(beneficiaryType.equalsIgnoreCase(NomisConstant.OVC_TYPE))
          updateSchoolStatus(clientId);
          updateHivStatus(clientId,beneficiaryType);
      }
  }
}