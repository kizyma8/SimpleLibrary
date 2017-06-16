<html>
<head>
	<title>Login</title>
	%{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'main1.css')}" type="text/css">--}%
	%{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'main2.css')}" type="text/css">--}%
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'basic.css')}" type="text/css">

</head>

<body>



<div class="content-body">
	<div id="reg" style="height: 50%">

		<form  style="height: 80%;" action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
			<div class="header-login"><div >Sign In</div></div>

			<div class="body-login">
				<div class="input-form">
					<g:if test='${flash.message}'>
						<div class='login_message'>${flash.message}</div>
					</g:if>
					<p>
						<label for='username'>Username:</label>
						<input type='text' class='text_' name='j_username' id='username'/>
					</p>

					<p>
						<label for='password'>Password:</label>
						<input type='password' class='text_' name='j_password' id='password'/>
					</p>

					<p id="remember_me_holder">
						<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
						<label for='remember_me'>Remember me</label>
					</p>

					<p>
						<input type='submit' class="button" id="submit" value='${message(code: "springSecurity.login.button")}'/>
					</p>

			</div>
			</div>
		</form>

	<div class="footer-form" style="height: 20%">
		<div style="padding-top: 3%">If you don't have account! <g:link style="text-decoration: none; color:white; font-size: 17px; margin-left: 1%;" controller="user" action="formReg">Sign Up here</g:link></div>

	</div>
</div>
</div>
<script type='text/javascript'>
    (function() {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
</script>
</body>
</html>
