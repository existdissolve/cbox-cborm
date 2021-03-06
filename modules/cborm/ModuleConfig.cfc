component {

	// Module Properties
	this.title 				= "cborm";
	this.author 			= "Luis Majano";
	this.webURL 			= "http://www.ortussolutions.com";
	this.description 		= "ColdBox ORM enhancements for Hibernate";
	this.version			= "1.0.0";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "cborm";
	// Model Namespace
	this.modelNamespace		= "cborm";
	// CF Mapping
	this.cfmapping			= "cborm";

	function configure(){

		// Custom Declared Points
		interceptorSettings = {
			customInterceptionPoints = [
				// CriteriaBuilder Events
				"onCriteriaBuilderAddition", "beforeCriteriaBuilderList", "afterCriteriaBuilderList", "beforeCriteriaBuilderCount",
				"afterCriteriaBuilderCount",
				// ORM Bridge Events
				"ORMPostNew", "ORMPreLoad", "ORMPostLoad", "ORMPostDelete", "ORMPreDelete", "ORMPreUpdate", "ORMPostUpdate",
				"ORMPreInsert", "ORMPostInsert", "ORMPreSave", "ORMPostSave", "ORMPostFlush", "ORMPreFlush"
			]
		};

		// Custom Declared Interceptors
		interceptors = [
		];

	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){
		// Read parent application config
		var oConfig = controller.getSetting( "ColdBoxConfig" );
		// Default Config Structure
		controller.setSetting( "orm", {
			injection = {
				enabled = true, include = "", exclude = ""
			}
		});
		// Check if we have defined DSL first in application config
		var ormDSL = oConfig.getPropertyMixin( "orm", "variables", structnew() );
		// injection
		if( structCount( ormDSL ) ){
			structAppend( controller.getSetting( "orm" ).injection, ormDSL.injection, true);
		}
	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){

	}

}