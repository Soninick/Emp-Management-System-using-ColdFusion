
       <cffile action="upload" fileField="NEWPROIMG" nameconflict="MAKEUNIQUE" destination="C:\ColdFusion2016\cfusion\wwwroot\NiceAdmin\image" result ="newFileResult" >
       <cfset newFileName = "#newFileResult.SERVERFILE#">
      
    <cfquery name="editSingleData" datasource="EMPDATA"> 
        update employee_details 
        Set `image`='#newFileName#'
        where id = <cfqueryparam value="#session.loginId#" cfsqltype="cf_sql_integer">
    </cfquery>
    <cfset session.loginImage = newFileName>
    
     