<cfif !isDefined("session.loginId") AND !isDefined("session.loginName")>
	<cflocation url="pages_login.cfm" addtoken="no">
</cfif>

<cfquery name="empDetails" datasource="EMPDATA"> 
    SELECT * FROM employee_details 
</cfquery>

<!DOCTYPE html>
<html lang="en">

<!-- ======= header ======= -->
<cfinclude template="header.cfm">
<!-- ======= Sidebar ======= -->
<cfinclude template="sidebar.cfm">
<body>
	

		<cfif StructKeyExists(session,"loginRoleId") and session.loginRoleId eq 1> 
			<form method="POST" enctype="multipart/form-data">
				<main id="main" class="main">
					<div class="pagetitle">
						<h1>Employees</h1>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">Home</a></li>
								<li class="breadcrumb-item active">Employees</li>
							</ol>
						</nav>
					</div>						 
					<!-- Recent Sales -->
					<div class="col-12">
						<div class="card recent-sales overflow-auto">																							
                            <cfquery name="qCount" datasource="EMPDATA">
                                SELECT COUNT(*) AS rowCount
                                FROM employee_details
                            </cfquery>							
							<h5 class="card-title">Recent Updates<span>| Employee:<cfoutput>#qCount.rowCount#</cfoutput></span></h5>
							
							<table class="table table-dark nav-tabs">
								<thead class="table-primary ">
								<tr>
									<th scope="col" >ID</th>
									<th scope="col">Name</th>
									<th scope="col">Email</th>
									<th scope="col">Mobile</th>
									<th scope="col">Gender</th>
									<th scope="col">Education</th>
									<th scope="col">Image</th>
									<th scope="col">Toggle</th>
									<th scope="col">Alter</th>
								</tr>
								</thead>
								<tbody>
									<cfoutput query = "empDetails" >
										<tr>
											<td>#Id#</td>
											<td>#empDetails.first_name# #empDetails.last_name#</td>
											<td>#empDetails.email#</td>
											<td>#empDetails.mobile#</td>
											<td>#empDetails.gender#</td>
											<td>#empDetails.select#</td>                   
											<td><img src="image/#empDetails.image#" alt="profile"  class="rounded-circle"  width="35" height="35"></td>
												<td>
													<div class="form-check form-switch">
													<input class="form-check-input toggle" data-id="#id#" type="checkbox"  role="switch"  value="1" <cfif emp_role_id eq 1 >checked</cfif>>
													</div>
												</td>   
												<td>
													<a href="addEditEmp.cfm?id=#id#" type="button" class="btn btn-outline-primary"><ion-icon name="pencil-outline" value = "1" ></ion-icon></a>
													<button data-id ="#id#" class="btn btn-outline-danger dltBtn"><ion-icon name="trash-outline"></ion-icon></button>                          
												</td>
										</tr>
									</cfoutput>
								</tbody>
							</table>
							</div>
						</div>
					</div>
				</main>
			</form>
		</cfif>
		 <!--- Profile Modal --->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" >User profile
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body text-center" >
						<cfoutput>
					
							<!--- <form action="profileuddate.cfm?id=#session.loginid#" method="POST" enctype="multipart/form-data"> --->
							<form id="proupdate"  method="POST" enctype="multipart/form-data" action="">
								<img id="output" src="image/#session.loginImage#" alt="Profile" class="rounded-circle" width="100" height="100"><br>
								<input type="file" name="newProImg" id="newProImg" class="file-control" accept="image/gif, image/jpeg, image/png">
								<!--- <label><ion-icon name="camera" ></ion-icon></label> --->
								<input type="hidden" name="oldProImg" id="oldProImg" class="file-control" value="#session.loginImage#"><br>													
								<input type="submit"  id="sub" name="submit" value="submit" class="btn btn-success">					  			
							</form>
						</cfoutput>	
						<ul>
							<tr><label for="name">Name:</label></tr>
							<cfoutput>#session.loginName#</cfoutput><br>
							<label for="number">Number:</label>
							<cfoutput>#session.loginmobile#</cfoutput><br>
							<div style="color:blue" align="left"><label for="email">Email:</label>              
							<cfoutput>#session.loginEmail#</cfoutput></div><br>						
							<a href="#" id="change_password_link">Change password</a>
							<form id="password_change_form" style="display: none;" method="POST" onsubmit = "return validate()">
								<div class="row mb-3"><label for="old-password">old password:</label>
									<div class="col-sm-10"><input type="password" id="old_password" name="old-password">
									</div>
								</div>                          
								<div class="row mb-3"><label for="password">password:</label>
									<div class="col-sm-10"><input type="password" id="password" name="password">
									</div>
								</div>						  
								<div class="row mb-3"><label for="confirm-password">confirm Password:</label>
									<div class="col-sm-10"><input type="password" id="confirm_password" name="confirm-password">
									</div>
								</div>
								<span id="CheckPasswordMatch" ></span>
								<span id="passrrr" ></span>		
								<div class="modal-footer">
									<!--- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> --->
									<button type="button" id="submit_password_change" class="btn btn-secondary" name="passwd" value="1">Submit</button>									
									<a type="button" class="btn btn-secondary" href="addEditEmp.cfm?id=<cfoutput>#session.loginId#</cfoutput>">Edit profile</a>				  
								</div>				  						  
							</form>
								<!--- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> --->																		
								<!--- end ajax --->
						</ul>
					</div>          
					
				</div>
			</div>
		</div> 
		
	</body>
	<!-- ======= footer ======= -->
	<cfinclude template="footer.cfm">
	<!--- for ajax --->
		
  <!--- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"> --->
  <cfif session.isdeleted >
    <script>
      Swal.fire(
          'Deleted!',
          'Your file has been deleted.',
          'success'
          )
          </script>
    <cfset session.isdeleted = false>
  </cfif>
</html>
