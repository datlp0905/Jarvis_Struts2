<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <title>Member | Detail</title>
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
                            <a class="active-menu" href="loadAllMember"><i class="fa fa-users"></i> Members </a>
                        </li> 
                        <li>
                            <a href="loadAllMission"><i class="fa fa-tasks"></i> Missions </a>
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
                        Member detail
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="loadAdminIndex">Home</a></li>
                        <li><a href="loadAllMember">Members</a></li>
                        <li class="active">
                            <s:property value="%{dto.firstName}"/> <s:property value="%{dto.lastName}"/>
                        </li>
                    </ol> 

                </div>
                <div id="page-inner">

                    <div class="row">
                        <div class="col-md-3">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                            <img src="img/member/<s:property value="%{dto.avatar}"/>"
                                                 alt="<s:property value="%{dto.firstName}"/> <s:property value="%{dto.lastName}"/>"
                                                 class="img-responsive img-rounded">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-body text-right">
                                        <s:if test="%{dto == null}">
                                            This member was banned so that the information could not be shown
                                        </s:if>
                                        <s:if test="%{dto != null}">
                                            <a href="viewMemberDetail?username=<s:property value="%{dto.username}"/>&action=update">
                                                <button class="btn btn-default"><span class="fa fa-pencil"></span> Edit</button> 
                                            </a>
                                            <a href="admin-member-resetpassword.jsp?username=<s:property value="%{dto.username}"/>">
                                                <button class="btn btn-info">
                                                    <span class="fa fa-refresh"></span> Reset password
                                                </button>
                                            </a>
                                            <button class="btn btn-warning" data-toggle="modal"
                                                    data-target="#myModal"><span class="fa fa-ban"></span> Ban</button>
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
                                            No. Missions complete:<br>
                                            No. Equipments:
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
                                        <div class="border-bottom text-center">10</div>
                                        <div class="border-bottom text-center">10</div>
                                    </div>

                                    </div>
                                    </div>
                                    </div>

                                    </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-body" id="member-header">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h4 class="modal-title" id="myModalLabel">Are you sure?</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <s:if test="%{isWorking}">
                                                        <s:property value="%{dto.firstName}"/> is working in a mission. Please wait for the end of the mission!
                                                    </s:if>
                                                    <s:if test="%{!isWorking}">
                                                        <s:property value="%{dto.firstName}"/> cannot login anymore!
                                                    </s:if>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <s:if test="%{!isWorking}">
                                                        <s:url var="ban" value="banMember">
                                                            <s:param name="username" value="%{dto.username}"/>
                                                            <s:param name="action" value="'loadAll'"/>
                                                            <s:param name="searchValue" value="%{searchValue}"/>
                                                        </s:url>
                                                        <s:a href="%{ban}">
                                                            <button type="submit" class="btn btn-warning">Ban</button>
                                                        </s:a>
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