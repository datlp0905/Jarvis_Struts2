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
                        Dashboard <small>Welcome <s:property value="%{#session.FIRSTNAME}"/></small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="getOnWorkingMission">Home</a></li>
                        <li>Dashboard</li>
                    </ol> 

                </div>
                <div id="page-inner">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">On Working Mission</div>
                                <div class="panel-body">
                                    <s:if test="%{mission != null}">
                                        <s:url var="viewDetail" value="viewMemberMissionDetail">
                                            <s:param name="id" value="%{mission.id}"/>
                                        </s:url>
                                        <s:a href="%{viewDetail}">
                                            <div class="col-md-12">
                                                <div class="col-md-12 mission">
                                                    <span class="mission-title label label-info">
                                                        <s:property value="%{mission.name}"/>
                                                    </span><br>
                                                </div>
                                            </div>
                                        </s:a>
                                    </s:if>
                                    <s:if test="%{mission == null}">
                                        <span class="text-warning">You have no mission to perform</span>
                                    </s:if>
                                </div>
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