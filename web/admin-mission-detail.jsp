<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <title>Mission Management</title>
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
                            <a href="loadAdminIndex"><i class="fa fa-dashboard"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="loadAllMember"><i class="fa fa-users"></i> Members </a>
                        </li> 
                        <li>
                            <a class="active-menu" href="loadAllMission"><i class="fa fa-tasks"></i> Missions </a>
                        </li>
                        <li>
                            <a href="loadAllEquip"><i class="fa fa-gavel"></i> Equipments </a>
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
                        <li><a href="loadAdminIndex">Home</a></li>
                        <li><a href="loadAllMission">Mission</a></li>
                        <li class="active">
                            <s:property value="%{missionDTO.name}"/>
                        </li>
                    </ol> 

                </div>
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="col-md-6">
                                        <s:property value="%{missionDTO.name}"/>
                                    </div>

                                    <div class="col-md-6 text-right">
                                        <s:if test="%{missionDTO.status == 'In Progress'}">
                                            <s:url var="update" value="viewMissionDetail">
                                                <s:param name="id" value="%{missionDTO.id}"/>
                                                <s:param name="action" value="'update'"/>
                                            </s:url>
                                            <s:a href="%{update}">
                                                <button class="btn btn-default btn-xs">
                                                    <i class="fa fa-edit"></i> Edit
                                                </button>
                                            </s:a>
                                        </s:if>
                                        <button class="btn btn-warning btn-xs"
                                                data-toggle="modal" data-target="#myModal">
                                            <i class="fa fa-remove"></i> Delete
                                        </button>


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
                                                <s:form action="uploadAttachment" enctype="multipart/form-data">
                                                    <tr>
                                                        <td>Attachment</td>
                                                        <td>
                                                            <s:if test="%{missionDTO.status == 'In Progress'}">
                                                                <s:if test="%{missionDTO.attachment == null}">
                                                                    <i>Attachment file must be a file.txt</i>
                                                                </s:if>
                                                                <a href="mission/<s:property value="%{missionDTO.attachment}"/>" 
                                                                   download="<s:property value="%{missionDTO.attachment}"/>">
                                                                    Download Attachment
                                                                </a>
                                                                <s:hidden name="id" value="%{missionDTO.id}"/>
                                                                <s:hidden name="name" value="%{missionDTO.name}"/>
                                                                <s:file name="file"/>
                                                                <s:fielderror/>
                                                                <font color="red" id="requiredFile"></font><br>
                                                                    <button type="submit" class="btn btn-default btn-sm" 
                                                                            onclick="return requiredAttachment()">
                                                                        Upload
                                                                    </button>
                                                                </s:if>
                                                                <s:if test="%{missionDTO.status != 'In Progress'}">
                                                                    <s:if test="%{missionDTO.attachment != null}">
                                                                        <a href="mission/<s:property value="%{missionDTO.attachment}"/>" 
                                                                           download="<s:property value="%{missionDTO.attachment}"/>">
                                                                            Download Attachment
                                                                        </a>
                                                                    </s:if>
                                                                </s:if>
                                                        </td>
                                                    </tr>
                                                </s:form>
                                                <tr>
                                                    <td>Report</td>
                                                    <td>
                                                        <s:if test="%{missionDTO.report != null}">
                                                            <span class="fa fa-file fa-2x"></span>
                                                            <a href="mission/<s:property value="%{missionDTO.report}"/>" 
                                                               download="<s:property value="%{missionDTO.report}"/>">
                                                                Download Report
                                                            </a>
                                                        </s:if>
                                                        <s:if test="%{missionDTO.report == null}">
                                                            Not submit
                                                        </s:if>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Submit Time</td>
                                                    <td>
                                                        <s:property value="%{missionDTO.submitTime}"/>
                                                    </td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="col-md-12">
                                        <s:form action="judgeMission">
                                            <s:hidden name="id" value="%{missionDTO.id}"/>
                                            <div class="col-md-4">
                                                <select name="result" class="form-control">
                                                    <option value="Success">Success</option>
                                                    <option value="Failed">Failed</option>
                                                </select>
                                            </div>
                                            <button type="submit" class="btn btn-success">
                                                Judge
                                            </button>
                                        </s:form>
                                    </div>


                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Member 
                                    <s:if test="%{missionDTO.status == 'In Progress'}">
                                        <s:url var="view" value="viewMissionDetail">
                                            <s:param name="id" value="%{missionDTO.id}"/>
                                            <s:param name="action" value="'edit'"/>
                                        </s:url>
                                        <s:a href="%{view}">
                                            <span class="fa fa-edit" title="Edit members in mission"></span>
                                        </s:a>
                                    </s:if> 
                                </div>
                                <div class="panel-body">
                                    <s:if test="%{membersDTO != null}">
                                        <s:if test="%{membersDTO.size > 0}">
                                            <s:iterator value="%{membersDTO}" var="member">
                                                <div class="panel panel-info">
                                                    <div class="panel-heading">
                                                        <a href="#<s:property value="username"/>"
                                                           data-toggle = "collapse">
                                                            <s:property value="firstName"/> <s:property value="lastName"/>
                                                        </a>
                                                    </div>
                                                    <div class="panel-collapse collapse"
                                                         id="<s:property value="username"/>">
                                                        <div class="panel-body">
                                                            <div class="col-md-6 text-center">
                                                                <s:url var="view" value="viewMemberDetail">
                                                                    <s:param name="username" value="username"/>
                                                                    <s:param name="action" value="'view'"/>
                                                                </s:url>
                                                                <s:a href="%{view}">
                                                                    <img src="img/member/<s:property value="avatar"/>"
                                                                         class="img-responsive img-thumbnail"/>
                                                                </s:a>

                                                            </div>
                                                            <s:if test="%{equipsDTO != null}">
                                                                <s:if test="%{equipsDTO.size > 0}">
                                                                    <s:iterator value="%{equipsDTO}" var="equip">
                                                                        <s:if test="%{#equip.owner == #member.username}">
                                                                            <div class="col-md-6 text-center">
                                                                                <img src="img/equipment/<s:property value="%{#equip.img}"/>"
                                                                                     class="img-responsive"/>
                                                                                <label class="label label-default">
                                                                                    <s:property value="%{#equip.name}"/>
                                                                                </label>
                                                                            </div>
                                                                        </s:if>
                                                                    </s:iterator>
                                                                </s:if>
                                                            </s:if>

                                                        </div>
                                                    </div>

                                                </div>
                                            </s:iterator>

                                        </s:if>
                                    </s:if>


                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" 
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" 
                                            aria-hidden="true">&times;</button>
                                    <h4 class="modal-title" id="myModalLabel">Are you sure?</h4>
                                </div>
                                <div class="modal-body">
                                    Data of mission <i class="text-danger"><s:property value="%{missionDTO.name}"/></i> will be lost!
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <s:url var="delete" value="deleteMission">
                                        <s:param name="id" value="%{missionDTO.id}"/>

                                    </s:url>
                                    <s:a href="%{delete}">
                                        <button class="btn btn-warning">Delete</button>
                                    </s:a>

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

    </body>
</html>