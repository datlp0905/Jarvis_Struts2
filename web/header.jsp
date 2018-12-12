<%-- 
    Document   : header
    Created on : Jun 24, 2018, 11:49:43 AM
    Author     : DAT
--%>
<%@taglib uri="/struts-tags" prefix="s"%>
<nav class="navbar navbar-default top-navbar" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="loadAdminIndex"><strong><i class="icon fa fa-star-half-o"></i> Avenger</strong></a>
    </div>

    <ul class="nav navbar-top-links navbar-right">
        <!-- /.dropdown -->
        <li class="dropdown">
            <button class="btn btn-danger navbar-btn dropdown-toggle" 
                    data-toggle="dropdown" id="my-btn-dropdown">
                <s:property value="%{#session.FIRSTNAME}"/> <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu">
                <s:if test="%{#session.ROLE == 'Member'}">
                    <li>
                        <a href="viewProfile?username=<s:property value="%{#session.USERNAME}"/>">
                            <i class="fa fa-user"></i> View Profile
                        </a>
                    </li>
                    <li>
                        <a href="member-changepass.jsp">
                            <i class="fa fa-refresh"></i> Change Password
                        </a>
                    </li>
                </s:if>
                <s:if test="%{#session.ROLE == 'Admin'}">
                    <li>
                        <a href="admin-changepass.jsp">
                            <i class="fa fa-refresh"></i> Change Password
                        </a>
                    </li>
                </s:if>
                <li class="divider"></li>
                <li><a href="logout?username=<s:property value="%{#session.USERNAME}"/>">
                        <i class="fa fa-sign-out"></i> Sign out</a>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
</nav>
