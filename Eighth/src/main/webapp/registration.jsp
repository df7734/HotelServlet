

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>


<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="messages"/>

<html>
<head>
	<!----Bootstrap---->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

	<!----Datepicker---->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
	<title>Login</title>
</head>
<body>
<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
<header>
	<!----Navigation bar---->
	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" style="max-height: 80px">
		<div class="container-xxl">
			<a class="navbar-brand" href="start.jsp"><fmt:message key="label.hotel"/></a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<a class="nav-link" href="login.jsp"><fmt:message key="label.login"/></a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="registration.jsp"><fmt:message key="label.registration"/></a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${requestScope['javax.servlet.forward.request_uri']}?lang=en"><fmt:message key="label.lang.en"/></a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${requestScope['javax.servlet.forward.request_uri']}?lang=ua"><fmt:message key="label.lang.ua" /></a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</header>
<!----Background image---->
<div class="bg-image"
	 style="background-image: url('https://pbs.twimg.com/media/EESubW0XsAA0jPA?format=jpg&name=large');
            background-repeat: no-repeat;
            background-attachment: fixed;
            min-height: 100vh;">
	<!----Registration---->
	<div class="container-sm" style="padding-top: 85px; padding-bottom: 70px; max-width: 1050px">
		<div class="card">
			<div class="card-body">
				<div class="bg-image"
					 style="background-image: url('https://cdn4.vectorstock.com/i/1000x1000/13/88/light-blue-pink-geometric-background-vector-21931388.jpg');
            max-height: 800px; max-width: 1000px">
				<section>
					<div class="container-sm">
						<div class="row d-flex justify-content-center align-items-center h-100" style="padding-top: 20px; padding-bottom: 20px">
							<div class="col-md-9 col-lg-6 col-xl-5">
								<form method="post" action="register" class="register-form" oninput='re_pass.setCustomValidity(password.value !== re_pass.value ? "Passwords do not match." : "")'>
									<h1 class="form-title text-center" style="padding-bottom: 20px; color: dodgerblue"><fmt:message key="label.signUp"/></h1>
									<!-- Name input -- 2-50 symbols  ------>
									<div class="form-outline mb-4">
										<label for="name" class="form-label"><fmt:message key="label.enterName"/></label>
										<input type="text" id="name" name="name" minlength="2" maxlength="50" class="form-control form-control-lg"
											   placeholder="<fmt:message key="label.name"/>" required/>
									</div>
									<!-- Email input --  5-50 symbols email type -->
									<div class="form-outline mb-4">
										<label for="email" class="form-label"><fmt:message key="label.enterEmail"/></label>
										<input type="email" id="email" name="email" minlength="5" maxlength="50"  class="form-control form-control-lg"
											   placeholder="<fmt:message key="label.login"/>" required/>
									</div>

									<!-- Password input --- 4-20 symbols-->
									<div class="form-outline mb-3">
										<label for="password" class="form-label"><fmt:message key="label.enterPass2"/></label>
										<input type="password" id="password" name="password" minlength="4" maxlength="20" class="form-control form-control-lg"
											   placeholder="<fmt:message key="label.password"/>" required/>
									</div>

									<!-- Re-pass input -->
									<div class="form-outline mb-3">
										<label for="re_pass" class="form-label"><fmt:message key="label.repPass"/></label>
										<input type="password" id="re_pass" name="re_pass" minlength="4" maxlength="20" class="form-control form-control-lg"
											   placeholder="<fmt:message key="label.repPass2"/>" required/>
									</div>

									<!-- Phone input -- 6-12 digits-->
									<div class="form-outline mb-4">
										<label for="phone" class="form-label"><fmt:message key="label.enterPhone"/></label>
										<input type="text" id="phone" name="phone" minlength="6" maxlength="12" pattern="[0-9]+" class="form-control form-control-lg"
											   placeholder="<fmt:message key="label.phone"/>" required/>
									</div>

									<div class="text-center text-lg-start mt-4 pt-2">
										<button type="submit" class="btn btn-primary btn-lg"
												style="padding-left: 2.5rem; padding-right: 2.5rem;"><fmt:message key="label.register"/></button>
									</div>
								</form>
							</div>
							<div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1 text-center">
								<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp" class="img-fluid"
									 alt="Sample image">
								<h3 style="padding-top: 20px"><a href="login.jsp" class="signup-image-link"><fmt:message key="label.im_member"/></a></h3>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
</div>
</div>

	<!----Sweetalert---->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<!----Check status of registration--->
<script type="text/javascript">
	var status = document.getElementById("status").value;
	if(status === "success"){
		swal({
			title: "Congrats",
			text: "Account Created Successfully",
			type: "success"
		}).then(function() {
			window.location = "login.jsp";
		});
	}
	if(status === "failed"){
		swal("Sorry", "User already exists", "error");
	}
	if(status === "failedByValid"){
		swal("Sorry", "Failed validation", "error");
	}
</script>
</body>
</html>