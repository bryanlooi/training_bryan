component dataManagerGroup="Lookup" {
	property name="name";
	property name="start_date" type="date" dbtype="datetime" required="true";
	property name="event_detail" 
			 relatedto="event_details" 
			 relationship="many-to-one";
}