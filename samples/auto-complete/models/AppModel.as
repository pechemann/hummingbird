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
	//  AppModel.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 02/11/2013 14:32
	 *  @see http://www.flashapi.org/
	 */
	
	import constants.CaseMode;
	import events.ModelEvent;
	import mx.collections.ArrayCollection;
	import org.flashapi.hummingbird.model.AbstractModel;
	
	/**
	 * 	The <code>AppModel</code> class represents the default model of your
	 * 	application.
	 */
	[Qualifier(alias="AppModel")]
	public class AppModel extends AbstractModel implements IAppModel {
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		public function getCaseMode():uint {
			return _caseMode;
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function setCaseMode(caseMode:uint):void {
			_caseMode = caseMode;
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function hasMatchingTags():Boolean {
			return Boolean(_tagColl.length > 0);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function getTagCollection():ArrayCollection {
			return _tagColl;
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function removeAllTags():void {
			_tagColl.removeAll();
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function addTag(tag:String):void {
			_tagColl.addItem(tag);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function tagCollectionUpdateComplete():void {
			this.dispatchEvent(new ModelEvent(ModelEvent.MODEL_UPDATE));
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Stores the case mode of the application.
		 */
		private var _caseMode:uint = CaseMode.CASE_SENSITIVE;
		
		/**
		 * 	@private
		 * 
		 * 	The collection of tags to be displayed by the AutoComplete component.
		 */
		private var _tagColl:ArrayCollection = new ArrayCollection();
	}
}