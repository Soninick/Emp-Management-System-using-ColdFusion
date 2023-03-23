<cfparam name="createdata" default= 0>
<!--- <cfdump var = "#form#">
<cfabort> --->
  <cfif isDefined("form.createdata")>

    <cffile action="upload"
    fileField="filenamee" nameconflict="MAKEUNIQUE" 
    destination="C:\ColdFusion2016\cfusion\wwwroot\NiceAdmin\image" result ="filenamee" >

   
      <cfset firstname="#form.FirstName#">
      <cfset lastname="#form.LastName#">
      <cfset emailid="#form.email#">
      <cfset mobile="#form.mobile#">
      <cfset password="#form.passwd#">
      <cfset data="#form.datee#">
      <cfset gender="#form.gridRadios#">
      <cfset select="#form.selection#">
      <cfset image="#filenamee.SERVERFILE#">
      <cfquery name="employees" datasource="EMPDATA">
        <!--- UPDATE employee_details --->
          insert into employee_details(`first_name`,`last_name`,`email`,`mobile`,`password`,`date`,`gender`,`select`,`image`) values('#firstname#','#lastname#','#emailid#','#mobile#','#password#','#data#','#gender#','#select#','#image#')
      </cfquery>
      <cflocation url="../addEditEmp.cfm" addtoken="no">
    </cfif>

    
   