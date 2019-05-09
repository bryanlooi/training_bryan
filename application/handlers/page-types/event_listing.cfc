component {

	property name="presideObjectService" inject="PresideObjectService";
	property name="eventsService" inject="EventsService";

	private function index( event, rc, prc, args={} ) {

		args.eventDetails = eventsService.getEventDetails(  
			  parentPage = event.getCurrentPageId()
			, region     = rc.region ?: "" 
		);

		args.categories = eventsService.getEventCategories();

		return renderView(
			  view          = "page-types/event_listing/index"
			, presideObject = "event_listing"
			, id 			= event.getCurrentPageId()
			, args			= args
		);
	}

	// private function featuredEventsViewlet( event, rc, prc, args={} ) {
	// 	return renderView(
	// 		  view = "page-types/event_listing/_featuredEvents"
	// 		, args = args
	// 	);
	// }

}