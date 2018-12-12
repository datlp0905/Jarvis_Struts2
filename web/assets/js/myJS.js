function checkUpdateMember() {
    var firtsname = document.getElementById("updateMember_firstname").value;
    var firstnameMsg = document.getElementById("firstnameError");
    var lastname = document.getElementById("updateMember_lastname").value;
    var lastnameMsg = document.getElementById("lastnameError");
    var heroname = document.getElementById("updateMember_heroname").value;
    var heronameMsg = document.getElementById("heronameError");
    var check = true;
    if(firtsname.length === 0) {
        check = false;
        firstnameMsg.innerHTML = "First name is required!";
    } else if(firtsname.length < 5 || firtsname.length > 50) {
        check = false;
        firstnameMsg.innerHTML = "First name must be form 5 to 50 chars!";
    } else {
        firstnameMsg.innerHTML = "";
    }
    if(lastname.length === 0) {
        check = false;
        lastnameMsg.innerHTML = "Last name is required!";
    } else if(lastname.length < 5 || lastname.length > 50) {
        check = false;
        lastnameMsg.innerHTML = "Last name must be form 5 to 50 chars!";
    } else {
        lastnameMsg.innerHTML = "";
    }
    if(heroname.length === 0) {
        check = false;
        heronameMsg.innerHTML = "Last name is required!";
    } else if(heroname.length < 5 || heroname.length > 50) {
        check = false;
        heronameMsg.innerHTML = "Last name must be form 5 to 50 chars!";
    } else {
        heronameMsg.innerHTML = "";
    }
    return check;
}

function checkInsertEquip() {
    var name = document.getElementById("insertEquip_name").value;
    var nameMsg = document.getElementById("requiredName");
    var weight = document.getElementById("insertEquip_weight").value;
    var weightMsg = document.getElementById("requiredWeight");
    var owner = document.getElementById("insertEquip_owner").value;
    var ownerMsg = document.getElementById("requiredOwner");
    var check = true;
    if (name.length === 0) {
        check = false;
        nameMsg.innerHTML = "Name is required";
    } else if (name.length < 5 || name.length > 50) {
        check = false;
        nameMsg.innerHTML = "Name must be from 5 to 50 chars";
    } else {
        nameMsg.innerHTML = "";
    }
    if (weight.length === 0) {
        check = false;
        weightMsg.innerHTML = "Weight is required!";
    } else if (isNaN(weight)) {
        check = false;
        weightMsg.innerHTML = "Weight must be a number!";
    } else if(weight < 0) {
        check = false;
        weightMsg.innerHTML = "Weight must be greater than zero!";
    } else {
        weightMsg.innerHTML = "";
    }
    if (owner === "-1") {
        check = false;
        ownerMsg.innerHTML = "Owner is required!";
    } else {
        ownerMsg.innerHTML = "";
    }
    return check;
}

function checkUpdateEquip() {
    var name = document.getElementById("updateEquip_name").value;
    var nameMsg = document.getElementById("requiredName");
    var weight = document.getElementById("updateEquip_weight").value;
    var weightMsg = document.getElementById("requiredWeight");
    var owner = document.getElementById("updateEquip_owner").value;
    var ownerMsg = document.getElementById("requiredOwner");
    var check = true;
    if (name.length === 0) {
        check = false;
        nameMsg.innerHTML = "Name is required";
    } else if (name.length < 5 || name.length > 50) {
        check = false;
        nameMsg.innerHTML = "Name must be from 5 to 50 chars";
    } else {
        nameMsg.innerHTML = "";
    }
    if (weight.length === 0) {
        check = false;
        weightMsg.innerHTML = "Weight is required!";
    } else if (isNaN(weight)) {
        check = false;
        weightMsg.innerHTML = "Weight must be a number!";
    } else if(weight < 0) {
        check = false;
        weightMsg.innerHTML = "Weight must be greater than zero!";
    } else {
        weightMsg.innerHTML = "";
    }
    if (owner === "-1") {
        check = false;
        ownerMsg.innerHTML = "Owner is required!";
    } else {
        ownerMsg.innerHTML = "";
    }
    return check;
}

