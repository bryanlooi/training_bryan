/**
* @allowedParentPageTypes event_listing
*/ 

component {
	property name="start_date" type="date" dbtype="datetime" required="true";
	property name="end_date" type="date" dbtype="datetime" required="true";

	property name="regions" relationship="many-to-many" relatedTo="region";
	property name="category" relationship="many-to-one" relatedTo="category";
	property name="programmes" 
			 relationship="one-to-many" 
			 relatedTo="programme" 
			 relationshipKey="name";

}