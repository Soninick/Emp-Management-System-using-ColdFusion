<cfdump var= "#form#" >
<cfabort>
<cfif isDefined("url.id")>
<cfif form.newProImg NEQ "">
    <cffile action="upload" fileField="form.NEWPROIMG" nameconflict="MAKEUNIQUE" destination="C:\ColdFusion2016\cfusion\wwwroot\NiceAdmin\image" result ="newFileResult" >
    <cfset newFileName = "#newFileResult.SERVERFILE#">
    <cfscript>
        if ( fileExists(expandPath("../image/#form.oldProImg#")) ){
            fileDelete(expandPath("../image/#form.oldProImg#"));
        }
    </cfscript>

<cfelse>
    <cfset newFileName = "#form.oldProImg#">
    <!--- <cfset session.loginImage = newFileName > --->
</cfif>
<cfquery name="editSingleData" datasource="EMPDATA"> 
    update employee_details set `image`='#newFileName#'
    where id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
</cfquery>
 <cfset session.loginImage = newFileName>
 <!--- <cflocation url="index.cfm" addtoken="no"> --->
</cfif>