/**
 * @allowedChildPageTypes event_details
 */


component  {
	property name="featured_events" relationship="many-to-many" relatedto="event_details";

	property name="region" relationship="many-to-one" relatedTo="region";
	property name="categories" relationship="many-to-many" relatedTo="category";


}