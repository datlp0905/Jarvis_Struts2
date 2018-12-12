<%@taglib uri="/struts-tags" prefix="s"%>
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <%@include file="metalink.jsp" %>
        <title>Change Password</title>
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
                            <a href="loadMissionHistory">
                                <i class="fa fa-tasks"></i> Missions History
                            </a>
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
                        Change Password
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="getOnWorkingMission">Home</a></li>
                        <li>Change Password</li>
                    </ol> 

                </div>
                <div id="page-inner">

                    <div class="row">
                        <%@include file="changepass.jsp" %>
                    </div>
                    <!-- /. ROW  -->


                    <footer><p>All right reserved. Template by: <a href="http://webthemez.com">WebThemez.com</a></p>


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
    </body>

</html>