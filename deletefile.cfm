<cfif isDefined("url.id")>
	<cfquery name="editSingleData" datasource="EMPDATA"> 
		delete from employee_details where id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
	</cfquery>
	<cfset session.isdeleted = true >
	<cflocation url="index.cfm" addtoken="no">
</cfif>