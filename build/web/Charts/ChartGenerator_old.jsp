<%-- 
    Document   : ChartGenerator
    Created on : Nov 1, 2015, 10:39:06 PM
    Author     : smomoh
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Chart generator</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(images/bg.jpg);
	background-repeat: repeat-x;
}
-->
</style>
<script type="text/javascript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<link href="images/untitled.css" rel="stylesheet" type="text/css" />
<link href="images/sdmenu/sdmenu.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
a {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}
-->
</style>
<!--<link href="sdmenu/sdmenu.css" rel="stylesheet" type="text/css" />-->
<link type="text/css" href="css/ui-darkness/jquery-ui-1.8.custom.css" rel="Stylesheet" />
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.custom.min.js"></script>

<script language="javascript">

function submitForm(requiredAction,formId)
{
       setActionName(requiredAction)
       document.getElementById(formId).submit()
       return true
}

function setBtnName(name)
{
     if(name=="save")
     {
            setActionName(name)
            return true
     }
     if(confirm("Are you sure you want to "+name+" this record?"))
     {
            setActionName(name)
            return true
     }
       return false
}
function setActionName(val)
{
    document.getElementById("actionName").value=val
}
</script>
<link href="kidmap-default.css" rel="stylesheet" type="text/css" />
<link href="images/kidmap2.css" rel="stylesheet" type="text/css" />
</head>

<body onload="MM_preloadImages('images/About_down.jpg','images/Admin_down.jpg','images/Rapid_down.jpg','images/care_down.jpg','images/OVC_down.jpg');">

