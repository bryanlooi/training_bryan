<cf_presideparam name="args.page_title"   field="page.title"        editable="true" />
<cf_presideparam name="args.main_content" field="page.main_content" editable="true" />

<cfscript>
	eventDetails   = args.eventDetails ?: QueryNew("");
	categories 	   = args.categories   ?: QueryNew("");

	selectedCategory = rc.category 	   ?: '';
</cfscript>

<!--- Debug --->
<!---
selectedCategory
<cfdump  var="#selectedCategory#"><br>
rc
<cfdump  var="#rc#"><br>
args.categories
<cfdump  var="#args.categories#"><br>
args.eventDetails
<cfdump  var="#args.eventDetails#"><br>
--->

<cfoutput>

	#renderViewlet( event="page-types.event_listing._featuredEventsViewlet", args = { } )#
<!--- 					   , args={ eventListingPage=event.getCurrentPageId() } )# --->

	<form name="events-search" action="#event.buildLink()#" method="POST"> 

		<fieldset>
			<select name="category">
				<option value="">All</option>
				<cfloop query="categories">
					<option value="#id#" <cfif id eq selectedCategory>selected</cfif> >#label#</option>
				</cfloop>
			</select>
		</fieldset>

		<input type="submit" value="Search" />
	</form>

	<p>Search Criteria: #renderLabel("category", selectedCategory)# </p>

	<h1>#args.page_title#</h1>
	<p>#args.main_content#</p>

	<cfif eventDetails.recordcount>
		<div class="row">
			<ol>
			<cfloop query="eventDetails">
				<cfif !len(selectedCategory) || category == selectedCategory>
					<p>
						<font size="4"><b>
							<a href="#event.buildLink(page=id)#">#title#</a> 
						</b></font><br>
						#DateTimeFormat(start_date, 'd mmm, H:nn tt')# 
							- #DateTimeFormat(end_date, 'd mmm, H:nn tt')#<br>
						<b>#category_label#</b><br>
						<b>#region_label#</b>
					</p>
				</cfif>
			</cfloop>
			</ol>
		</div>
	</cfif>

</cfoutput>