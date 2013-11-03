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

package controllers {
	
	// -----------------------------------------------------------
	//  AppController.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 02/11/2013 14:32
	 *  @see http://www.flashapi.org/
	 */
	
	import constants.CaseMode;
	import models.IAppModel;
	import org.flashapi.hummingbird.controller.AbstractController;
	import services.ITagsService;
	
	/**
	 * 	The <code>AppController</code> class represents the default controller of 
	 * 	your application.
	 */
	[Qualifier(alias="AppController")]
	public final class AppController extends AbstractController implements IAppController {
		
		//--------------------------------------------------------------------------
		//
		//  Dependencies injection
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	The model of the application.
		 */
		[Model(alias="AppModel")]
		public var model:IAppModel;
		
		/**
		 * 	The main service of the application.
		 */
		[Service(alias="TagsService")]
		public var service:ITagsService;
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		public function setInputValue(value:String):void {
			this.model.removeAllTags();
			if (value != "") {
				var matchingTags:Vector.<String> = 
					this.service.getMatchingTags(value, this.model.getCaseMode());
				var len:int = matchingTags.length - 1;
				for (; len >= 0; len--) {
					this.model.addTag(matchingTags[len]);
				}
			}
			this.model.tagCollectionUpdateComplete();
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function setCaseMode(caseMode:uint):void {
			this.model.setCaseMode(caseMode);
		}
	}
}