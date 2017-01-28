<%@page session="false"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Group Page</title>

<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<spring:url value="/resources/core/js/jquery-3.1.1.min.js" var="jqueryJs" />
<spring:url value="/resources/core/js/jquery.dataTables.min.js"	var="dataTablejqueryJs" />
<spring:url value="/resources/core/js/dataTables.select.min.js" var="selectDataTablejqueryJs" />
<script src="${jqueryJs}"></script>
<script src="${dataTablejqueryJs}"></script>
<script src="${selectDataTablejqueryJs}"></script>
</head>
<body>

	<nav class="navbar navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="/home">Home</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="/index">Contacts</a></li>
			<li class="active"><a href="/indexgroup">Groups</a></li>
		</ul>
	</div>
	</nav>
	
	<div class="container" style="min-height: 500px; padding: 25px 50px 75px 100px">
		<div class="starter-template">
			<h1>Groups</h1>
			<br>
			<div id="addgroup" style="padding-top: 25px"></div>
			<form class="form-horizontal" id="add-edit-form">
				<div class="form-group form-group-lg">
					<label class="col-sm-2 control-label">Name</label>
					<div class="col-sm-5">
						<input type=text class="form-control" id="groupname" required>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" id="add" class="btn btn-primary btn-lg">Add Group</button>
					</div>
				</div>
			</form>


			<div id="editgroup" style="padding-top: 25px;">
				<form class="form-horizontal" id="edit-form">
					<div class="form-group form-group-lg">
						<label class="col-sm-2 control-label" >Name</label>
						<div class="col-sm-5">
							<input type=text class="form-control" id="editgroupname" required>
						</div>
					</div>
					<div class="form-group form-group-lg">
						<input type="submit" id="editsubmit" style="margin-left: 200px" class="btn btn-primary btn-lg" value="Submit">
					</div>
				</form>
			</div>
		</div>

		<div id="functiongroup" style="padding: 25px">
			<button type="button" class="btn  btn-primary btn-lg" id="adddisplay">Add New Group</button>
		</div>


		<div class="container" style="min-height: 500px; padding-top: 25px">
			<div class="starter-template">
				<table id="example"
					class="table table-bordered table-hover table-striped"
					style="padding-top: 15px" cellspacing="10" width="60%">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>

</div>

		<script type="text/javascript">
		
			jQuery(document).ready(function($) {
						$('#add-edit-form').hide();
						$('#edit-form').hide();
						var editGroupId;

						//get call to populate the group table with existing values
						$.ajax({
							type : "GET",
							contentType : "application/json",
							url : "http://localhost:8080/groups",
							dataType : 'json',
							timeout : 100000,
							success : function(data) {
								console.log("SUCCESS: ", data);
								$('#example').dataTable({
									"processing" : true,
									"aaData" : data,
									"columns" : [ {
										"data" : "id"
									}, {
										"data" : "name"
									},
									{
										"defaultContent": 
          			 					'<button id="btn-edit-group" class = "btn-primary" type="button" style="margin : 5px">Edit</button>'
           							+ 	'<button id="btn-delete-group"  class = "btn-primary" style="margin : 5px" type="button">Delete</button>'
           							+	'<button id="btn-view-group"  class = "btn-primary" type="button" style="margin : 5px" >View Group Info</button>'
									}
									]
								});
							},
							error : function(e) {
								console.log("ERROR: ", e);
								display(e);
							},
							done : function(e) {
								console.log("DONE");
								enableSearchButton(true);
							}
						}); 
						

						//adding a group
						$("#add-edit-form").submit(function(event) {
							var group = {};
							group["name"] = $("#groupname").val();
							
							//post call for adding new group values to the database
							$.ajax({
								type : "POST",
								contentType : "application/json",
								url : "http://localhost:8080/groups",
								data : JSON.stringify(group),
								timeout : 100000,
								success : function(data) {
									console.log("SUCCESS: ", data);
									//to redraw the datatable
									var $t = $('#example').DataTable();
									$t.row.add(data).draw();
								},
								error : function(e) {
									console.log("ERROR: ", e);
									display(e);
								},
								done : function(e) {
									console.log("DONE");
									enableSearchButton(true);
								}
							});
						});

						
						//to highlight the selected rows when clicked
						$('#example tbody').on('click','tr',function() {
									$('#example').dataTable.$('tr.info').removeClass('info');
									$(this).addClass("info");

									//to enable selection of rows
									if ($(this).hasClass('selected')) {
										$(this).removeClass('selected');
									} else {
										$('#example').DataTable().$('tr.selected').removeClass('selected');
										$(this).addClass('selected');
									}
								});

						//to pop up the add form when add group button is clicked
						$('#adddisplay').click(function() {
							$('#edit-form').hide();
							$('#add-edit-form').show();
						});
						
						//function called when edit group button is clicked
					 	$('#example tbody').on('click', '#btn-edit-group', function (e) {
									$("#add-edit-form").hide();
									$("#edit-form").fadeIn();
									var groupnameold = $('#example').DataTable().row($(this).parents('tr')).data().name;
									editGroupId = $('#example').DataTable().row($(this).parents('tr')).data().id;
									$("#editgroupname").val(groupnameold);
								});
						
						//edit the group table based on the new values entered
						$('#editsubmit').click(function() {
									var id = editGroupId;
									var group = {}
									group["name"] = $("#editgroupname").val();
									group["id"] = id;
									
									//call the update function only if the values entered is not null
									if($("#editgroupname").val()){
										$("#edit-form").hide();
										$.ajax({
											type : "PUT",
											contentType : "application/json",
											url : "http://localhost:8080/groups/"+ id,
											data : JSON.stringify(group),
											timeout : 100000,
											success : function(data) {
												console.log("SUCCESS: ", data);
												//to redraw the datatable
												var $t = $('#example').DataTable();
												$t.row.add(data).draw();
											},
											error : function(e) {
												console.log("ERROR: ", e);
											},
											done : function(e) {
												console.log("DONE");
												enableSearchButton(true);
											}
										});
									}
									else{
										alert("Please enter group name..");
									}
								});
						
					
					 //to delete group
					 $('#example tbody').on('click', '#btn-delete-group', function (e) {
									var id = $('#example').DataTable().row($(this).parents('tr')).data().id;
									var checkstr =  confirm('Are you sure you want to delete this?');
									if(checkstr == true){
										$.ajax({
											type : "DELETE",
											contentType : "application/json",
											url : "http://localhost:8080/groups/"+ id,
											timeout : 100000,
											success : function(data) {
												console.log("SUCCESS: ", data);
											},
											error : function(e) {
												console.log("ERROR: ", e);
											},
											done : function(e) {
												console.log("DONE");
												enableSearchButton(true);
											}
										});
									}
									else{
										return false;
									}
									$('#example').DataTable().row($(this).parents('tr')).remove().draw(false);
								});
								
						//view group details
						 $('#example tbody').on('click', '#btn-view-group', function (e) {
									var id = $('#example').DataTable().row($(this).parents('tr')).data().id;
									window.location= '/groupdetails?id=' + id;
								});
					}); 
		</script>
</body>
</html>