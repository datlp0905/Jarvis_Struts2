<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Equipment | Insert</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
                    <h1 class="page-header"> Equipment Management </h1>
                    <ol class="breadcrumb">
                        <li><a href="loadAdminIndex">Home</a></li>
                        <li><a href="loadAllEquip">Equipment</a></li>
                        <li class="active">Add new equipment</li>
                    </ol>
                </div>
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <img src="img/equipment.jpg" alt="" class="img-responsive">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    More Infomation
                                </div>
                                <div class="panel-body">
                                    <s:form action="insertEquip" method="post" onSubmit="return checkInsertEquip()">
                                        <div class="form-group col-md-12">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-question-circle"></i></span>
                                                <s:textfield name="name" cssClass="form-control"
                                                             placeholder="Name"/>
                                            </div>
                                            <span class="text-danger" id="requiredName"></span>
                                        </div>
                                        <div class="form-group col-md-7">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-balance-scale"></i></span>
                                                <s:textfield name="weight" cssClass="form-control" 
                                                             placeholder="Weight"/>
                                            </div>
                                            <span class="text-danger" id="requiredWeight"></span>
                                        </div>
                                        <div class="form-group col-md-5 ">
                                            <s:select name="owner" headerKey="-1" headerValue="--- Owner ---"
                                                      list="listMembers"
                                                      cssClass="form-control"/>
                                            <span class="text-danger" id="requiredOwner"></span>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <s:textarea name="description" col="100" rows="5" cssClass="form-control" 
                                                        placeholder="Description"/>
                                        </div>
                                        <div class="col-md-6 col-md-offset-4">
                                            
                                                <button type="submit" class="btn btn-info">
                                                    <span class="fa fa-plus"> Add</span>
                                                </button>
                                            
                                        </div>
                                    </s:form>
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