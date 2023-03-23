  
<cfset isEditpage = false>
 <cfif isDefined("url.id")>
  
  <cfquery name="editSingleData" datasource="EMPDATA"> 
   SELECT `first_name`,`last_name`,`email`,`mobile`,`password`,`date`,`gender`,`select`,`image` FROM employee_details where id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
  </cfquery>
	<cfset firstname="#editSingleData.first_name#">
	<cfset lastname="#editSingleData.last_name#">
	<cfset emailid="#editSingleData.email#">
	<cfset mobile1="#editSingleData.mobile#">
	<cfset pass="#editSingleData.password#">
	<cfset Dob="#editSingleData.date#">
	  <cfset gender1="#editSingleData.gender#">
	   <cfset sel="#editSingleData.select#"> 
	  <cfset img="#editSingleData.image#"> 
	  <cfset isEditpage = true>
  <cfelse>
	<cfset firstname="">
	<cfset lastname="">
	<cfset emailid="">
	<cfset mobile1="">
	<cfset pass= "">
	<cfset Dob="">
	  <cfset gender1="">
	   <cfset sel=""> 
	  <cfset img=""> 
	</cfif>
   <!--- <cfdump var = "#img#"> --->
 
  <link rel="stylesheet" href="assets/css/newstyle.css">
  </head>
  <body>
	<cfoutput>

	<div class="container">
	<cfif isEditpage eq false >
	<h1>Add Employee</h1>
	<cfelse>
	  <h1>Edit </h1>
	</cfif>
	<form <cfif isEditpage eq false > action="add/insertaddemp.cfm" <cfelse> action="add/updatefile.cfm?id=#id#" </cfif> onsubmit = "return validate()" method="POST" enctype="multipart/form-data">
	  <div> 
			<div class="row mb-3">
			  <label for="inputFirstName" class="col-sm-2 col-form-label ">First Name</label>
			  <div class="col-sm-10">
				<input type="text" class="form-control" id="First_Name" name="FirstName" placeholder="Enter first name" value="#firstname#" >
			 
				<span id="fNameErr" ></span>
			  </div>
			</div>
			<div class="row mb-3">
				<label for="inputFirstName" class="col-sm-2 col-form-label">Last name</label>
				<div class="col-sm-10">
				  <input type="text" class="form-control" id="Last_Name" name="LastName" placeholder="Enter Last name" value="#lastname#">
				  <span id="lNameErr" ></span>
				</div>
			  </div>
			  <div class="row mb-3">
				<label for="inputFirstName" class="col-sm-2 col-form-label">email address</label>
				<div class="col-sm-10">
				  <input type="email" class="form-control" id="Email_Address" name="email" placeholder="email address" value="#emailid#">
				  <span id="emailErr" ></span>
				</div>
			  </div>
			</div>

			  <div class="row mb-3">
				<label for="inputFirstName" class="col-sm-2 col-form-label">mobile</label>
				<div class="col-sm-10">
				  <input type="number" class="form-control" id="mobile" name="mobile" placeholder="Enter mobile number" value="#mobile1#">
				  <span id="mnumber" ></span>
				</div>
			  </div>
			  
			  <div class="row mb-3">
				<label for="inputFirstName" class="col-sm-2 col-form-label">password</label>
				<div class="col-sm-10">
				  <input type="password" class="form-control" id="password" name="passwd" placeholder="Enter passsord" value="#pass#">
				  <span id="mnumber" ></span>
				</div>
			  </div>
			  

			<div class="row mb-3">
			  <label for="Date" class="col-sm-2 col-form-label">Date</label>			  
			  <div class="col-sm-10">
				<input type="Date" class="Date" id="txtDOB" name="datee" placeholder="MM-DD-YY" value="#Dob#" >
				<!-- <input type="age" id="Dob" placeholder="age"> -->
				<span id="setage" ></span>
			  </div>
			</div>
			<div class="row mb-3">
			  <legend class="col-form-label col-sm-2 pt-0" >Gender:</legend>
			  
			  <div class="col-sm-10">
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="Male" <cfif gender1 eq "Male" >checked</cfif>>
				  <label class="form-check-label" for="gridRadios1">
					Male
				  </label>
				</div>
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="Female" <cfif gender1 eq "Female">checked</cfif>>
				  <label class="form-check-label" for="gridRadios2">
					Female
				  </label>
				</div>
				<span id="radio1" ></span> 
				</div> 
			  </div>

			<div class="row mb-3">
				<label for="inputFirstName" class="col-sm-2 col-form-label">selection</label>
				<div class="col-sm-10 ">
					<select class="form-select"  id="select" aria-label="Default select example" name="selection" >
				 
						<option selected >Open this select menu</option>
						<option value="DIPLOMA"<cfif sel eq 'DIPLOMA'>selected</cfif>>DIPLOMA</option>
						<option value="GRADUATE"<cfif sel eq 'GRADUATE'>selected</cfif>>GRADUATE</option>
						<option value="POST_GRADUATE"<cfif sel eq 'POST_GRADUATE'>selected</cfif>>POST_GRADUATE</option>
				   
					  </select>
					  <span id="select1" ></span>
					</div>
				  </div>
				  <div class="row mb-3">
					<label class="col-sm-2 col-form-label" for="file"> Image: </label>
					<div class="col-sm-10 ">
					  <!-- <input type="file" id="file" class="form-control"> -->
					  <input type="file" id="filename" name="filenamee" accept="image/gif, image/jpeg, image/png">


					   <div>
						 <input type="hidden" name="oldfilename"  value="#img#"> 
						<!-- <img src="" class="preview" width="100px" height="100px"/> -->
					</div>
					  <img id="output" src="image/#img#" width="100" height="100" >
					  <span id="img1"></span>
					</div>
				  </div>
					<div class="row mb-3">
					  <div class="col-sm-10 offset-sm-2">
						<div class="form-check">
						  <input class="form-check-input" type="checkbox" id="gridCheck1" >
						  <label class="form-check-label" for="gridCheck1">
							i agree all terms and conditions 
						  </label>
						</div>
						<span id="box"></span>
					  </div>
					</div>
				  <button type="button" class="btn btn-danger btn-sm " id="ab">BACK TO LIST</button>				  
				  <button type="submit" class="btn btn-success btn-sm" id="bc" name="createdata" value="1">SAVE</button>
				  
				</form>
			  </div>
			  <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
			  <script src="assets/js/jquerylogin.js"></script>
			</cfoutput>
			</body>
</html>
