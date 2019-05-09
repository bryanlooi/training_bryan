/**
* @allowedParentPageTypes event_listing
* @allowedChildPageTypes none
*/ 


component {
	property name="start_date"type="date" dbtype="datetime" required="true";
	property name="end_date" type="date" dbtype="datetime" required="true";
	// property name="featured" type="boolean" dbtype="boolean";

	property name="regions" 
			 relationship="many-to-many"
			 relatedTo="region"
			 required="true"
			 default="Asia";

	property name="category"
			 relationship="many-to-one"
			 relatedTo="category"
			 required="true"
			 default="Sports";

	property name="programmes" 
			 relationship="one-to-many" 
			 relatedTo="programme" 
			 relationshipKey="event_detail";

}