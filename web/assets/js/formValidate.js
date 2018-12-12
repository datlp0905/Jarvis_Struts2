function requireUsername() {
    var username = document.getElementById("txtUsername").value;
    var msg = document.getElementById("usernameError");
    if(username.length == 0) {
        msg.innerHTML = "Username is required!"
    } else if(username.length < 5) {
        msg.innerHTML = "Username has at least 5 character";
    } else {
        msg.innerHTML = "";
    }
}

function requirePassword() {
    var password = document.getElementById("txtPassword").value;
    var msg = document.getElementById("passwordError");
    if(password.length == 0) {
        msg.innerHTML = "Password is required!"
    } else if(password.length < 6) {
        msg.innerHTML = "Password has at least 6 character";
    } else {
        msg.innerHTML = "";
    }
}

function requireConfirm() {
    var confirm = document.getElementById("txtConfirm").value;
    var password = document.getElementById("txtPassword").value;
    var msg = document.getElementById("confirmError");
    if(confirm.length === 0 || confirm !== password) {
        msg.innerHTML = "Password confirm is not match with the password above"
    } else {
        msg.innerHTML = "";
    }
}

function requireFirstname() {
    var firstname = document.getElementById("txtFirstname").value;
    var msg = document.getElementById("firstnameError");
    if(firstname.length == 0) {
        msg.innerHTML = "First name is required!"
    } else {
        msg.innerHTML = "";
    }
}

function requireLastname() {
    var lastname = document.getElementById("txtLastname").value;
    var msg = document.getElementById("lastnameError");
    if(lastname.length == 0) {
        msg.innerHTML = "Last name is required!"
    } else {
        msg.innerHTML = "";
    }
}

function requireBirthdate() {
    var birthdate = document.getElementById("txtBirthdate").value;
    var msg = document.getElementById("birthdateError");
    if(birthdate.length == 0) {
        msg.innerHTML = "Birthdate is required!"
    } else {
        msg.innerHTML = "";
    }
}

function requireHeroname() {
    var heroname = document.getElementById("txtHeroname").value;
    var msg = document.getElementById("heronameError");
    if(heroname.length == 0) {
        msg.innerHTML = "Hero name is required!"
    } else {
        msg.innerHTML = "";
    }
}

function validate() {
    var username = document.getElementById("txtUsername").value;
    var usernameError = document.getElementById("usernameError");
    var password = document.getElementById("txtPassword").value;
    var passwordError = document.getElementById("passwordError");
    var confirm = document.getElementById("txtConfirm").value;
    var confirmError = document.getElementById("confirmError");
    var firstname = document.getElementById("txtFirstname").value;
    var firstnameError = document.getElementById("firstnameError");
    var lastname = document.getElementById("txtLastname").value;
    var lastnameError = document.getElementById("lastnameError");
    var birthdate = document.getElementById("txtBirthdate").value;
    var birthdateError = document.getElementById("birthdateError");
    var heroname = document.getElementById("txtHeroname").value;
    var heronameError = document.getElementById("heronameError");
    var gender = document.getElementsByName("gender");
    var genderError = document.getElementById("genderError");
    var check = true;
    if(username.length === 0) {
        usernameError.innerHTML = "Username is required!";
        check = false;
    }
    if(password.length === 0) {
        passwordError.innerHTML = "Password is required!";
        check = false;
    }
    if(confirm.length === 0 || confirm !== password) {
        confirmError.innerHTML = "Please confirm your password!"
        check = false;
    }
    if(firstname.length === 0) {
        firstnameError.innerHTML = "First name is required!";
        check = false;
    }
    if(lastname.length === 0) {
        lastnameError.innerHTML = "Last name is required!";
        check = false;
    }
    if(birthdate.length === 0) {
        birthdateError.innerHTML = "Birthdate is required!";
        check = false;
    }
    if(heroname.length === 0) {
        heronameError.innerHTML = "Hero name is required!";
        check = false;
    }
    if(!gender[0].checked && !gender[1].checked) {
        genderError.innerHTML = "Gender is required";
        check = false;
    }
    return check;
}


