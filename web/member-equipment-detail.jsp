<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <title>Equipment | Detail</title>
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
                            <a href="getOnWorkingMission"><i class="fa fa-dashboard"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="viewProfile"><i class="fa fa-users"></i> Profile </a>
                        </li> 
                        <li>
                            <a href="loadMissionHistory"><i class="fa fa-tasks"></i> Missions History</a>
                        </li>
                        <li>
                            <a class="active-menu" href="loadMemberEquip"><i class="fa fa-gavel"></i> Your Equipments </a>
                        </li>	
                    </ul>

                </div>

            </nav>
            <!-- /. NAV SIDE  -->

            <div id="page-wrapper">
                <div class="header"> 
                    <h1 class="page-header">
                        Your Equipments
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="getOnWorkingMission?username=<s:property value="%{#session.USERNAME}"/>">Home</a></li>

                        <li>
                            <a href="loadMemberEquip"> Your Equipments </a>
                        </li>

                        <li class="active">
                            <s:property value="dto.name"/>
                        </li>
                    </ol> 

                </div>
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-7 col-md-offset-5">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <img src="img/equipment/<s:property value="%{dto.img}"/>" alt="" class="img-responsive">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4" style="position: fixed;">
                            <div class="panel panel-default">
                                <div class="panel-heading">Equipment Information</div>
                                <div class="panel-body">
                                    <table class="table table-hover table-striped">
                                        <tbody>
                                            <tr>
                                                <td>Name</td>
                                                <td><s:property value="%{dto.name}"/></td>
                                            </tr>
                                            <tr>
                                                <td>Weight</td>
                                                <td><s:property value="%{dto.weight}"/></td>
                                            </tr>
                                            <tr>
                                                <td>Description</td>
                                                <td><s:property value="%{dto.description}"/></td>
                                            </tr>
                                        </tbody>
                                    </table>

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