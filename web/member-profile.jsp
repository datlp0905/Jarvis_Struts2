<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <title>Your Profile</title>
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
                            <a class="active-menu" href="viewProfile"><i class="fa fa-users"></i> Profile </a>
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
                        Profile
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="getOnWorkingMission?username=<s:property value="%{#session.USERNAME}"/>">Home</a></li>
                        <li class="active">
                            Your Profile
                        </li>
                    </ol> 

                </div>
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="panel panel-default">
                                <div class="panel-heading">Avatar</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                            <img src="img/member/<s:property value="%{dto.avatar}"/>"
                                                 alt="<s:property value="%{dto.firstName}"/> <s:property value="%{dto.lastName}"/>"
                                                 class="img-responsive img-rounded">

                                        </div>
                                    </div>
                                </div>
                                <div class="panel-footer">
                                    <s:form action="uploadMemberImgByMember" enctype="multipart/form-data" 
                                            onsubmit="return requiredMemberImg()">
                                        <s:file name="img"/>
                                        <s:fielderror/>
                                        <span class="text-danger">*Only accept image file lower 2MB</span><br>
                                        <span class="text-danger" id="requiredFile"></span>
                                        <button type="submit" class="btn btn-default btn-sm">
                                            Upload avatar
                                        </button>
                                        
                                    </s:form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-body text-right">
                                        <s:if test="%{dto != null}">
                                            <a href="member-changepass.jsp">
                                                <button class="btn btn-info">
                                                    <span class="fa fa-refresh"></span> Change password
                                                </button>
                                            </a>
                                        </s:if>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="panel panel-default">

                                    <div class="panel-body">
                                        <div class="col-md-5 text-right member-title">
                                            USERNAME:<br> 
                                            FULL NAME:<br>
                                            HERO NAME:<br> 
                                            DATE OF BIRTH:<br>  
                                            JOIN DATE:<br>
                                </div>
                                <div class="col-md-5 text-left">
                                    <div class="border-bottom text-center"> 
                                        <s:property value="%{dto.username}"/>
                                        <span class="fa fa-mars"></span>
                                    </div>
                                    <div class="border-bottom text-center">
                                        <s:property value="%{dto.heroName}"/>
                                    </div>
                                    <div class="border-bottom text-center">
                                        <s:property value="%{dto.firstName}"/> <s:property value="%{dto.lastName}"/>
                                    </div>
                                    <div class="border-bottom text-center">
                                        <s:property value="%{dto.birthdate}"/>
                                    </div>
                                    <div class="border-bottom text-center">
                                        <s:property value="%{dto.joinDate}"/>
                                    </div>
                                </div>

                                </div>
                                </div>
                                </div>

                                </div>
                                <div class="col-md-7">
                                    <div class="col-md-12">
                                       <div class="panel panel-default">
                                            <div class="panel-body" id="member-header">

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
                                <script src="assets/js/myJS.js" type="text/javascript"></script>
                                </body>
                                </html>