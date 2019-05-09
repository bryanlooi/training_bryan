component {
	/**
	* @eventListingDao.inject presidecms:object:event_listing
	* @eventDetailsDao.inject presidecms:object:event_details
	* @siteTreeService.inject siteTreeService
	*/


	public any function init(  required any eventListingDao
							 , required any eventDetailsDao
							 , required any siteTreeService ) {
		_setEventListingDao( arguments.eventListingDao );
		_setEventDetailsDao( arguments.eventDetailsDao );
		_setSiteTreeService( arguments.siteTreeService );
		return this;
	}

	public query function getEventDetails(  required string parentPage
										  , string region = "" ) {
		// var filter = "page.parent_page = :parent_page and DATE(date_published) <= :dateNow";
		// var filterParams = { "parent_page" = event.getCurrentPageId()
		// 					, dateNow = { value=DateFormat( NOW()
		// 								 , 'yyyy-mm-dd'
		// 								 , type="date" ) } };

		var _filter = "page.parent_page = :page.parent_page";
		var _filterParams = { "page.parent_page" = arguments.parentPage };


		// if( len(arguments.region) ) {
		// 	_filter					  &= " AND region.id = :region.id ";
		// 	_filterParams["region.id"] = arguments.region;
		// }

		return _getEventDetailsDao().selectData(
			  selectFields = [  
				  "page.id"
				, "page.title"
				, "event_details.start_date"
				, "event_details.end_date"
				, "event_details.category"
				, "category.label AS category_label"
				, "GROUP_CONCAT(region.label) AS region_label"
			  ]
			, filter 	   = _filter
			, filterParams = _filterParams
			, extraFilters = [ _getSiteTreeService().getActivePageFilter() ]
			, groupBy	   = "page.title"
			, orderBy 	   = "page.title ASC" );
	}

	public query function getEventCategories() {
		return _getEventDetailsDao().selectData (
			  selectFields = [ "category.id", "category.label" ]
			, extraFilters = [ _getSiteTreeService().getActivePageFilter() ]
			, groupBy 		 = "category.label"
			, orderBy 		 = "category.label ASC"
		);
	}

	public query function getFeaturedEvents( limit=3 ) {
		return _getEventListingDao().selectData(
			  selectFields = [ "featured_events.id", "featured_events$page.title" ]
			, orderBy = "event_details__join__event_listing.sort_order"
		);
	}


	//GETTERS AND SETTERS
	private any function _getEventListingDao() {
		return _eventListingDao;
	}
	
	private void function _setEventListingDao( required any eventListingDao ) {
		_eventListingDao = arguments.eventListingDao;
	}

	private any function _getEventDetailsDao() {
		return _eventDetailsDao;
	}
	
	private void function _setEventDetailsDao( required any eventDetailsDao ) {
		_eventDetailsDao = arguments.eventDetailsDao;
	}

	private any function _getSiteTreeService() {
		return _sitetreeService;
	}

	private void function _setSiteTreeService( required any siteTreeService ) {
		_siteTreeService = arguments.siteTreeService;
	}
}