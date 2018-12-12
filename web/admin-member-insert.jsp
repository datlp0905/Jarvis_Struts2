<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Member | Add new member</title>
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
                    <h1 class="page-header">
                        Add a new member
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="loadAdminIndex">Home</a></li>
                        <li><a href="loadAllMember">Members</a></li>
                        <li class="active">Add new member</li>
                    </ol> 

                </div>
                <div id="page-inner">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading text-center">
                                    New member's Information
                                </div>
                                <div class="panel-body">
                                    <div class="col-md-6 col-md-offset-3">
                                        <div class="text-success col-md-12">
                                            <s:property value="%{#request.RESULT}"/>
                                        </div>
                                        <s:form action="insertMember">
                                            <div class="form-group col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                        <s:textfield cssClass="form-control" 
                                                                     placeholder="Username" name="username" id="txtUsername"
                                                                     onkeyup="requireUsername()"/>
                                                </div>
                                                <div class="text-danger" id="usernameError">
                                                    <s:if test="%{exception.message.contains('duplicate')}">
                                                        Username <s:property value="%{username}"/> is already existed!
                                                    </s:if>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                                        <s:password cssClass="form-control" 
                                                                    placeholder="Password" name="password" id="txtPassword"
                                                                    onkeyup="requirePassword()"/>
                                                </div>
                                                <div class="text-danger" id="passwordError"></div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                                        <s:password cssClass="form-control" 
                                                                    placeholder="Confirm Password" name="confirm" id="txtConfirm"
                                                                    onkeyup="requireConfirm()"/>
                                                </div>
                                                <div class="text-danger" id="confirmError"></div>
                                            </div>
                                            <div class="form-group col-md-7">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                        <s:textfield cssClass="form-control" 
                                                                     placeholder="First Name" name="firstname" id="txtFirstname"
                                                                     onkeyup="requireFirstname()"/>
                                                </div>
                                                <div class="text-danger" id="firstnameError"></div>
                                            </div>
                                            <div class="form-group col-md-5">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                        <s:textfield cssClass="form-control" 
                                                                     placeholder="Last Name" name="lastname" id="txtLastname"
                                                                     onkeyup="requireLastname()"/>
                                                </div>
                                                <div class="text-danger" id="lastnameError"></div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-calendar"> Birthdate</i></span>
                                                    <input type="date" name="birthdate" id="birthdate" class="form-control">
                                                </div>
                                                <div class="text-danger" id="birthdateError"></div>
                                            </div>
                                            <div class="form-group col-md-7">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                        <s:textfield cssClass="form-control" 
                                                                     placeholder="Hero Name" name="heroname" id="txtHeroname"
                                                                     onkeyup="requireHeroname()"/>
                                                </div>
                                                <div class="text-danger" id="heronameError"></div>
                                            </div>
                                            <div class="form-group col-md-5">
                                                <label class="radio-inline"><input type="radio" name="gender" value="Male"/>Male</label>
                                                <label class="radio-inline"><input type="radio" name="gender" value="Female"/>Female</label>
                                                <div class="text-danger" id="genderError"></div>
                                            </div>

                                            <div class="form-group col-md-12">
                                                <input type="submit" name="action" value="Insert" onclick="return validate()" class="btn btn-info btn-block">
                                            </div>
                                        </s:form>
                                    </div>
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
        <!-- Validate insert form-->
        <script src="assets/js/formValidate.js" type="text/javascript"></script>
    </body>
</html>