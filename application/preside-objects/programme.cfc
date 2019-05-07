/**
 * @tablename	programmes
 * @tableprefix	prac1_
 */

component dataManagerGroup="Lookup" {
	property name="name";
	property name="start_date" type="date" dbtype="datetime" required="true";
}