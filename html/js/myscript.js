/*
function f_init() {
    alert("I'am lutian");
}
window.onload = f_init();
*/

// nmae 값을 배개변수로 너겨주면 value를 찾아서 리턴해주는 함수
// 각 주소줄의 특정 name의 value값을 찾는기능을 범용화
// 값이 안 넘어왔거나, 찾을 수 없을 때는 null값을 리턴하는 것으로
// 범용화 : 자바의 패키지명처럼 함수의 함수의 소속을 준다.

var request = {};
request.getParameter = function getParame(p_name) {
    var v_address = location.href;
    if (v_address.indexOf("?") == -1) return null;

    v_addressGroup = decodeURIComponent(v_address.split("?")[1]).split("&");
    for (var i = 0; i < v_addressGroup.length; i++) {
        if (v_addressGroup[i].split("=")[0] == p_name) {
            return v_addressGroup[i].split("=")[1];
        }
    }
}

request.getParameterValues = function getParameterValues() {
    var v_address = location.href;
    var v_map = v_address.split("&");
    var v_hobbies = [];
    for(var i=0; i<v_map.length; i++) {
        var v_couple = v_map[i];
        if(v_couple.split("=")[0] == "nm_hobby") {
            v_hobbies.push(v_couple.split("=")[1]);
        }
    }
    if(!v_hobbies.length) {
        return null;
    } else {
        return v_hobbies;
    }

}