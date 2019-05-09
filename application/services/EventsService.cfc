component {
	/**
	* @eventDetailsDao.inject presidecms:object:event_details
	* @siteTreeService.inject siteTreeService
	*/


	public any function init(  required any eventDetailsDao
							 , required any siteTreeService ) {
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
			, maxRows	   = args.limit
			, filter	   = "event_details.featured = TRUE"
			, extraFilters = [ _getSiteTreeService().getActivePageFilter() ]
			, groupBy	   = "page.title"
			, orderBy 	   = "page.title ASC" );
	}


	//GETTERS AND SETTERS
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