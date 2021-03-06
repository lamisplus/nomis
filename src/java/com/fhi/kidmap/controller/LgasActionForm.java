/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.fhi.kidmap.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author COMPAQ USER
 */
public class LgasActionForm extends org.apache.struts.action.ActionForm {


     private String state_code;
     private String lga_code;
    private String lga_name;
    private String autogenerated;
    private String lgaList;
    private String actionName;

    public String getActionName() {
        return actionName;
    }

    public void setActionName(String actionName) {
        this.actionName = actionName;
    }
    public LgasActionForm() {
        super();
        // TODO Auto-generated constructor stub
    }
    

    public String getLga_code() {
        return lga_code;
    }

    public void setLga_code(String lga_code) {
        this.lga_code = lga_code;
    }

    public String getLga_name() {
        return lga_name;
    }

    public void setLga_name(String lga_name) {
        this.lga_name = lga_name;
    }

    public String getState_code() {
        return state_code;
    }

    public void setState_code(String state_code)
    {
        this.state_code = state_code;
    }

    public String getLgaList()
    {
        return lgaList;
    }

    public void setLgaList(String lgaList) {
        this.lgaList = lgaList;
    }

    public String getAutogenerated() {
        return autogenerated;
    }

    public void setAutogenerated(String autogenerated) {
        this.autogenerated = autogenerated;
    }


    @Override
    public void reset(ActionMapping mapping, HttpServletRequest request)
    {
         lga_name=null;
         lga_code=null;
         lgaList=null;
         state_code=null;
         actionName=null;
         autogenerated=null;
    }
    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
     */
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        if(this.getActionName()==null || this.getActionName().equalsIgnoreCase("delete") || getActionName().equalsIgnoreCase("lgaList") || getActionName().equalsIgnoreCase("lgaDetails"))
        return errors;
        if (getState_code() == null || getState_code().length() < 1) 
            errors.add("state_code", new ActionMessage("error.state_code.required"));
        else if (getLga_code() == null || getLga_code().length() < 1)
            errors.add("lga_code", new ActionMessage("error.lga_code.required"));
        else if (getLga_code() != null && getLga_code().length() > 3)
            errors.add("lga_codeLength", new ActionMessage("error.lga_code.length"));
        else if (getLga_name() == null || getLga_name().length() < 1)
            errors.add("lga_name", new ActionMessage("error.lga_name.required"));
        else if (getLga_name() != null && getLga_name().length() > 40)
            errors.add("lga_name_length", new ActionMessage("error.lga_name.length"));
        
        return errors;
    }
}
