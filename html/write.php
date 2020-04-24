    <form class="form-signin" action="upload.php" method="get" target="submitBox">
        <label for="inputEmail" class="sr-only">Email Address</label>
        <input type="email" id="inputEmail" class="form-control" placeholder="이메일 주소" name="te" required="" />
        <label for="inputTitle" class="sr-only">Title</label>
        <input type="text" id="inputTitle" class="form-control" placeholder="제목 입력" name="tt" style="margin-bottom: 10px;" required="">
        <input type="checkbox" id="a-checkbox" class="custom-control-input" name="ck1" value="main">
		<label class="custom-control-label" for="a-checkbox"><p style="margin: 0 0 10px;line-height: 0;padding-left:10px;padding-right: 10px;display: table-cell;">촬영요청</p></label>
        <p style="color:#ddd;display: inline-table;margin: 10px 10px;font-size: 20px;">|</p>
        <input type="checkbox" id="b-checkbox" class="custom-control-input" name="ck2" value="serve">
		<label class="custom-control-label" for="b-checkbox"><p style="margin: 0 0 10px;line-height: 0;padding-left:10px;padding-right: 10px;display: table-cell;">협업요청</p></label>

        <label for="inputTextarea" class="sr-only">Text Area</label>
        <textarea class="form-control" id="inputTextarea" name="tc" cols="30" rows="10" placeholder="문의내용" required=""></textarea>
        <input class="btn btn-lg btn-primary btn-block" type="submit" value="제출"/>
    </form>
    
    <!-- iframe 설정 -->
    <iframe id="ifSub" name="submitBox" style="display:none;"></iframe>