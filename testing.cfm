<!--- <cfset faq = []>
<cfset ArrayAppend(faq, "What are ColdFusion arrays")>
<cfset ArrayAppend(faq, "How to create a ColdFusion array?")>
<cfset ArrayAppend(faq, "What are two dimensional arrays?")>
<cfdump var= "#faq#">


<!--- <cfloop Array= "#faq#" item = "item">
    <cfoutput>
    <!--- #idx#<br /> --->
    #item#<br/>
    </cfoutput>
  </cfloop> --->

  <cfloop list = "a,d,f,g,h,d,e,t,1,2,3,4" index="ListItem">
    
    <cfoutput>
    #ListItem#<br/>
</cfoutput>
</cfloop>


<cfset variablename="value">

<cfoutput>
#variablename#
</cfoutput>
<cfparam name="Signupsubmitbutton" default= 0>
<cfdump var = "#form#">

<cfset variablename="value">
<cfoutput>
#variablename#
</cfoutput>

<cfset Session.BodyType = "Perfect">
<cfoutput>
  Body Type: #Session.BodyType#
</cfoutput> --->

<cfquery name="employees" datasource="EMPDATA"> 
  SELECT *
  FROM employee_details 
  </cfquery> 
  <cfoutput query="employees"> 
  #employees.first_name#, #employees.last_name#, #employees.email#<br> 
  </cfoutput> 
  
<!--- <cfloop query="employees">
  <cfoutput>
  <tr>
    <td>$64</td>
   </tr>   
    </cfloop>
  </cfoutput> --->



  <!-- Button trigger modal -->
                 

                  <!-- Modal -->
                  <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          ...
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                          <button type="button" class="btn btn-primary">Understood</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <cfif StructKeyExists(session,"session.loginId") and session.loginRoleId eq 1>
                  </cfif>




                  <!-- Customers Card -->
					<div class="col-xxl-4 col-xl-12">
            <div class="card info-card customers-card">		
    <div class="filter">
    <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
      <li class="dropdown-header text-start">
      <h6>Filter</h6>
      </li>

      <li><a class="dropdown-item" href="#">Today</a></li>
      <li><a class="dropdown-item" href="#">This Month</a></li>
      <li><a class="dropdown-item" href="#">This Year</a></li>
    </ul>
    </div>

    <div class="card-body">
      <cfquery name="qCount" datasource="EMPDATA">
        SELECT COUNT(*) AS rowCount
        FROM employee_details
        </cfquery>					  
        <span class="text-danger small pt-1 fw-bold"><cfoutput>#qCount.rowCount#</cfoutput></span> <span class="text-muted small pt-2 ps-1">Member's</span>		
        
    <h5 class="card-title">Employees<span>| This Year</span></h5>		
    <div class="d-flex align-items-center">
      <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
      <i class="bi bi-people"></i>
      </div>
      <div class="ps-3">						
      </div>
    </div>		
    </div>
  </div>		
  </div><!-- End Customers Card -->


  <html>
    <body>
        <head>
          <meta charset="utf-8">
          <title>How To Validate Password And Confirm Password Using JQuery - techsolutionstuff.com</title>
          <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
          <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
          <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        </head>
        <div class="row">
          <div class="col-md-6 col-md-offset-3"> 
  <h4 style="margin-top:50px;"><b>How To Validate Password And Confirm Password Using JQuery - techsolutionstuff.com</b></h4><br />
              Enter Password <input type="password" class="form-control" id="Password" placeholder="Enter a password" name="password"><br /> <br / >
              Enter Confirm Password <input type="password" class="form-control" id="ConfirmPassword" placeholder="Enter a Confirm Password" name="confpassword" >
              <div style="margin-top: 7px;" id="CheckPasswordMatch"></div>
          </div>
        </div>
    <body>
  </html>

  $(document).ready(function () {
    $("#updatepass").on('keyup', function(){
      var password = $("#Password").val();
      var confirmPassword = $("#ConfirmPassword").val();
      if (password != confirmPassword)
          $("#CheckPasswordMatch").html("Password does not match !").css("color","red");
      else
          $("#CheckPasswordMatch").html("Password match !").css("color","green");
     });
  });

  $(document).ready(function() {
    $("#change-password-link").click(function() {
      $("#password-change-form").show();
      return false;
    });

    $("#submit-password-change").click(function() {
      var oldPassword = $("#old-password").val();
      var newPassword = $("#new-password").val();

      $.post("change-password.cfm", {
        oldPassword: oldPassword,
        newPassword: newPassword
      }, function(response) {
        if (response == "success") {
          alert("Password changed successfully.");
        } else {
          alert("Incorrect old password, try again.");
        }
      });
    });
  });  



  $.ajax({
    url:'changepass.cfm',
    type:'POST',               
    data:{Password:Password
    }
    success:function(dataget){
        $('#oldpassword').html(dataget);
    }
});

