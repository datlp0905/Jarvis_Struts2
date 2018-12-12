<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Mission | Search Page</title>
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
                        <li><a href="loadAllMission">Mission</a></li>
                        <li class="active">Search</li>
                    </ol>
                </div>
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading"> Search Mission </div>
                                <div class="row">
                                    <div class="panel-body"> 
                                        <!--Search Button-->
                                        <div class="col-md-12">
                                            <s:form action="searchMission" cssClass="form-inline" onsubmit="return searchMissionRequired()">
                                                <div class="input-group col-md-12"> 
                                                    <s:textfield cssClass="form-control" placeholder="Search name"
                                                                 name="searchValue"/>
                                                </div>
                                                <p class="text-danger" id="search-required"></p>
                                            </s:form> 
                                        </div>

                                        <div class="col-md-12 table-responsive">
                                            <s:if test="%{listMissions != null}">
                                                <s:if test="%{listMissions.size > 0}">
                                                    <table class="table table-striped table-hover">
                                                        <thead>
                                                            <tr class="text-center">
                                                                <th>ID</th>
                                                                <th>Name</th>
                                                                <th>Place</th>
                                                                <th>Status</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <s:iterator value="%{listMissions}">
                                                                <tr>
                                                                    <td>
                                                                        <s:property value="%{id}"/>
                                                                    </td>
                                                                    <td><s:property value="%{name}"/></td>
                                                                    <td><s:property value="%{place}"/></td>
                                                                    <td><s:property value="%{status}"/></td>
                                                                    <td>
                                                                        <s:url var="viewdetail" value="viewMissionDetail">
                                                                            <s:param name="id" value="%{id}"/>
                                                                            <s:param name="action" value="'view'"/>
                                                                        </s:url>
                                                                        <s:a href="%{viewdetail}">
                                                                            <button class="btn btn-info btn-xs">View detail</button>
                                                                        </s:a>
                                                                        <button class="btn btn-warning btn-xs" data-toggle="modal"
                                                                                data-target="#myModal<s:property value="%{id}"/>"
                                                                                title="Delete"><span class="fa fa-ban"></span>
                                                                        </button>
                                                                        <div class="modal fade" id="myModal<s:property value="%{id}"/>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                                            <div class="modal-dialog">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                                        <h4 class="modal-title" id="myModalLabel">Are you sure?</h4>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        Information of Mission <i class="text-danger"><s:property value="%{name}"/></i> will be lost.
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                                                                                        <s:url var="delete" value="deleteMission">
                                                                                            <s:param name="id" value="%{id}"/>
                                                                                            <s:param name="searchValue" value="%{searchValue}"/>
                                                                                        </s:url>
                                                                                        <s:a href="%{delete}">
                                                                                            <button class="btn btn-warning">Delete</button>
                                                                                        </s:a>
                                                                                        
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </s:iterator> 
                                                        </tbody>
                                                    </table>
                                                </s:if>
                                                <s:if test="%{listMissions.size == 0}">
                                                    No mission found!
                                                </s:if>
                                            </s:if>      
                                        </div>
                                        <div class="col-md-4 col-md-offset-4 text-center">
                                            <ul class="pagination">
                                                <li><a href="#"><i class="fa fa-angle-double-left"></i></a></li>
                                                <li><a href="#">1</a></li>
                                                <li><a href="#">2</a></li>
                                                <li><a href="#">3</a></li>
                                                <li><a href="#"><i class="fa fa-angle-double-right"></i></a></li>
                                            </ul>
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
        <script src="assets/js/myJS.js" type="text/javascript"></script>
    </body>
</html>