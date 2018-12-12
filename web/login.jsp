<%@taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Login</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="assets/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="assets/css/loginStyle.css">
        <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">
        <script src="assets/js/myJS.js" type="text/javascript"></script>
        <link href="https://fonts.googleapis.com/css?family=Bungee Hairline" rel="stylesheet">
        <script src="assets/js/bootstrap.min.js"></script>
    </head>

    <body>
        <div class="container-fluid" id="bg-container">
            <div class="row">
                <video loop autoplay="autoplay" muted id="myVideo">
                    <source src="img/backgound1.mp4" type="video/mp4">
                </video>
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <div class="col-md-8 col-md-offset-2" id="login-form">
                            <h1 class="text-center font-header" id="login-title">Welcome to Avengers</h1>
                            <s:form action="login">
                                <div class="form-group">
                                    <div class="input-group"> <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                            <s:textfield name="username" placeholder="Username" 
                                                         cssClass="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group"> <span class="input-group-addon"><i class="fa fa-lock" aria-hidden="true"></i></span>
                                            <s:password name="password" placeholder="Password"
                                                        cssClass="form-control"/>
                                    </div>
                                </div> 

                                <button type="submit" name="action" value="Login" 
                                        class="btn btn-danger btn-block font-header" id="btn-submit"
                                        onclick="return loginRequired()" style="opacity: 0.8">
                                    <span class="font-header">Log in</span>
                                </button>
                            </s:form>
                            <font color="white" id="login-message" class="text-center col-md-12 font-header">
                            <s:property value="%{#request.INVALID}"/>
                            </font>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </body>
</html>