function checkInsertMission() {
    var name = document.getElementById("insertMission_name").value;
    var nameMsg = document.getElementById("requiredName");
    var place = document.getElementById("insertMission_place").value;
    var placeMsg = document.getElementById("requiredPlace");
    var check = true;

    if (name.length === 0) {
        check = false;
        nameMsg.innerHTML = "Name is required!";
    } else if (name.length < 5 || name.length > 50) {
        check = false;
        nameMsg.innerHTML = "Name must be form 5 to 50 chars";
    }
    if (place.length === 0) {
        check = false;
        placeMsg.innerHTML = "Place is required!";
    } else if (place.length < 5 || place.length > 50) {
        check = false;
        nameMsg.innerHTML = "Place must be form 5 to 50 chars";
    }
    return check;
}

function loginRequired() {
    var username = document.getElementById("login_username").value.length;
    var password = document.getElementById("login_password").value.length;
    var message = document.getElementById("login-message");
    if (username === 0 || password === 0) {
        message.innerHTML = "Invalid username or password!";
        return false;
    }
    return true;
}

function searchMemberRequired() {
    var search = document.getElementById("searchMember_searchValue").value.length;
    var msg = document.getElementById("search-required");
    if (search === 0) {
        msg.innerHTML = "Search value is required!";
        return false;
    }
    return true;
}
function searchMissionRequired() {
    var search = document.getElementById("searchMission_searchValue").value.length;
    var msg = document.getElementById("search-required");
    if (search === 0) {
        msg.innerHTML = "Search value is required!";
        return false;
    }
    return true;
}

function requiredPassword() {
    var password = document.getElementById("resetPassword_password").value.length;
    var message = document.getElementById("password");
    if (password === 0) {
        message.innerHTML = "Password is required!";
    } else if (password < 6) {
        message.innerHTML = "Password has at least 6 chars";
    } else if (password > 30) {
        message.innerHTML = "Password has at most 30 chars";
    } else {
        message.innerHTML = "";
    }
}
function requiredConfirmPassword() {
    var password = document.getElementById("resetPassword_password").value;
    var confirm = document.getElementById("resetPassword_confirm").value;
    var message = document.getElementById("confirm");
    if (confirm.length === 0) {
        message.innerHTML = "Confirm password is required!";
    } else if (confirm !== password) {
        message.innerHTML = "Confirm password does not match with password!";
    } else {
        message.innerHTML = "";
    }
}

function resetPassword() {
    var password = document.getElementById("resetPassword_password").value;
    var messagePassword = document.getElementById("password");
    var confirm = document.getElementById("resetPassword_confirm").value;
    var messageConfirm = document.getElementById("confirm");
    var check = true;
    if (password.length === 0) {
        check = false;
        messagePassword.innerHTML = "Password is required!";
    } else {
        messagePassword.innerHTML = "";
    }
    if (confirm.length.length === 0) {
        check = false;
        messageConfirm.innerHTML = "Confirm password is required!";
    } else if (confirm !== password) {
        check = false;
        messageConfirm.innerHTML = "Confirm must match password!";
    }
    return check;
}

function requiredFile() {
    var upload = document.getElementById("uploadFileText_file");
    var msg = document.getElementById("requiredFile");
    if (upload.files.length === 0) {
        msg.innerHTML = "File is required!";
        return false;
    }
    return true;
}

function requiredMemberImg() {
    var upload = document.getElementById("uploadMemberImgByMember_img");
    var msg = document.getElementById("requiredFile");
    if (upload.files.length === 0) {
        msg.innerHTML = "File is required!";
        return false;
    }
    return true;
}

function requiredEquipImg() {
    var upload = document.getElementById("uploadEquipImg_img");
    var msg = document.getElementById("requiredFile");
    if (upload.files.length === 0) {
        msg.innerHTML = "File is required!";
        return false;
    }
    return true;
}

function requiredAttachment() {
    var upload = document.getElementById("uploadAttachment_file");
    var msg = document.getElementById("requiredFile");
    if (upload.files.length === 0) {
        msg.innerHTML = "File is required!";
        return false;
    }
    return true;
}

function chooseNoMember() {
    var num = document.getElementById("num").value;
    var member2 = document.getElementById("member2");
    var member3 = document.getElementById("member3");
    var member4 = document.getElementById("member4");
    if (num === "1") {
        member2.style.display = "none";
        member3.style.display = "none";
        member4.style.display = "none";
    } else if (num === "2") {
        member2.style.display = "block";
        member3.style.display = "none";
        member4.style.display = "none";
    } else if (num === "3") {
        member2.style.display = "block";
        member3.style.display = "block";
        member4.style.display = "none";
    } else if (num === "4") {
        member2.style.display = "block";
        member3.style.display = "block";
        member4.style.display = "block";
    }
}


