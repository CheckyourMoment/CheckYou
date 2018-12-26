var idCheck =/^[a-zA-Z0-9]{4,12}$/;
var pwCheck =/^[a-zA-Z0-9]{4,12}$/;
var mailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;




//유효성 검사
function validate() {
  if(idValidate() && pw1Validate() && pw2Validate() && mailValidate()){
    window.alert("returns true");
    return true;
  }else{
    window.alert("returns false");
    return false;
  }
}

//아이디 유효성 검사
function idValidate(){
  var id = document.getElementById("id");
  var idOK = idCheck.exec(id.value);
  if(idOK){
    window.alert("사용할 수 있는 아이디 입니다.");
    return true;
  }else{
	window.alert("sdfg");
    window.alert("아이디 형식이 틀립니다.");
    return false;
  }
}

//비밀번호 유효성 검사
function pw1Validate(){
  var password = document.getElementById("password");
  var pw1 = pwCheck.exec(password.value);
  if(pw1&& id.value!=password.value){
    document.window.alert("비번1 정상입니다.");
    return true;
  }else{
    window.alert("Passwd 형식이 틀립니다.");
    return false;
  }
}

//비밀번호 확인 유효성 검사
function pw2Validate(){
  var password = document.getElementById("password");
  var confirmpassword = document.getElementById("confirmpassword");
  var pw2OK = pwCheck.exec(confirmpassword.value);
  
  window.alert(pw2OK);
  if(pw2OK && password.value==confirmpassword.value){
    window.alert("비번2 정상입니다.");
    return true;
  }else{
    window.alert("Passwd 형식이 틀립니다.");
    return false;
  }
}

//이메일 확인 유효성 검사
function mailValidate(){
  var mailOK = mailCheck.exec(email.value);
  if(mailOK){
    window.alert("이메일 정상입니다.");
    return true;
  }else{
    window.alert("이메일 형식이 틀립니다.");
    return false;
  }
}

