component {
	property name="presideObjectService" inject="PresideObjectService";
	property name="eventsService" inject="EventsService";

	private function index( event, rc, prc, args={} ) {
		args.eventer = event.getCurrentPageId();

		return renderView(
			  view          = "page-types/event_details/index"
			, presideObject = "event_details"
			, id 			= event.getCurrentPageId()
			, args			= args
		);
	}

	private function regionRelatedEventsViewlet( event, rc, prc, args={} ) {
		var event_id_arg = args.event_id;
		args.regionRelatedEvents = eventsService.getRegionRelatedEvents( event_id = event_id_arg );

		return renderView(
			  view = "page-types/event_details/_regionRelatedEventsViewlet"
			, args = args
		);
	}
}