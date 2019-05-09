<!---
<cf_presideparam name="args.title"         field="page.title"        editable="true" />
<cf_presideparam name="args.main_content"  field="page.main_content" editable="true" />

<cfscript>
	writeDump(args._id);
	writedump(args);
</cfscript>

<cfoutput>
	<h1>#args.title#</h1>
	#args.main_content#

	#renderViewlet( event="page-types.event_details.regionRelatedEventsViewlet", args={event_id=args._id} )#
</cfoutput>
--->

<cf_presideparam name="args.title"         field="page.title"        editable="true" />
<cf_presideparam name="args.main_content"  field="page.main_content" editable="true" />
<cf_presideparam name="args.category" field="category.label" editable="false" />
<cf_presideparam name="args.parent_page" field="page.parent_page" editable="false" />
<cf_presideparam name="args.region" field="GROUP_CONCAT( regions.id )" editable="false" />


<cfoutput>
	<h1>#args.title#</h1>
	#args.main_content#

	<cfif len(args.category?:"")>
		<p>Category: #args.category#</p>
	</cfif>

	#renderViewlet( event="page-types.event_details.regionRelatedEventsViewlet", args={event_id=args._id} )#
	<a href="#event.buildLink(page=args.parent_page)#">Go back!</a></p>
</cfoutput>