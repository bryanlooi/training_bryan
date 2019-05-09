<cfscript>
	featured_events = args.featuredEvents ?: QueryNew("");
</cfscript>

<cfdump  var="#args#">
<cfdump  var="#featured_events#">

<cfoutput>
	<cfif featured_events.recordcount>
		<div class="jumbotron">
			<h2>Featured Events</h2>
			<ul>
				<cfloop query="featured_events">
					<li><a href="#event.buildLink(page=id)#">#title#</a>
				</cfloop>
			</ul>
		</div>
	</cfif>
</cfoutput>