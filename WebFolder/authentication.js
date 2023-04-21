function onClick()
{
sendData({identifier:document.forms['myForm'].elements['identifier'].value , password:document.forms['myForm'].elements['password'].value})
};

function sendData(data) {
  var XHR = new XMLHttpRequest();
  
  XHR.onload = function() {
    let result = XHR.response;
    if (result === 'OK')  { 
      window.location = "http://127.0.0.1:8043/$lib/renderer/?w=Welcome";
      }
      else {
      document.getElementById("authenticationFailed").style.visibility = "visible";
      document.getElementById("authenticationFailed").innerHTML = result;
      }
  };
  
  XHR.open('POST', 'http://127.0.0.1:8043/authenticate'); 
  XHR.setRequestHeader('identifier', data.identifier);
  XHR.setRequestHeader('password', data.password);
  XHR.send();
};
