<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Members | Search Page</title>
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
                        <li> <a class="active-menu"  href="loadAllMember"><i class="fa fa-users"></i> Members </a> </li>
                        <li> <a href="loadAllMission"><i class="fa fa-tasks"></i> Missions </a> </li>
                        <li> <a href="loadAllEquip"><i class="fa fa-gavel"></i> Equipments </a> </li>
                    </ul>
                </div>
            </nav>
            <!-- /. NAV SIDE  -->

            <div id="page-wrapper">
                <div class="header">
                    <h1 class="page-header"> Member Management </h1>
                    <ol class="breadcrumb">
                        <li><a href="loadAdminIndex">Home</a></li>
                        <li><a href="loadAllMember">Member</a></li>
                        <li class="active">Search</li>
                    </ol>
                </div>
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading"> Search Member </div>
                                <div class="row">
                                    <div class="panel-body"> 
                                        <!--Search Button-->
                                        <div class="col-md-12">
                                            <s:form action="searchMember" cssClass="form-inline" onsubmit="return searchMemberRequired()">
                                                <div class="input-group col-md-12"> 
                                                    <s:textfield cssClass="form-control" placeholder="Search full name"
                                                                 name="searchValue"/>
                                                </div>
                                                <p class="text-danger" id="search-required"></p>
                                            </s:form> 
                                        </div>
                                        <div class="col-md-12">
                                            <s:property value="%{#request.delete}"/>
                                        </div>
                                        <div class="col-md-12 table-responsive">
                                            <s:if test="%{listMembers != null}">
                                                <s:if test="%{listMembers.size > 0}">
                                                    <table class="table table-striped table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th class="col-md-1">No.</th>
                                                                <th class="col-md-1">Username</th>
                                                                <th class="col-md-5">Full name</th>
                                                                <th class="clo-md-3">Hero name</th>
                                                                <th class="col-md-2">Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <s:iterator var="dto" value="%{listMembers}" status="counter">
                                                                <tr>
                                                                    <td><s:property value="%{#counter.count}"/></td>
                                                                    <td><s:property value="%{#dto.username}"/></td>
                                                                    <td><s:property value="%{#dto.lastName}"/> 
                                                                        <s:property value="%{#dto.firstName}"/></td>
                                                                    <td><s:property value="%{#dto.heroName}"/></td>
                                                                    <td>
                                                                        <s:url var="viewdetail" value="viewMemberDetail">
                                                                            <s:param name="username" value="%{username}"/>
                                                                            <s:param name="action" value="'view'"/>
                                                                        </s:url>
                                                                        <s:a href="%{viewdetail}">
                                                                            <button class="btn btn-info btn-xs">View detail</button>
                                                                        </s:a>
                                                                        <button class="btn btn-warning btn-xs" data-toggle="modal"
                                                                                data-target="#myModal<s:property value="%{username}"/>"
                                                                                title="Ban"><span class="fa fa-ban"></span>
                                                                        </button>
                                                                        <div class="modal fade" id="myModal<s:property value="%{username}"/>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                                            <div class="modal-dialog">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                                        <h4 class="modal-title" id="myModalLabel">Are you sure?</h4>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <s:property value="%{firstName}"/> cannot login anymore!
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                                        <s:url var="ban" value="banMember">
                                                                                            <s:param name="username" value="%{username}"/>
                                                                                            <s:param name="action" value="'search'"/>
                                                                                            <s:param name="searchValue" value="%{searchValue}"/>
                                                                                        </s:url>
                                                                                        <s:a href="%{ban}">
                                                                                            <button type="submit" class="btn btn-warning">Ban</button>
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
                                                <s:if test="%{listMembers.size == 0}">
                                                    No member found!
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