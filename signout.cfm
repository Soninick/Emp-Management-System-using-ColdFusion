<cfif StructKeyExists(session, "loginId")>
<cfset structClear(session)>
<cflocation url ="pages_login.cfm" addtoken="no">
</cfif>