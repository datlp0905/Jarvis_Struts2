<%@taglib uri="/struts-tags" prefix="s"%>
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <%@include file="metalink.jsp" %>
        <title>Dashboard</title>
    </head>

    <body>
        <div id="wrapper">
            <%@include file="header.jsp" %>
            <!--/. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav" id="main-menu">

                        <li>
                            <a class="active-menu" href="loadAdminIndex"><i class="fa fa-dashboard"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="loadAllMember"><i class="fa fa-users"></i> Members </a>
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
                        Dashboard <small>Welcome <s:property value="%{#session.FIRSTNAME}"/></small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="loadAdminIndex">Home</a></li>
                        <li>Dashboard</li>
                    </ol> 

                </div>
                <div id="page-inner">

                    <div class="row">
                        
                        <div class="col-md-4">
                            <div class="board">
                                <div class="panel panel-default" style="height: 120px;">
                                    <div class="number">
                                        <h3>
                                            <h3><s:property value="countMember"/></h3>
                                            <small>Total members</small>
                                        </h3>
                                    </div>
                                    <div class="icon">
                                        <i class="fa fa-users red"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="board">
                                <div class="panel panel-default" style="height: 120px;">
                                    <div class="number">
                                        <h3>
                                            <h3><s:property value="countMission"/></h3>
                                            <small>Total Missions</small>
                                        </h3>
                                    </div>
                                    <div class="icon">
                                        <i class="fa fa-tasks blue"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="board">
                                <div class="panel panel-default" style="height: 120px;">
                                    <div class="number">
                                        <h3>
                                            <h3><s:property value="countEquip"/></h3>
                                            <small>Total Equipments</small>
                                        </h3>
                                    </div>
                                    <div class="icon">
                                        <i class="fa fa-gavel yellow"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-md-12" id="index">
                                <a href="loadAllMember">
                                    <div class="col-md-4 text-center">
                                        <div class="mybox">
                                            <div>
                                                Members Management<br>
                                                    <div class="icon">
                                                        <i class="fa fa-users fa-5x"></i>
                                                    </div>
                                                    
                                            </div>
                                        </div>
                                        
                                    </div>
                                </a>
                                   <a href="loadAllMission">
                                    <div class="col-md-4 text-center">
                                        <div class="mybox">
                                            <div>
                                                Mission Management<br>
                                                    <div class="icon">
                                                        <i class="fa fa-tasks fa-5x"></i>
                                                    </div>
                                                    
                                            </div>
                                        </div>
                                        
                                    </div>
                                </a>
                                <a href="loadAllEquip">
                                    <div class="col-md-4 text-center">
                                        <div class="mybox">
                                            <div>
                                                Equipment Management<br>
                                                    <div class="icon">
                                                        <i class="fa fa-gavel fa-5x"></i>
                                                    </div>
                                                    
                                            </div>
                                        </div>
                                        
                                    </div>
                                </a>
                            </div>
                        </div>
                        
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