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
                            <s:url var="view" value="viewMissionDetail">
                                <s:param name="id" value="%{missionDTO.id}"/>
                                <s:param name="action" value="'view'"/>
                            </s:url>
                            <s:a href="%{view}">
                                <s:property value="%{missionDTO.name}"/>
                            </s:a>
                        </li>
                        <li class="active">
                            Update Mission
                        </li>
                    </ol> 

                </div>
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Mission Information
                                </div>

                                <div class="panel-body">
                                    <div class="col-md-6">
                                        <span class="text-success"><s:property value="%{#request.UPDATE}"/></span>
                                        <s:form action="updateMission">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <s:hidden name="id" value="%{missionDTO.id}"/>
                                                    <span class="input-group-addon">Name</span>
                                                    <s:textfield placeholder="Name" name="name"
                                                                 cssClass="form-control"
                                                                 value="%{missionDTO.name}"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input-group">

                                                    <s:textarea name="description" id="" cols="300" rows="10"
                                                                cssClass="form-control" placeholder="Description"
                                                                value="%{missionDTO.description}"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">Place</span>
                                                    <s:textfield placeholder="Place" name="place"
                                                                 cssClass="form-control"
                                                                 value="%{missionDTO.place}"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">End time</span>
                                                    <input type="date" name="endTime" class="form-control" 
                                                           value="<s:property value="%{year}"/>-<s:property value="%{month}"/>-<s:property value="%{day}"/>">
                                                </div>
                                            </div>
                                                <button type="submit" class="btn btn-info btn-block">Update</button>
                                        </s:form>
                                    </div>
                                    <div class="col-md-6">
                                        <img src="img/mission1.jpg" alt="" class="img-responsive img-thumbnail">
                                    </div>
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