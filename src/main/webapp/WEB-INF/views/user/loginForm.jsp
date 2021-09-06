<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<script>
 $(function() {
	var cookie = [];
	var cookie  = document.cookie.split('=');

	$('#username').attr('value', cookie[1]);
	if(cookie[1] != null) {
		$('#chk').prop('checked',true);
	}
 });
</script>

<div class="container">
	<form action="/login" method="post">
		<div class="form-group">
			<input type="text"  name="username" class="form-control" placeholder="Enter username" required="required"  id="username">
		</div>
		<div class="form-group">
			<input type="password"  name="password" class="form-control" placeholder="Enter password"  required="required"  id="pwd">
		</div>
		<div class="form-group form-check">
			<label class="form-check-label"> <input
				class="form-check-input" type="checkbox" name="idChecked" id="chk" value="1">
				Remember me
			</label>
		</div>
		<button type="submit" class="btn btn-primary" id="login">로그인</button>
	</form>
</div>

<%@ include file="../layout/footer.jsp" %>