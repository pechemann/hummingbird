/////////////////////////////////////////////////////////////////////////////////////
//
//    Simplified BSD License
//    ======================
//    
//    Copyright 2013-2014 Pascal ECHEMANN. All rights reserved.
//    
//    Redistribution and use in source and binary forms, with or without modification,
//    are permitted provided that the following conditions are met:
//    
//    1. Redistributions of source code must retain the above copyright notice, this
//       list of conditions and the following disclaimer. 
//    
//    2. Redistributions in binary form must reproduce the above copyright notice,
//       this list of conditions and the following disclaimer in the documentation
//       and/or other materials provided with the distribution. 
//    
//    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//    ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//    WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//    DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
//    ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//    (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//    ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//    
//    The views and conclusions contained in the software and documentation are those
//    of the authors and should not be interpreted as representing official policies, 
//    either expressed or implied, of the copyright holders.
//    
/////////////////////////////////////////////////////////////////////////////////////

package org.flashapi.hummingbird.core {
	
	// -----------------------------------------------------------
	//  IHummingbirdContainer.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.2.1, 01/03/2014 09:51
	 *  @see http://www.flashapi.org/
	 */
	
	/**
	 * 	The <code>IHummingbirdContainer</code> interface is the representation of
	 * 	the Hummingbird IoC container that is responsible for creating and otherwise
	 * 	managing the MVC workflow.
	 */
	public interface IHummingbirdContainer {
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Declares the specified application context to the Hummingbird IoC container.
		 * 
		 * 	@param	applicationContext	The application context to be added to this
		 * 								Hummingbird IoC container.
		 */
		function setApplicationContext(applicationContext:IApplicationContext):void;
		
		/**
		 * 	Removes the specified application context from the Hummingbird IoC container.
		 * 
		 * 	@param	applicationContext	The application context to be removed from 
		 * 								this Hummingbird IoC container.
		 * 	@param	disposeMvcObjects	Indicates whether the IoC container must
		 * 								delete all the references of the MVC objects
		 * 								associated to the specified context (<code>true</code>),
		 * 								or not (<code>true</code>). The default value
		 * 								is <code>true</code>.
		 */
		function clearApplicationContext(applicationContext:IApplicationContext, disposeMvcObjects:Boolean = true):void;
		
		/**
		 * 	Returns the MVC object specified by its alias.
		 * 
		 * 	@param	alias	The alias associated with a MVC object.
		 * 	
		 * 	@return	The <code>IMVCObject</code> instance with the specified alias.
		 * 
		 * 	@throws org.flashapi.hummingbird.exceptions.NoSuchDefinitionException
		 * 			Throws a <code>NoSuchDefinitionException</code> exception if the
		 * 			<code>IHummingbirdContainer</code> container is asked for a
		 * 			MVC object instance alias for which it cannot find a definition.
		 */
		function getMVCObject(alias:String):IMVCObject;
		
		/**
		 * 	Returns an integer that represents the major version of the current Flash 
		 * 	Player instance. The the following string, the major version is "10" :
		 *  <code>WIN 10,1,52,14</code>
		 * 
		 * 	@return The major version of the current Flash Player instance.
		 */
		function getFlashPlayerMajorVersion():int;
		
		/**
		 * 	Removes the MVC object specified by its alias. You tipically use the
		 * 	<code>removeMVCObject()</code> method before calling the <code>finalize()</code>
		 * 	method on the specified MVC object to ensure freeing the memory used
		 * 	by this object.
		 * 
		 * 	@param	alias	The alias associated with a MVC object.
		 * 	
		 * 	@return	The removed <code>IMVCObject</code> instance.
		 * 
		 * 	@throws org.flashapi.hummingbird.exceptions.NoSuchDefinitionException
		 * 			Throws a <code>NoSuchDefinitionException</code> exception if the
		 * 			<code>IHummingbirdContainer</code> container is asked for a
		 * 			MVC object instance alias for which it cannot find a definition.
		 */
		function removeMVCObject(alias:String):IMVCObject;
		
		/**
		 * 	Returns a boolean value that indicates whether a MVC object with the
		 * 	specified alias is registered in the IoC container (<code>true</code>),
		 * 	or not (<code>false</code>).
		 * 
		 * 	@param	alias	The alias associated with the MVC object to match.
		 * 	
		 * 	@return	<code>true</code> whether the <code>IMVCObject</code> instance
		 * 			with the specified alias exists; <code>false</code> otherwise.
		 */
		function hasMVCObject(alias:String):Boolean;
		
		/**
		 * 	Performs the lookup method injection on the specified singleton object.
		 * 
		 * 	@param	obj The singleton object on which to perform the lookup method
		 * 				injection.
		 * 
		 * 	@throws org.flashapi.hummingbird.exceptions.MetadataException
		 * 			Throws a <code>MetadataException</code> exception if the specified
		 * 			singleton object contains invalid Metadata.
		 */
		function doLookup(obj:Object):void;
	}
}