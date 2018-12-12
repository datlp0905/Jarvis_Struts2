<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <title>Mission History</title>
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
                            <a href="getOnWorkingMission"><i class="fa fa-dashboard"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="viewProfile"><i class="fa fa-users"></i> Profile </a>
                        </li> 
                        <li>
                            <a class="active-menu" href="loadMissionHistory?username=<s:property value="%{#session.USERNAME}"/>"><i class="fa fa-tasks"></i> Missions History</a>
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
                        Mission History
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="getOnWorkingMission?username=<s:property value="%{#session.USERNAME}"/>">Home</a></li>
                        <li class="active">
                            Mission History
                        </li>
                    </ol> 

                </div>
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-body"> 
                                    <!--Search Button-->
                                    <div class="col-md-12">
                                        <s:form action="searchMission" cssClass="form-inline" onsubmit="return searchMissionRequired()">
                                            <div class="input-group col-md-12"> 
                                                <s:textfield cssClass="form-control" placeholder="Search name"
                                                             name="searchValue"/>
                                            </div>
                                            <span class="text-danger" id="search-required"></span>
                                        </s:form> 
                                    </div>  
                                </div>
                            </div>
                        </div>    
                        <div class="col-md-12">
                            <div class="panel panel-info">
                                <div class="panel-heading">All missions</div>
                                <div class="panel-body"> 
                                    <s:if test="%{listMissions != null}">
                                        <s:if test="%{listMissions.size > 0}">
                                            <s:iterator value="%{listMissions}">
                                                <s:url var="view" value="viewMemberMissionDetail">
                                                    <s:param name="action" value="'view'"/>
                                                    <s:param name="id" value="%{id}"/>
                                                </s:url>
                                                <s:a href="%{view}">
                                                    <div class="col-md-6">
                                                        <div class="col-md-12 mission">
                                                            <span class="mission-title label label-info">
                                                                <s:property value="name"/>
                                                            </span><br>
                                                                <div class="col-md-4 col-md-offset-8">
                                                                    <div class="progress">
                                                                        <s:if test="%{status.equals('Success')}">
                                                                            <div class="progress-bar progress-bar-success" role="progressbar"
                                                                                 aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
                                                                                <s:property value="%{status}"/>
                                                                            </div>
                                                                        </s:if>
                                                                        <s:if test="%{status == 'Failed'}">
                                                                            <div class="progress-bar progress-bar-danger" role="progressbar"
                                                                                 aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
                                                                                <s:property value="%{status}"/>
                                                                            </div>
                                                                        </s:if>
                                                                        <s:if test="%{status == 'In Progress'}">
                                                                            <div class="progress-bar progress-bar-info active" role="progressbar"
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
                                        <s:if test="%{listMissions.size == 0}">
                                            <span class="text-info">There is no mission to show</span>
                                        </s:if>
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
        <script src="assets/js/myJS.js" type="text/javascript"></script>
    </body>
</html>