<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Missions Management</title>
        <%@include file="metalink.jsp" %>
    </head>

    <body>
        <div id="wrapper">
            <%@include file="header.jsp" %>
            <!--/. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav" id="main-menu">
                        <li> <a href="loadAdminIndex"><i class="fa fa-dashboard"></i> Dashboard</a> </li>
                        <li> <a href="loadAllMember"><i class="fa fa-users"></i> Members </a> </li>
                        <li> <a class="active-menu" href="loadAllMission"><i class="fa fa-tasks"></i> Missions </a> </li>
                        <li> <a href="loadAllEquip"><i class="fa fa-gavel"></i> Equipments </a> </li>
                    </ul>
                </div>
            </nav>
            <!-- /. NAV SIDE  -->

            <div id="page-wrapper">
                <div class="header">
                    <h1 class="page-header"> Mission Management </h1>
                    <ol class="breadcrumb">
                        <li><a href="loadAdminIndex">Home</a></li>
                        <li class="active">Mission</li>
                    </ol>
                </div>
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <!--Search Button-->
                                    <div class="col-md-4">
                                        <s:form action="searchMission" cssClass="form-inline">
                                            <div class="input-group">
                                                <s:textfield cssClass="form-control" placeholder="Search name" name="searchValue"/>
                                                <div class="input-group-btn">
                                                    <button type="submit" class="btn btn-info" onclick="return searchMissionRequired()">
                                                        <span class="fa fa-search"></span>
                                                    </button>
                                                </div>
                                            </div>
                                                <br><span class="text-danger" id="search-required"></span>
                                        </s:form> 
                                    </div>
                                    <!--Add Button-->
                                    <div class="col-md-8 text-right"> 
                                        <a href="initMission" title="Create a mission">
                                            <button class="btn btn-info">
                                                Add <span><i class="glyphicon glyphicon-plus"></i></span>
                                            </button>
                                        </a> 
                                    </div>
                                </div>
                            </div>
                        </div>
                        <s:if test="%{listMissionsDone != null}">

                            <div class="col-md-12">
                                <div class="panel panel-warning">
                                    <div class="panel-heading">
                                        Missions need to check
                                    </div>
                                    <div class="panel-body">
                                        <s:if test="%{listMissionsDone.size > 0}">
                                            <s:iterator value="%{listMissionsDone}">
                                                <s:url var="viewDetail" value="viewMissionDetail">
                                                    <s:param name="action" value="'view'"/>
                                                    <s:param name="id" value="%{id}"/>
                                                </s:url>
                                                <s:a href="%{viewDetail}">
                                                    <div class="col-md-12">
                                                        <div class="col-md-12 mission">
                                                            <span class="mission-title label label-info">
                                                                <s:property value="name"/>
                                                            </span><br>
                                                                <div class="col-md-6 col-md-offset-6">
                                                                    <div class="progress">
                                                                        <div class="progress-bar progress-bar-striped active" role="progressbar"
                                                                             aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
                                                                            Done
                                                                        </div>
                                                                    </div> 
                                                                </div>
                                                        </div>
                                                    </div>
                                                </s:a>
                                            </s:iterator>
                                        </s:if>
                                        <s:if test="%{listMissionsDone.size == 0}">
                                            Have no mission to check
                                        </s:if>
                                    </div>
                                </div>
                            </div>


                        </s:if>
                        <div class="col-md-12">
                            <div class="panel panel-info">
                                <div class="panel-heading"> 
                                    Missions Doing 
                                </div>
                                <div class="row">
                                    <div class="panel-body"> 
                                        <div class="col-md-12">
                                            <s:if test="%{listMissions != null}">
                                                <s:if test="%{listMissions.size > 0}">
                                                    <s:iterator value="%{listMissions}">
                                                        <s:url var="viewDetail" value="viewMissionDetail">
                                                            <s:param name="action" value="'view'"/>
                                                            <s:param name="id" value="%{id}"/>
                                                        </s:url>
                                                        <s:a href="%{viewDetail}">
                                                            <div class="col-md-12">
                                                                <div class="col-md-12 mission">
                                                                    <span class="mission-title label label-info">
                                                                        <s:property value="name"/>
                                                                    </span><br>
                                                                        <div class="col-md-6 col-md-offset-6">
                                                                            <div class="progress">
                                                                                <div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar"
                                                                                     aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
                                                                                    In progress
                                                                                </div>
                                                                            </div> 
                                                                        </div>
                                                                </div>
                                                            </div>
                                                        </s:a>
                                                    </s:iterator>
                                                </s:if> 
                                                <s:if test="%{listMissons.size == 0}">
                                                    There is no mission working!
                                                </s:if>
                                            </s:if>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="panel panel-info">
                                <div class="panel-heading"> 
                                    Finished Missions 
                                </div>
                                <div class="row">
                                    <div class="panel-body"> 
                                        <div class="col-md-12">
                                            <s:if test="%{listMissionsFinish != null}">
                                                <s:if test="%{listMissionsFinish.size > 0}">
                                                    <s:iterator value="%{listMissionsFinish}">
                                                        <s:url var="viewDetail" value="viewMissionDetail">
                                                            <s:param name="action" value="'view'"/>
                                                            <s:param name="id" value="%{id}"/>
                                                        </s:url>
                                                        <s:a href="%{viewDetail}">
                                                            <div class="col-md-12">
                                                                <div class="col-md-12 mission">
                                                                    <span class="mission-title label label-info">
                                                                        <s:property value="name"/>
                                                                    </span><br>
                                                                        <div class="col-md-6 col-md-offset-6">
                                                                            <div class="progress">
                                                                                <s:if test="%{status.equals('Success')}">
                                                                                    <div class="progress-bar progress-bar-success" role="progressbar"
                                                                                         aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
                                                                                        <s:property value="%{status}"/>
                                                                                    </div>
                                                                                </s:if>
                                                                                <s:if test="%{status == 'Failed'}">
                                                                                    <div class="progress-bar progress-bar-warning" role="progressbar"
                                                                                         aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
                                                                                        <s:property value="%{status}"/>
                                                                                    </div>
                                                                                </s:if> 
                                                                            </div> 
                                                                        </div>
                                                                </div>
                                                            </div>
                                                        </s:a>
                                                    </s:iterator>
                                                </s:if> 
                                                <s:if test="%{listMissionsFinish.size == 0}">
                                                    There is no mission to show!
                                                </s:if>
                                            </s:if>
                                        </div>

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