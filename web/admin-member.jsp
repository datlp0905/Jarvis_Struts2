<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Members Management</title>
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
                        <li class="active">Members</li>
                    </ol>
                </div>
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading"> Member List </div>
                                <div class="row">
                                    <div class="panel-body"> 
                                        <!--Search Button-->
                                        <div class="col-md-4">
                                            <s:form action="searchMember" cssClass="form-inline">
                                                <div class="input-group">
                                                    <s:textfield cssClass="form-control" placeholder="Search full name" name="searchValue"/>
                                                    <div class="input-group-btn">
                                                        <button type="submit" class="btn btn-info" onclick="return searchMemberRequired()">
                                                            <span class="fa fa-search"></span>
                                                        </button>
                                                    </div>
                                                </div>
                                                <p class="text-danger" id="search-required"></p>
                                            </s:form> 
                                        </div>
                                        <!--Add Button-->
                                        <div class="col-md-8 text-right"> 
                                            <a href="admin-member-insert.jsp" title="Add a member">
                                                <button class="btn btn-info">
                                                    Add <span><i class="glyphicon glyphicon-plus"></i></span>
                                                </button>
                                            </a> 
                                        </div>
                                        <div class="col-md-12 break-line"></div>
                                        <div class="row">
                                            <s:iterator value="%{listMembers}">
                                                <a href="viewMemberDetail?username=<s:property value="username"/>&action=view">
                                                    <div class="col-md-4 text-center">
                                                        <div class="avatar">
                                                            <img src="img/member/<s:property value="avatar"/>"
                                                                 alt="<s:property value="firstName"/> <s:property value="lastName"/>"
                                                                 class="img-responsive img-thumbnail img-avatar"><br>
                                                                <label class="label label-default">
                                                                    <s:property value="firstName"/> <s:property value="lastName"/>
                                                                </label>
                                                        </div>
                                                    </div>
                                                </a>
                                            </s:iterator>  
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
    </body>
</html>