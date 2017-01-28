<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Phone Book</title>
<spring:url value="/resources/core/js/jquery-3.1.1.min.js"
	var="jqueryJs" />
<spring:url value="/resources/core/css/bootstrap.min.css"
	var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<script src="${jqueryJs}"></script>
</head>
<body>


	<div class="container">

		<div class="row">
			<div class="col-md-offset-2 col-md-8" style="padding: 40px">
				<div class="text-center">
					<p style="font-family: Georgia; font-size: 60px;">Welcome to
						Phone Book</p>
				</div>
			</div>
		</div>


		<div class="container" id="welcomediv">
			<div class="col-xs-6">
				<img class="img-responsive"
					src="../../../resources/core/images/phone-book.png">
			</div>

			<div class="col-xs-6" style="padding: 120px">
				<button type="button" class="btn btn-primary btn-lg hover"
					id="getstarted" style="padding: 50px; width: 100%; font-size:40px; font-family: Georgia">Get
					Started</button>
			</div>

		</div>
	</div>
</body>

<script type="text/javascript">
			jQuery(document).ready(
					function($) {
			$('#getstarted').click(
			function(){
		window.location = '/index';
	});
					});
</script>
</html>