<table width="949" border="0" align="center" cellpadding="0" cellspacing="0" class="boarder">
  <!--DWLayoutTable-->
  <tr>
    <td height="117" colspan="2" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <!--DWLayoutTable-->
      <tr>
        <td width="7" height="2"></td>
          <td width="271"></td>
          <td width="137"></td>
          <td width="95"></td>
          <td width="8"></td>
          <td width="95"></td>
          <td width="8"></td>
          <td width="95"></td>
          <td width="8"></td>
          <td width="95"></td>
          <td width="8"></td>
          <td width="95"></td>
          <td width="23"></td>
        </tr>




      <tr>
        <td height="3"></td>
        <td></td>
        <td></td>
        <td rowspan="2" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr>
                <td width="95" height="65"><a href="Nomis.jsp" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('OVC','','images/OVC_down.jpg',1)"><img src="images/OVC_up.jpg" alt="OVC" name="OVC" width="95" height="65" border="0" id="OVC" /></a></td>
              </tr>
          </table></td>
          <td></td>
        <td rowspan="2" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr>
                <td width="95" height="65"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Care and Support','','images/care_down.jpg',1)"><img src="images/care_up.jpg" alt="Care and Support" name="Care and Support" width="95" height="65" border="0" id="Care and Support" /></a></td>
              </tr>
          </table></td>
          <td></td>
        <td rowspan="2" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr>
                <td width="95" height="65"><a href="RapidAssessment.jsp" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Rapid Assesment','','images/Rapid_down.jpg',1)"><img src="images/rapid_up.jpg" alt="Rapid Assesment" name="Rapid Assesment" width="95" height="65" border="0" id="Rapid Assesment" /></a></td>
              </tr>
          </table></td>
          <td></td>
        <td rowspan="2" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr>
                <td width="95" height="65"><a href="Administration.jsp" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('NOMIS Admin','','images/Admin_down.jpg',1)"><img src="images/admin_up.jpg" alt="NOMIS Admin" name="NOMIS Admin" width="95" height="65" border="0" id="NOMIS Admin" /></a></td>
              </tr>
          </table></td>
          <td></td>
          <td rowspan="2" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr>
                <td width="95" height="65"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('About NOMIS','','images/About_down.jpg',1)"><img src="images/about_up.jpg" alt="About NOMIS" name="About NOMIS" width="95" height="65" border="0" id="About NOMIS" /></a></td>
              </tr>
          </table></td>
          <td></td>
        </tr>

      <tr>
        <td height="62"></td>
          <td rowspan="2" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr>
                <td width="268" height="92"><img src="images/logo.jpg" width="268" height="92" /></td>
              </tr>
          </table></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>





      <tr>
        <td height="30"></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td>&nbsp;</td>
        <td></td>
        <td></td>
        <td></td>
        </tr>

      <tr>
        <td height="17"></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td><jsp:include page="../Logout.jsp" /></td>
          <td></td>
        </tr>
      <tr>
        <td height="3" colspan="13" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#038233">
          <!--DWLayoutTable-->
          <tr>
            <td width="945" height="2"></td>
            </tr>
          <!--DWLayoutTable-->
          <tr>
            <td height="1"></td>
              </tr>
        </table></td>
        </tr>

    </table></td>
  </tr>
  <tr>
    <td width="931" height="251" valign="top">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <!--DWLayoutTable-->
      <tr>

        <td width="231" rowspan="2" valign="top"  bgcolor="#038233">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#038233">
          <!--DWLayoutTable-->
          <tr>
            <td width="231" height="28" valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr>
                <td width="231" height="28"><img src="images/dataentry.jpg" width="231" height="28" /></td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td height="85" valign="top">
                <div style="float: left" id="my_menu" class="sdmenu">
                    <div>
                        <jsp:include page="../Navigation/ChartLink.jsp"/>
                    </div>
              </div>

            </td>
          </tr>
          <tr>
            <td height="30" valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr>
                <td width="180" height="30"><img src="images/reports.jpg" width="231" height="30" /></td>
                    </tr>
            </table></td>
          </tr>
          <tr>
            <td height="127" valign="top">
                <div style="float: left" id="my_menu2" class="sdmenu" >
              <div>
                <a href="#">&nbsp; </a>
                <a href="#">&nbsp; </a>
                <a href="#">&nbsp; </a>
                <a href="#">&nbsp; </a>
                <a href="#">&nbsp; </a>
                <a href="#">&nbsp; </a>
              </div>
            </div></td>
          </tr>


      </table></td>
    <td width="13">&nbsp;</td>
    <td width="660" >

    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td height="19" class="homepagestyle" colspan="2" align="center"> </td>

    </tr>


  </table>

          <html:form action="/chartGeneratorAction" method="post">
                <html:hidden property="actionName" styleId="actionName"/>
                
        <span>
        <center>
            <html:errors/>
        <table class="paramPage">
            <tr><td colspan="4" class="title" align="center">Charts</td></tr>
            <tr><td class="title" align="center">Title</td>
                <td colspan="3"><html:text property="chartTitle" styleId="chartTitle" style="width: 680px;"/> </td></tr>
            <tr><td class="orglabel" align="left">State </td><td align="left">
                    <html:select property="stateCode" styleId="stateCode" style="width: 290px;" onchange="setActionName('lgaList'); forms[0].submit()">
                        <html:option value="All">All</html:option>
                        <html:optionsCollection property="stateList" label="name" value="state_code" />

                    </html:select> </td>
            <td class="orglabel" align="left">LGA </td><td align="left">
                <html:select property="lgaCode" styleId="lgaCode" style="width: 290px;" onchange="setActionName('orgList'); forms[0].submit()">
                        <html:option value="All">All</html:option>
                        <html:optionsCollection property="lgaList" label="lga_name" value="lga_code" />
                        
                        </html:select> </td>
            </tr>
            <tr><td class="orglabel" align="left">CBO </td><td align="left">
                    <html:select property="orgCode" styleId="orgCode" style="width: 290px;" onchange="setActionName('wardList'); forms[0].submit()">
                        <html:option value="All">All</html:option>
                        <html:optionsCollection property="orgList" label="orgName" value="orgCode" />
                    
                    </html:select> </td>

            <td class="orglabel" align="left"><jsp:include page="../includes/WardName.jsp"/> </td><td align="left">
                    <html:select property="wardCode" styleId="wardCode" style="width: 290px;" >
                        <html:option value="All"> </html:option>
                        <html:optionsCollection property="wardList" label="ward_name" value="ward_code" />
                        
                    </html:select> </td></tr>
            <tr><td>&nbsp;</td>
                <td valign="top" colspan="3">

                        <div style="width:672px; height:150px; overflow:scroll; border:1px silver solid; text-align:left; background-color:#FFFFFF;">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regsitertable">

                    <tr>
                      <td>
                          <table width="650" border="1" bordercolor="#D7E5F2" class="regsitertable">
                              <logic:iterate name="organizationList" id="ou">
                                  <tr><td><html:multibox property='selectedOrganizationUnits' styleId="${ou.orgunitid}" value="${ou.orgunitid}" styleClass='smallfieldcellselect'/> </td><td>${ou.orgunitname} </td> </tr>
                              </logic:iterate>

                        </table>

                      </td>
                      </tr>
                  </table>
                </div>
                 </td>
            </tr>
            <tr><td>&nbsp;</td>
                <td valign="top" colspan="3">
                      <fieldset>
                        <legend class="fieldset">Indicators </legend>
                        <div style="width:670px; height:150px; overflow:scroll; border:1px silver solid; text-align:left; background-color:#FFFFFF;">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regsitertable">

                    <tr>
                      <td>
                          <table width="650" border="1" bordercolor="#D7E5F2" class="regsitertable">
                              <logic:iterate name="sunstatIndictors" id="list">
                                  <tr><td><html:multibox property='indicatorIndexes' styleId="${list[0]}" value="${list[0]}" styleClass='smallfieldcellselect'/> </td><td>${list[1]} </td> </tr>
                              </logic:iterate>

                        </table>

                      </td>
                      </tr>
                  </table>
                </div>
                  </fieldset></td>
            </tr>
            <tr><td class="orglabel" align="left">Partner </td><td align="left">
                    <html:select property="partnerCode" styleId="partnerCode" style="width: 290px;" >
                        <html:option value="All">All</html:option>
                        <html:optionsCollection property="partnerList" label="partnerName" value="partnerCode" />
                    </html:select> </td>

            <td class="orglabel" align="right">Period</td>
                <td align="left">
                    <html:select property="startMth" styleId="startMth" style="width: 70px;">
                        <logic:iterate id="months" name="generatedMonths">
                            <html:option value="${months.value}">${months.name}</html:option>
                         </logic:iterate>
                        </html:select>
                    <html:select property="startYear" styleId="startYear" style="width: 50px;" onchange="setActionName('endDates'); forms[0].submit()">  
                        <logic:iterate id="year" name="generatedStartDates" >
                            <html:option value="${year}">${year}</html:option>
                        </logic:iterate>
                    </html:select> <label class="orglabel" style=" margin-left: 6px; margin-right: 6px"> to</label>
                    <html:select property="endMth" styleId="endMth" style="width: 70px;" >
                        <logic:iterate id="month" name="endMonths">
                            <html:option value="${month.value}">${month.name}</html:option>
                        </logic:iterate>
                    </html:select>
                    <html:select property="endYear" style="width: 50px;" styleId="endYear" >
                        <logic:iterate id="year" name="endYears">
                            <html:option value="${year}">${year}</html:option>
                        </logic:iterate>
                    </html:select> </td></tr>

            <tr><td class="orglabel" align="left">Age</td>
                <td align="left">
                    <html:select property="startAge" styleId="startAge" style="width: 124px;" onchange="setActionName('endAge'); forms[0].submit()">
                       <%--<html:option value="All"></html:option>--%>
                    <logic:iterate id="age" name="ageList">
                        <html:option value="${age}">${age}</html:option>
                        </logic:iterate>
                    </html:select>  <label class="orglabel" style=" margin-left: 6px; margin-right: 6px"> to</label>
                    <html:select property="endAge" styleId="endAge" style="width: 124px;" >
                        <logic:iterate id="age" name="endAgeList">
                        <html:option value="${age}">${age}</html:option>
                        </logic:iterate>
                    </html:select></td></tr>

            
            <tr><td colspan="3" align="center"><html:submit  value="Generate Chart" onclick="setActionName('generateChart')" style="width: 120px; height:20px; margin-left: 300px;" /></td></tr>
        </table>
        </center>
        </span>
   <!-- </div>-->

            </html:form>

          &nbsp;</td>
      </tr>

    </table>    </td>
    <td width="18">&nbsp;</td>
  </tr>
  <tr>
    <td height="25" colspan="2" valign="top">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#038233">
      <!--DWLayoutTable-->
      <tr>
        <td width="945" height="25" class="copyright"><jsp:include page="../includes/Version.jsp"/> </td>
        </tr>
    </table></td>
  </tr>
</table>
  </body>
</html>

