<script>
    // Broser Infomation to use cookie
    if(document.cookie != "IE=use") {
        var agent = navigator.userAgent.toLowerCase();
        if (agent.indexOf("chrome") != -1) {
            alert("귀하는 인터넷 크롬을 사용하고 있습니다.\n 크롬에서는 해당 홈페이지가 작동되지 않을 수 있으니 인터넷 익스플로러 사용을 권장합니다.");
            var date = new Date();
            date.setDate(date.getDate()+7);

            var willCookie = "";
            willCookie += "IE=use;";

            //쿠키에 넣는다.
            document.cookie = willCookie;
        }
    } else {
        // cookie using
    }

</script>