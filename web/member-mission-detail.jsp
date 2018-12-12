<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <title>Mission | Detail</title>
        <%@include file="metalink.jsp" %>
    </head>

    <body>
        <div id="wrapper">
            <%@include file="header.jsp" %>
            <!--/. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav" id="main-menu">

                        <li>
                            <a class="active-menu" href="getOnWorkingMission"><i class="fa fa-dashboard"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="viewProfile"><i class="fa fa-users"></i> Profile </a>
                        </li> 
                        <li>
                            <a href="loadMissionHistory"><i class="fa fa-tasks"></i> Missions History</a>
                        </li>
                        <li>
                            <a href="loadMemberEquip"><i class="fa fa-gavel"></i> Your Equipments </a>
                        </li>	
                    </ul>

                </div>

            </nav>
            <!-- /. NAV SIDE  -->

            <div id="page-wrapper">
                <div class="header"> 
                    <h1 class="page-header">
                        Mission detail
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="getOnWorkingMission?username=<s:property value="%{#session.USERNAME}"/>">Home</a></li>
                        <li><a href="loadMissionHistory?username=<s:property value="%{#session.USERNAME}"/>">Mission</a></li>
                        <li class="active">
                            <s:property value="%{missionDTO.name}"/>
                        </li>
                    </ol> 

                </div>
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div class="col-md-6">
                                            <s:property value="%{missionDTO.name}"/>
                                        </div>
                                    </div>

                                    <div class="panel-body">
                                        <div class="col-md-12">
                                            <table class="table table-hover table-striped">
                                                <tbody>
                                                    <tr>
                                                        <td class="col-md-6">Description</td>
                                                        <td class="col-md-6">
                                                            <s:property value="%{missionDTO.description}"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-6">Begin time</td>
                                                        <td class="col-md-6">
                                                            <s:property value="%{missionDTO.beginTime}"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>End time</td>
                                                        <td>
                                                            <s:property value="%{missionDTO.endTime}"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Place</td>
                                                        <td>
                                                            <s:property value="%{missionDTO.place}"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Status</td>
                                                        <td>
                                                            <s:property value="%{missionDTO.status}"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Attachment</td>
                                                        <td>
                                                            <s:if test="%{missionDTO.attachment != null}">
                                                                <s:property value="%{missionDTO.attachment}"/>
                                                                <a href="mission/<s:property value="%{missionDTO.attachment}"/>" 
                                                                   download="<s:property value="%{missionDTO.id}"/>_<s:property value="%{missionDTO.name}"/>">
                                                                    Download this file for more detail
                                                                </a>
                                                            </s:if>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="panel panel-info">
                                    <div class="panel-heading">Members</div>
                                    <div class="panel-body">
                                        <s:if test="%{listMembers != null}">
                                            <s:if test="%{listMembers.size > 0}">
                                                <s:iterator value="%{listMembers}">
                                                    <div class="col-md-3 text-center">
                                                        <s:property value="%{firstName}"/> <s:property value="%{lastName}"/>
                                                        <img src="img/member/<s:property value="%{avatar}"/>" 
                                                             class="img-thumbnail img-responsive"/>
                                                    </div>
                                                </s:iterator>
                                            </s:if>
                                        </s:if>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">Report submission</div>
                                    <div class="panel-body">  
                                        <s:if test="%{missionDTO.report != null}">
                                            <div class="col-md-12 text-center">
                                                <span class="fa fa-file fa-3x"></span>
                                                <a href="mission/<s:property value="%{missionDTO.report}"/>" 
                                                   download="<s:property value="%{missionDTO.report}"/>">
                                                    Report
                                                </a>

                                            </div>
                                        </s:if>
                                        <s:if test="%{missionDTO.report == null}">
                                            <div class="panel panel-info"><i>*Report must be a file.txt</i></div>
                                        </s:if>
                                        <s:if test="%{missionDTO.status == 'In Progress'}">
                                            <s:form action="uploadFileText" enctype="multipart/form-data">
                                                <s:hidden name="id" value="%{missionDTO.id}"/>
                                                <s:hidden name="username" value="%{#session.USERNAME}"/>
                                                <s:file name="file"/>
                                                <font color="red" id="requiredFile"></font><br>
                                                    <button type="submit" class="btn btn-default btn-sm" onclick="return requiredFile()">
                                                        Submit file
                                                    </button>
                                                </s:form>
                                                <s:fielderror/>
                                            </s:if>   

                                    </div>
                                </div>
                            </div>
                            <s:if test="%{missionDTO.status == 'In Progress'}">
                                <s:if test="%{missionDTO.report != null}">
                                    <div class="col-md-12">
                                        <div class="panel panel-default">
                                            <div class="panel-body">
                                                <s:form action="submitMission">
                                                    <s:hidden name="id" value="%{missionDTO.id}"/>
                                                    <s:hidden name="username" value="%{#session.USERNAME}"/>
                                                    <button type="submit" class="btn btn-success btn-block">
                                                        Finish Mission
                                                    </button>
                                                </s:form>
                                            </div>

                                        </div>
                                    </div>
                                </s:if>
                            </s:if> 
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">Equipment used</div>

                                    <div class="panel-body text-center">
                                        <s:if test="%{equipDTO != null}">
                                            <label class="label label-default">
                                                <s:property value="%{equipDTO.name}"/>
                                            </label>
                                            <img src="img/equipment/<s:property value="%{equipDTO.img}"/>"
                                                 class="img-responsive"/>
                                        </s:if>
                                        <s:if test="%{equipDTO == null}">
                                            <span class="text-warning">No equipment is in use  for this mission</span>
                                        </s:if>
                                    </div>

                                    <s:if test="%{missionDTO.status == 'In Progress'}">
                                        <s:if test="%{listEquips != null}">
                                            <s:if test="%{listEquips.size > 0}">
                                                <div class="panel-footer text-center">
                                                    <s:form action="chooseEquip">
                                                        <div class="form-group">
                                                            <div class="input-group">
                                                                <s:hidden name="missionId" value="%{missionDTO.id}"/>
                                                                <span class="input-group-addon">Equipment</span>
                                                                <s:select name="equip" list="listEquips" 
                                                                          value="equipId"
                                                                          cssClass="form-control"/>
                                                            </div>

                                                        </div>

                                                        <button type="submit" class="btn btn-default">
                                                            Use
                                                        </button>
                                                    </s:form>
                                                </div>
                                            </s:if>
                                        </s:if>
                                    </s:if>


                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /. ROW  -->
                    <footer>
                        <p>All right reserved. Template by: <a href="http://webthemez.com">WebThemez.com</a></p>
                    </footer>
                </div>
                <!-- /. PAGE INNER  --> 
            </div>
            <!-- /. PAGE WRAPPER  --> 
        </div>
        <!-- /. WRAPPER  --> 
        <!-- JS Scripts--> 
        <!-- jQuery Js --> 
        <script src="assets/js/jquery-1.10.2.js"></script> 
        <!-- Bootstrap Js --> 
        <script src="assets/js/bootstrap.min.js"></script> 

        <!-- Metis Menu Js --> 
        <script src="assets/js/jquery.metisMenu.js"></script> 
        <!-- Validate insert form-->
        <script src="assets/js/formValidate.js" type="text/javascript"></script>
        <script src="assets/js/myJS.js" type="text/javascript"></script>
    </body>
</html>