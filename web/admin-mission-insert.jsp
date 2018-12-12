<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <title>Mission | Insert</title>
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
                            <a href="loadAllMember"><i class="fa fa-users"></i> Members </a>
                        </li> 
                        <li>
                            <a class="active-menu" href="loadAllMission"><i class="fa fa-tasks"></i> Missions </a>
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
                        Mission detail
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="loadAdminIndex">Home</a></li>
                        <li><a href="loadAllMission">Mission</a></li>
                        <li class="active">
                            Create Mission
                        </li>
                    </ol> 

                </div>
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Mission Information
                                </div>

                                <div class="panel-body">
                                    <div class="col-md-6">
                                        <s:if test="%{members1.size == 0}">
                                            <span class="text-danger">There are no member available for this mission!</span>
                                        </s:if>
                                        <s:form action="insertMission" onsubmit="return checkInsertMission()">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">Name</span>
                                                    <s:textfield placeholder="Name" name="name"
                                                                 cssClass="form-control"/>
                                                </div>
                                                <span class="text-danger" id="requiredName"></span>
                                            </div>
                                            <div class="form-group">
                                                <div class="input-group">

                                                    <s:textarea name="description" id="" cols="300" rows="10"
                                                                cssClass="form-control" placeholder="Description"
                                                                />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">Place</span>
                                                    <s:textfield placeholder="Place" name="place"
                                                                 cssClass="form-control"/>
                                                </div>
                                                <span class="text-danger" id="requiredPlace"></span>
                                            </div>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">End time</span>
                                                    <input type="date" name="endTime" class="form-control">
                                                </div>
                                            </div>

                                            <s:if test="%{members1.size > 0}">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        Choose the number of members:
                                                        <select name="num" id="num" class="form-control" onchange="chooseNoMember()">
                                                            <option value="1">1 Member</option>
                                                            <option value="2">2 Members</option>
                                                            <option value="3">3 Members</option>
                                                            <option value="4">4 Members</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group" id="member1">
                                                    <div class="input-group">
                                                        <s:select name="member1" headerKey="-1" headerValue="Choose member" 
                                                                  list="members1" cssClass="form-control"
                                                                  />
                                                    </div>
                                                </div>
                                                <div class="form-group" id="member2">
                                                    <div class="input-group">
                                                        <s:select name="member2" headerKey="-1" headerValue="Choose member" 
                                                                  list="members2" cssClass="form-control"
                                                                  />
                                                    </div>
                                                </div>
                                                <div class="form-group" id="member3">
                                                    <div class="input-group">
                                                        <s:select name="member3" headerKey="-1" headerValue="Choose member" 
                                                                  list="members3" cssClass="form-control"
                                                                  />
                                                    </div>
                                                </div>
                                                <div class="form-group" id="member4">
                                                    <div class="input-group">
                                                        <s:select name="member4" headerKey="-1" headerValue="Choose member" 
                                                                  list="members4" cssClass="form-control"
                                                                  />
                                                    </div>
                                                </div>
                                                    <input type="submit" class="btn btn-info btn-block"
                                                            value="Create"/>
                  
                                            </s:if>                                            

                                        </s:form>
                                    </div>
                                    <div class="col-md-6">
                                        <img src="img/mission1.jpg" alt="" class="img-responsive img-thumbnail">
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