<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <title>Member | Reset Password</title>
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
                        <li class="active">Thor Odinson</li>
                    </ol> 

                </div>
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading text-center">Reset Password</div>
                                <div class="panel-body">
                                    <div class="col-md-6 col-md-offset-3">

                                        <s:form action="resetPassword" onsubmit="return resetPassword()">
                                            <s:hidden name="username" value="%{#parameters.username}"/>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-lock "></i></span>
                                                    <s:password placeholder="New password" name="password"
                                                                cssClass="form-control"/>
                                                </div>
                                                <span class="text-danger" id="password"></span>
                                            </div>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-lock "></i></span>
                                                    <s:password placeholder="Confirm password" name="confirm"
                                                                cssClass="form-control"/>
                                                </div>
                                                <span class="text-danger" id="confirm"></span>
                                            </div>
                                                <button type="submit" class="btn btn-info btn-block">
                                                    Reset
                                                </button>
                                        </s:form>
                                            
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