// name媛믪쓣 留ㅺ컻蹂��섎줈 �섍꺼二쇰㈃ value瑜� 李얠븘�� 由ы꽩�댁＜�� �⑥닔 
// 二쇱냼以꾩쓽 �뱀젙name�� value媛믪쓣 李얜뒗 湲곕뒫�� 踰붿슜��
// 媛믪씠 �� �섏뼱�붽굅��, 李얠쓣�� �놁쓣 �뚮뒗 null媛믪쓣 由ы꽩�섎뒗 嫄몃줈
// 踰붿슜��  �먮컮�� �⑦궎吏�紐낆쿂�� �⑥닔�� �뚯냽�� 以�!

var request = {};
request.getParameter = function(p_name){
    var v_jusoVal = location.href;
    if(v_jusoVal.indexOf("?") == -1) return null;  // �섏뼱�� 媛� �놁쑝�� 洹몃깷 ��!
    // 癒쇱� ? �ㅻⅨ履� 臾몄옄�대쭔 鍮쇨린
    v_jusoVal = decodeURIComponent(v_jusoVal.split("?")[1]).split("&");
    for(var i=0; i < v_jusoVal.length; i++){
        if(v_jusoVal[i].split("=")[0] == p_name){
            return v_jusoVal[i].split("=")[1];
        }
    }
}

// �ㅻ뒛�� 怨쇱젣! 
// 媛숈� �대쫫�� �щ윭媛� �섏뼱�� ��, �대떦 value媛믪쓣 諛곗뿴�� �댁븘 由ы꽩�댁＜�� �꾨옒
// �⑥닔瑜� �꾩꽦�섏떆��!.  �꾨쭏 �� �뚯뒪瑜� 李멸퀬�섎㈃ 湲덈갑 �� �� �덉쓣 嫄곗삁��!
request.getParameterValues= function(p_name){
    var v_jusoVal = location.href;
    if(v_jusoVal.indexOf("?") == -1) return null;  // �섏뼱�� 媛� �놁쑝�� 洹몃깷 ��!
    // 癒쇱� ? �ㅻⅨ履� 臾몄옄�대쭔 鍮쇨린
    v_jusoVal = decodeURIComponent(v_jusoVal.split("?")[1]).split("&");
    var v_rsltArr = [];  // 寃곌낵 �댁쓣 鍮� 諛곗뿴
    for(var i=0; i < v_jusoVal.length; i++){
        if(v_jusoVal[i].split("=")[0] == p_name){
            v_rsltArr.push(v_jusoVal[i].split("=")[1]);
        }
    }
    return v_rsltArr;
}


/*
function f_init(){
    alert("�� 珥덇린�� 猷⑦떞�댁삁��");
}
window.onload = f_init;
*/