<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <title>Your Equipment</title>
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
                        <li class="active">
                            Equipments
                        </li>
                    </ol> 

                </div>
                <div id="page-inner">
                    <div class="row">    
                        <div class="col-md-12">
                            <div class="panel panel-info">
                                <div class="panel-heading">Your equipments</div>
                                <div class="panel-body"> 
                                    <s:if test="%{listEquips != null}">
                                        <s:if test="%{listEquips.size > 0}">
                                            <s:iterator value="%{listEquips}">

                                                <a href="viewMemberEquipDetail?id=<s:property value="id"/>">
                                                    <div class="col-md-4 text-center">
                                                        <div class="avatar">
                                                            <img src="img/equipment/<s:property value="img"/>"
                                                                 class="img-responsive img-thumbnail img-avatar"><br>
                                                                    <label class="label label-default">
                                                                        <s:property value="name"/>
                                                                    </label>
                                                                    </div>
                                                                    </div>
                                                                    </a>

                                            </s:iterator>
                                                            </s:if>
                                                            <s:if test="%{listEquips.size == 0}">
                                                                <span class="text-info">You have no equipment</span>
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