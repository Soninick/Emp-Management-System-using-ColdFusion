<cfif isDefined("url.id")>
    <!--- <cfdump var ="#form#"> --->
    <!--- <cfdump var ="#expandPath("../image/#form.oldfilename#")#"> --->
    <!--- <cfabort> --->

    <cfif form.filenamee NEQ "">
        <cffile action="upload"
        fileField="filenamee" nameconflict="MAKEUNIQUE" 
        destination="C:\ColdFusion2016\cfusion\wwwroot\NiceAdmin\image" result ="newFileResult" >
        <cfset newFileName = "#newFileResult.SERVERFILE#">
        <cfscript>
            if ( fileExists(expandPath("../image/#form.oldfilename#")) ){
                fileDelete(expandPath("../image/#form.oldfilename#"));
            }
        </cfscript>

    <cfelse>
        <cfset newFileName = "#form.oldfilename#">
        <!--- <cfset #session.loginImage# = newFileName > --->
    </cfif>
    <cfquery name="editSingleData" datasource="EMPDATA"> 
        update employee_details set `first_name` = '#form.FIRSTNAME#',`last_name`='#form.LASTNAME#',`email`='#form.EMAIL#',`mobile`='#form.MOBILE#',`password`='#form.PASSWD#',`date`='#form.DATEE#',`gender`='#form.GRIDRADIOS#',`select`='#form.SELECTION#',`image`='#newFileName#'
        where id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
    </cfquery>
     <cfset session.loginImage = newFileName>
     <cflocation url="../index.cfm" addtoken="no">
    </cfif>