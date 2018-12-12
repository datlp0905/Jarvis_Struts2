<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Equipment | Detail</title>
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
                        <li> <a href="loadAllMember"><i class="fa fa-users"></i> Members </a> </li>
                        <li> <a href="loadAllMission"><i class="fa fa-tasks"></i> Missions </a> </li>
                        <li> <a class="active-menu" href="loadAllEquip"><i class="fa fa-gavel"></i> Equipments </a> </li>
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
                        <li class="active"><s:property value="%{dto.name}"/></li>
                    </ol>
                </div>
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <img src="img/equipment/<s:property value="%{dto.img}"/>" alt="" class="img-responsive">
                                        <s:form action="uploadEquipImg" enctype="multipart/form-data" 
                                                onsubmit="return requiredEquipImg()">
                                            <div class="form-group">
                                                <s:hidden name="id" value="%{dto.id}"/>
                                                <s:file name="img"/>
                                            </div>
                                            <span class="text-danger" id="requiredFile"></span>
                                            <s:fielderror/>
                                            <button type="submit" class="btn btn-default btn-sm">
                                                Upload
                                            </button>
                                        </s:form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    More Infomation
                                </div>
                                <div class="panel-body">
                                    <s:form action="updateEquip" method="post" onSubmit="return checkUpdateEquip()">
                                        <div class="form-group col-md-12">
                                            <span class="text-success"><s:property value="%{#request.SUCCESS}"/></span>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                                    <s:textfield name="id" cssClass="form-control" value="%{dto.id}" readonly="true"/>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-question-circle"></i></span>
                                                    <s:textfield name="name" cssClass="form-control"
                                                                 placeholder="Name" value="%{dto.name}"/>
                                            </div>
                                            <span class="text-danger" id="requiredName"></span>
                                        </div>
                                        <div class="form-group col-md-7">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-balance-scale"></i></span>
                                                    <s:textfield name="weight" cssClass="form-control" 
                                                                 placeholder="Weight" value="%{dto.weight}"/>
                                            </div>
                                            <span class="text-danger" id="requiredWeight"></span>
                                        </div>
                                        <div class="form-group col-md-5 ">
                                            <s:select name="owner" headerKey="-1" headerValue="--- Owner ---"
                                                      list="listMembers" value="defaultOwner"
                                                      cssClass="form-control"/>
                                            <span class="text-danger" id="requiredOwner"></span>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <s:textarea name="description" col="100" rows="5" cssClass="form-control" 
                                                        placeholder="Description" value="%{dto.description}"/>
                                        </div>
                                        <div class="col-md-6 col-md-offset-4">
                                            <div class="btn-group">
                                                <button type="submit" class="btn btn-info">
                                                    <span class="fa fa-edit"> Update</span>
                                                </button>
                                                <button type="button" class="btn btn-warning" 
                                                        data-toggle="modal" data-target="#myModal">
                                                    <span class="fa fa-trash-o"> Delete</span>
                                                </button>
                                            </div>
                                        </div>
                                    </s:form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" 
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" 
                                            aria-hidden="true">&times;</button>
                                    <h4 class="modal-title" id="myModalLabel">Are you sure?</h4>
                                </div>
                                <div class="modal-body">
                                    <s:if test="%{isUsing}">
                                        <i class="text-danger"><s:property value="%{dto.name}"/></i> is used in a mission. Please wait for the end of the mission
                                    </s:if>
                                    <s:if test="%{!isUsing}">
                                        Data of <i class="text-danger"><s:property value="%{dto.name}"/></i> will be lost!
                                    </s:if>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <s:if test="%{!isUsing}">
                                        <s:url var="delete" value="deleteEquip">
                                            <s:param name="id" value="%{dto.id}"/>
                                            <s:param name="searchValue" value="%{searchValue}"/>
                                        </s:url>
                                        <s:a href="%{delete}">
                                            <button class="btn btn-warning">Delete</button>
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