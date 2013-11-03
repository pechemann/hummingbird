/////////////////////////////////////////////////////////////////////////////////////
//
//    Simplified BSD License
//    ======================
//    
//    Copyright 2013 Pascal ECHEMANN. All rights reserved.
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

package models {
	
	// -----------------------------------------------------------
	//  IAppModel.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 02/11/2013 14:32
	 *  @see http://www.flashapi.org/
	 */
	
	import mx.collections.ArrayCollection;
	import org.flashapi.hummingbird.model.IModel;
	
	/**
	 * 	The <code>IAppModel</code> interface represents the facade for the default 
	 * 	model of your application.
	 */
	public interface IAppModel extends IModel {
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Returns the case mode of the auto-completion. The default value is
		 * 	 <code>CaseMode.CASE_SENSITIVE</code>.
		 * 
		 *	@return	A constant of the <code>CaseMode</code> class.
		 * 
		 * 	@see constants.CaseMode
		 */
		function getCaseMode():uint;
		
		/**
		 * 	Sets the case mode of the auto-completion.
		 * 
		 *	@param	caseMode A constant of the <code>CaseMode</code> class.
		 * 
		 * 	@see constants.CaseMode
		 */
		function setCaseMode(caseMode:uint):void;
		
		/**
		 * 	Returns a <code>Boolean</code> value that indicates whether the user input 
		 *	has matching tags (<code>true</code>), or not (<code>false</code>).
		 * 
		 * 	@return	<code>true</code> if the user input has matching tags;
		 * 			<code>false</code> otherwise.
		 */
		function hasMatchingTags():Boolean;
		
		/**
		 * 	Returns static the collection of all the tags that can be used for
		 * 	auto-completion.
		 * 
		 * 	@return	A <code>Vector</code> of <code>String</code> objects.
		 */
		function getTagCollection():ArrayCollection;
		
		/**
		 * 	Removes all the tags from the auto-completion collection.
		 */
		function removeAllTags():void;
		
		/**
		 * 	Add a tag to the auto-completion collection.
		 * 
		 * 	@param tag the value of the tag item to add to the collection.
		 */
		function addTag(tag:String):void;
		
		/**
		 * 	Method invoked by the controller at the end of the collection update.
		 */
		function tagCollectionUpdateComplete():void;
	}
}