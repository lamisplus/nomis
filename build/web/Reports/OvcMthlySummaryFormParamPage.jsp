<%--
    Document   : OvcMthlySummaryFormParamPage
    Created on : Jan 26, 2011, 11:38:55 AM
    Author     : smomoh
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<logic:notPresent name="USER">
    <logic:forward name="login" />
</logic:notPresent>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="images/kidmap2.css" rel="stylesheet" type="text/css" />
        <title>OVC Monthly summary form</title>
        <style type="text/css">
<!--
a {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #333333;
	font-weight: bold;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #000000;
}
a:hover {
	text-decoration: underline;
	color: #0075B6;
}
a:active {
	text-decoration: none;
	color: #000000;
}
.title
{
  color: #FFFFFF;
  font-weight: bold;
}
.orglabel
{
    color: #FFFFFF;
}

-->
</style>
        <script language="javascript">
            function setActionName(val)
            {
                document.getElementById("actionName").value=val
            }
function enableDateFields()
{
    if(document.getElementById("periodChkBox").checked==true)
    {
        enableComponents("enroll_month2")
        enableComponents("enroll_year2")
    }
    else
    {
        disableComponents("enroll_month2")
        disableComponents("enroll_year2")
    }
}
function enableComponents(id)
{
    document.getElementById(id).disabled=false
}
function disableComponents(id)
{
    document.getElementById(id).disabled=true
}
        </script>
    </head>
    <body>
        <br/><br/>
        <center>
            <html:form action="/monthlysummaryform" method="post">
                <html:hidden property="actionName" styleId="actionName"/>
                <!--<div id="mthlySummFormDiv" class="paramPage" style="height: 210px; width: 370px;">-->
        <span>
        <center>
        <table class="paramPage">
            <tr><td colspan="4" class="title" align="center"> VC Monthly summary form  </td></tr>
            <tr><td class="orglabel">State </td><td colspan="3"><html:select property="state" styleId="state" style="width: 290px;" onchange="setActionName('lga');forms[0].submit()">
                        <html:option value="All">All</html:option>
                        <logic:present name="stateListForReports">
                            <logic:iterate id="stateObj" name="stateListForReports">
                                <html:option value="${stateObj.state_code}">${stateObj.name}</html:option>
                            </logic:iterate>
                        </logic:present>
                    </html:select> </td>
            </tr>
            <tr><td class="orglabel" align="left">Group </td><td colspan="3">
                    <html:select property="orgUnitGroupId" styleId="orgUnitGroupId" style="width: 290px;" onchange="setActionName('allLga'); forms[0].submit()">
                        <html:option value="All">All</html:option>
                        <logic:present name="ssorgUnitGroupList">
                            <logic:iterate id="oug" name="ssorgUnitGroupList">
                            <html:option value="${oug.orgUnitGroupId}">${oug.orgUnitGroupName}</html:option>
                            </logic:iterate>
                        </logic:present>
                    </html:select> </td>
            </tr>
            <tr><td class="orglabel">LGA </td><td colspan="3"><html:select property="lga" styleId="lga" style="width: 290px;" onchange="setActionName('cbo');forms[0].submit()">
                        <html:option value="All">All</html:option>
                        <logic:present name="lgaList">
                        <logic:iterate id="lgaObj" name="lgaList">
                        <html:option value="${lgaObj.lga_code}">${lgaObj.lga_name}</html:option>
                        </logic:iterate>
                        </logic:present>
                        </html:select> </td></tr>
            <tr><td class="orglabel">CBO </td><td colspan="3">
                    <html:select property="cbo" styleId="cbo" style="width: 290px;" >
                        <html:option value="All">All</html:option>
                        <logic:present name="MthlySummOrgList">
                        <logic:iterate id="cboObj" name="MthlySummOrgList">
                            <html:option value="${cboObj.orgCode}">${cboObj.orgName}</html:option>
                        </logic:iterate>
                        </logic:present>
                    </html:select>

                </td>
            </tr>
            <tr><td class="orglabel" align="left">Partner </td><td colspan="3">
                    <html:select property="partnerCode" styleId="partnerCode" style="width: 290px;" >
                        <html:option value="All">All</html:option>
                        <logic:present name="partnerList">
                        <logic:iterate id="partner" name="partnerList">
                      <html:option value="${partner.partnerCode}">${partner.partnerName}</html:option>
                        </logic:iterate>
                        </logic:present>
                    </html:select> </td>
            </tr>
            <tr><td class="orglabel" align="left">Type </td>
                <td colspan="3">
                    <html:select property="reportType" styleId="reportType" style="width: 290px;" >
                        <html:option value="National">Old disaggregation</html:option>
                        <html:option value="new">Finer disaggregation</html:option>
                        </html:select> 
                </td>
            </tr>
            <tr><td class="title">&nbsp;</td><td colspan="3" class="title" align="left"> <html:checkbox property="periodChkBox" styleId="periodChkBox" value="on" onclick="enableDateFields()"/>Generate periodic report  </td></tr>

            <tr><td class="title"><label style=" margin-right: 5px; color:white">From</label></td>
                <td colspan="2" align="left">
                    <html:select property="enroll_month" styleId="enroll_month" style="width: 145px;">
                        <html:option value="1">January </html:option>
                        <html:option value="2">February </html:option>
                        <html:option value="3">March </html:option>
                        <html:option value="4">April </html:option>
                        <html:option value="5">May</html:option>
                        <html:option value="6">June</html:option>
                        <html:option value="7">July </html:option>
                        <html:option value="8">August </html:option>
                        <html:option value="9">September </html:option>
                        <html:option value="10">October </html:option>
                        <html:option value="11">November </html:option>
                        <html:option value="12">December</html:option>
                    </html:select>
                    <html:select property="enroll_year" styleId="enroll_year" style="width: 140px;">
                            <html:option value="2008">2008 </html:option>
                            <html:option value="2009">2009 </html:option>
                            <html:option value="2010">2010 </html:option>
                            <html:option value="2011">2011 </html:option>
                            <html:option value="2012">2012 </html:option>
                            <html:option value="2013">2013 </html:option>
                            <html:option value="2014">2014 </html:option>
                            <html:option value="2015">2015 </html:option>
                            <html:option value="2016">2016 </html:option>
                            <html:option value="2017">2017 </html:option>
                            <html:option value="2018">2018 </html:option>
                            <html:option value="2019">2019 </html:option>
                            <html:option value="2020">2020 </html:option>
                        </html:select> </td>
            </tr>

            <tr><td class="title"><label style=" margin-right: 5px; color:white">To</label></td>
                <td colspan="2" align="left">
                    <html:select property="enroll_month2" styleId="enroll_month2" style="width: 145px;" disabled="true">
                        <html:option value="1">January </html:option>
                        <html:option value="2">February </html:option>
                        <html:option value="3">March </html:option>
                        <html:option value="4">April </html:option>
                        <html:option value="5">May</html:option>
                        <html:option value="6">June</html:option>
                        <html:option value="7">July </html:option>
                        <html:option value="8">August </html:option>
                        <html:option value="9">September </html:option>
                        <html:option value="10">October </html:option>
                        <html:option value="11">November </html:option>
                        <html:option value="12">December</html:option>
                    </html:select>
                    <html:select property="enroll_year2" styleId="enroll_year2" style="width: 140px;" disabled="true">
                            <html:option value="2008">2008 </html:option>
                            <html:option value="2009">2009 </html:option>
                            <html:option value="2010">2010 </html:option>
                            <html:option value="2011">2011 </html:option>
                            <html:option value="2012">2012 </html:option>
                            <html:option value="2013">2013 </html:option>
                            <html:option value="2014">2014 </html:option>
                            <html:option value="2015">2015 </html:option>
                            <html:option value="2016">2016 </html:option>
                            <html:option value="2017">2017 </html:option>
                            <html:option value="2018">2018 </html:option>
                            <html:option value="2019">2019 </html:option>
                            <html:option value="2020">2020 </html:option>
                        </html:select> </td>
            </tr>


            <tr><td colspan="4" align="center"><html:submit property="mthlySummBtn" value="Submit" onclick="setActionName('monthlysummary')" style="width: 70px;" /></td></tr>
        </table>
        </center>
        </span>
    <!--</div>-->

            </html:form>
        </center>
    </body>
</html>

