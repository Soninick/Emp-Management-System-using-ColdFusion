<!--- <cfdump var="#checkps#">
<cfabort> --->
<cfquery name="checkpass" datasource="EMPDATA"> 
select * FROM employee_details 
where `password`=<cfqueryparam value="#checkps#" cfsqltype="cf_sql_integer"> and id ="#session.loginid#";
</cfquery>





