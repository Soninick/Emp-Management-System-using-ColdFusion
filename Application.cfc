
<cfcomponent>
    <cfset application.name = "Employee System">
    <!--- <cfset This.clientmanagement="True"> --->
    <cfset This.loginstorage="Session">
    <cfset This.sessionmanagement="True">
    <cfset This.sessiontimeout="#createtimespan(0,1,0,0)#">
    <cfset This.applicationtimeout="#createtimespan(0,4,0,0)#">
    
</cfcomponent>