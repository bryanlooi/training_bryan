<cfscript>
	writeDump(args)
	regionRelatedEvents = args.regionRelatedEvents ?: QueryNew("");
</cfscript>

<cfoutput>
	<cfif regionRelatedEvents.recordcount>
		<div class="jumbotron">
			<h2>Related Events In The Same Region!</h2>
			<ul>
				<cfloop query="regionRelatedEvents">
					<li><a href="#event.buildLink(page=id)#">#title#</a>
					| #category_label# | #region_label#
				</cfloop>
			</ul>
		</div>
	</cfif>
</cfoutput>