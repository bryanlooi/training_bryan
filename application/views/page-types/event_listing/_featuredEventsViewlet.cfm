<cfscript>
	featuredNews = args.featuredNews ?: QueryNew("");
</cfscript>

<cfdump  var="#args#">

<!--- <cfif featuredNews.recordcount> --->
	<div class="jumbotron">
		<h2>Featured Events</h2>
		<ul>
			<cfloop query="featured_events">
				<li><a href="#event.buildLink(page=id)#">#title#</a>
			</cfloop>
		</ul>
	</div>
<!--- </cfif> --->