<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js" xmlns="http://www.w3.org/1999/html"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">


	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

	<g:layoutHead/>
	</head>
	<body>
	<g:if test="${session.user}">
		<div class="well" style="font-size:25px">
			<div class="row">
				<div class="col-sm-4">
					<g:link controller="login" action="index"><u>Link sharing</u></g:link>
				</div>
				<div class="col-sm-3"><input type="text" class="form-control" placeholder="Search" name="q" ></div>
				<div class="col-sm-3">
					<span>
						<i class="fa fa-comment" data-toggle="modal" data-target="#ctModal"></i>
						<i class="fa fa-envelope" data-toggle="modal" data-target="#siModal"></i>
						<i class="fa fa-link" data-toggle="modal" data-target="#slModal"></i>
						<i class="fa fa-file-o" data-toggle="modal" data-target="#sdModal"></i>

					</span>
				</div>
				<div class="col-sm-2">
					<span>
						<i class="glyphicon glyphicon-user" text="Create Topic"></i>
						<div class="btn-group">
							<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${session.user}<span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="#">Profile</a></li>
								<li><a href="#">Users</a></li>
								<li><g:link controller="login" action="logout">Logout</g:link></li>
							</ul>
						</div>
					</span>
				</div>
			</div>
		</div>

		<div id="slModal" class="modal fade">
			<g:render template="/linkResource/create" />
		</div>
		<div id="sdModal" class="modal fade">
			<g:render template="/documentResource/create" />
		</div>

    </g:if>

	<g:else>
		<div class="well" style="font-size:25px">
			<div class="row">
				<div class="col-sm-8"> <a href="#" ><u>Link sharing</u></a></div>
				<div class="col-sm-4">
					<section id="search">
						<label>
							<i class="fa fa-search"></i>
						</label>
						<input type="text" placeholder="Search">
					</section>
				</div>
			</div>
		</div>

	</g:else>

		<g:layoutBody/>

	<div id="ctModal" class="modal fade">
		<g:render template="/topic/ceateTopic" />
	</div>
	<div id="siModal" class="modal fade">
		<g:render template="/topic/email" />
	</div>



		%{--<div class="well" style="font-size:25px">
			<div class="row">
				<div class="col-sm-8"> <a href="#" ><u>Link sharing</u></a></div>
				<div class="col-sm-4">
					<section id="search">
						<label>
							<i class="fa fa-search"></i>
						</label>
						<input type="text" placeholder="Search">
					</section>
				</div>
			</div>
		</div>

		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>--}%
	</body>
</html>
