<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <title>Member | Update Member Information</title>
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
                            <a class="active-menu" href="loadAllMember"><i class="fa fa-users"></i> Members </a>
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
                        Member detail
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="loadAdminIndex">Home</a></li>
                        <li><a href="loadAllMember">Members</a></li>
                        <li><a href="viewMemberDetail?username=<s:property value="%{dto.username}"/>&action=view">
                                <s:property value="%{dto.firstName}"/> <s:property value="%{dto.lastName}"/></a>
                        </li>
                        <li class="active">Update</li>
                    </ol> 

                </div>
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="row">
                                        
                                        <div class="col-md-12 text-center">
                                            <img src="img/member/<s:property value="%{dto.avatar}"/>" 
                                                 alt="<s:property value="%{dto.firstName}"/> <s:property value="%{dto.lastName}"/>" 
                                                 class="img-responsive img-rounded">
                                                <s:form action="uploadMemberImage" enctype="multipart/form-data">
                                                    <s:hidden name="username" value="%{dto.username}"/>
                                                    Choose image: <s:file name="image"/>
                                                    <span class="text-danger">*Only accept image file lower 2MB</span><br>
                                                    <button type="submit" class="btn btn-default btn-xs">Upload</button>
                                                </s:form>
                                                <s:fielderror/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <s:form action="updateMember" onsubmit=" return checkUpdateMember()">
                                        <div class="form-group col-md-12">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                    <s:textfield cssClass="form-control" 
                                                                 placeholder="Username" name="username" id="txtUsername"
                                                                 onkeyup="requireUsername()" readonly="true"
                                                                 value="%{dto.username}"/>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-7">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                    <s:textfield cssClass="form-control" 
                                                                 placeholder="First Name" name="firstname"
                                                                 onkeyup="requireFirstname()"
                                                                 value="%{dto.firstName}"/>
                                            </div>
                                            <div class="text-danger" id="firstnameError"></div>
                                        </div>
                                        <div class="form-group col-md-5">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                    <s:textfield cssClass="form-control" 
                                                                 placeholder="Last Name" name="lastname"
                                                                 onkeyup="requireLastname()"
                                                                 value="%{dto.lastName}"/>
                                            </div>
                                            <div class="text-danger" id="lastnameError"></div>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                <input type="date" name="birthdate" class="form-control" title="Birthdate"
                                                       value="<s:property value="%{year}"/>-<s:property value="%{month}"/>-<s:property value="%{day}"/>"/>
                                            </div>
                                            <div class="text-danger" id="birthdateError"></div>
                                        </div>
                                        <div class="form-group col-md-7">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                    <s:textfield cssClass="form-control" 
                                                                 placeholder="Hero Name" name="heroname"
                                                                 onkeyup="requireHeroname()"
                                                                 value="%{dto.heroName}"/>
                                            </div>
                                            <div class="text-danger" id="heronameError"></div>
                                        </div>
                                        <div class="form-group col-md-5">
                                            <label class="radio-inline"><input type="radio" name="gender" value="Male"
                                                                               <s:if test="%{dto.gender == 'Male'}">
                                                                                   checked="true"
                                                                               </s:if>
                                                                               />Male</label>
                                            <label class="radio-inline"><input type="radio" name="gender" value="Female"
                                                                               <s:if test="%{dto.gender != 'Male'}">
                                                                                   checked="true"
                                                                               </s:if>
                                                                               />Female</label>
                                            <div class="text-danger" id="genderError"></div>
                                        </div>

                                        <div class="form-group col-md-12">
                                            <input type="submit" name="action" value="Update" class="btn btn-info btn-block">
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