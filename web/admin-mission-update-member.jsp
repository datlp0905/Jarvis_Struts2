<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <title>Mission | Update</title>
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
                        <li>
                            <a href="viewMissionDetail?action=view&id=<s:property value="%{missionDTO.id}"/>">
                                <s:property value="%{missionDTO.name}"/>
                            </a>
                        </li>
                        <li class="active">
                            Edit member in mission
                        </li>
                    </ol> 

                </div>
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Members in mission
                                </div>
                                <div class="panel-body">
                                    <s:iterator value="%{membersDTO}">
                                        <div class="col-md-3 text-center">
                                            <label class="label label-default mission-title">
                                                <s:property value="%{firstName}"/> <s:property value="%{lastName}"/>
                                            </label>
                                            <img src="img/member/<s:property value="%{avatar}"/>" 
                                                 class="img-responsive img-thumbnail"/>
                                            <s:if test="%{membersDTO.size > 1}">
                                                <button class="btn btn-warning btn-sm" 
                                                        data-toggle="modal" 
                                                        data-target="#myModal<s:property value="%{username}"/>">
                                                    Remove
                                                </button>
                                            </s:if>   
                                        </div> 
                                        <div class="modal fade" id="myModal<s:property value="%{username}"/>" 
                                             tabindex="-1" role="dialog" aria-labelledby="myModalLabel" 
                                             aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" 
                                                                aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title" id="myModalLabel">Are you sure?</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <s:property value="%{firstName}"/> <s:property value="%{lastName}"/> will leave 
                                                        team and cannot support for this mission.
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        <s:url var="delete" value="deleteMemberMission">
                                                            <s:param name="id" value="%{missionDTO.id}"/>
                                                            <s:param name="username" value="%{username}"/>
                                                        </s:url>
                                                        <s:a href="%{delete}">
                                                            <button class="btn btn-warning">Remove</button>
                                                        </s:a>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </s:iterator>
                                    <s:if test="%{membersAvailable.size > 0}">
                                        <s:if test="%{membersDTO.size < 4}">
                                            <div class="col-md-3 text-center">
                                                <button class="btn btn-info" title="Add a member to this mission"
                                                        data-toggle="modal" data-target="#addMember">
                                                    Add <span class="fa fa-plus"></span>
                                                </button>
                                            </div>
                                            <div class="modal fade" id="addMember"
                                                 tabindex="-1" role="dialog" aria-labelledby="myModalLabel" 
                                                 aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" 
                                                                    aria-hidden="true">&times;</button>
                                                            <h4 class="modal-title" id="myModalLabel">
                                                                Choose a suitable member
                                                            </h4>
                                                        </div>
                                                        <s:form action="insertMemberMission">
                                                            <div class="modal-body">
                                                                <s:hidden name="id" value="%{missionDTO.id}"/>;
                                                                <s:select name="username" 
                                                                          list="membersAvailable"
                                                                          cssClass="form-control"/>
                                                                <span class="text-danger" id="requiredMember"></span>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                                                                <button type="submit" class="btn btn-info">
                                                                    Add
                                                                </button>
                                                            </div>
                                                        </s:form>

                                                    </div>
                                                </div>
                                            </div> 
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

    </body>
</html>