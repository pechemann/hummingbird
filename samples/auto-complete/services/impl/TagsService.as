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

package services.impl {
	
	// -----------------------------------------------------------
	//  TagsService.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 02/11/2013 14:32
	 *  @see http://www.flashapi.org/
	 */
	
	import constants.CaseMode;
	import org.flashapi.hummingbird.service.AbstractService;
	import services.ITagsService;
	
	/**
	 * 	The <code>TagsService</code> class represents concrete implementation of
	 * 	the <code>ITagsService</code> interface.
	 */
	[Qualifier(alias="TagsService")]
	public class TagsService extends AbstractService implements ITagsService {
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		public function getMatchingTags(value:String, caseMode:uint):Vector.<String> {
			var coll:Vector.<String> = new Vector.<String>();
			if (value != "") {
				var compareFunction:Function = this.getCompareFunction(caseMode);
				var len:int = TagsService.TAG_COLLECTION.length - 1;
				var tag:String;
				for (; len >= 0; len--) {
					tag = TagsService.TAG_COLLECTION[len];
					if(compareFunction(value, tag)) {
						coll.push(tag);
					}
				}
			}
			return coll;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	A static collection of tags for the auto-completion.
		 */
		private static const TAG_COLLECTION:Vector.<String> = new <String>[
			"ActionScript",
			"AppleScript",
			"Asp",
			"BASIC",
			"C",
			"C++",
			"Clojure",
			"COBOL",
			"ColdFusion",
			"Erlang",
			"Fortran",
			"Groovy",
			"Haskell",
			"Java",
			"JavaScript",
			"Lisp",
			"Perl",
			"PHP",
			"Python",
			"Ruby",
			"Scala",
			"Scheme"
		];
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Returns a reference to the method used to compare the user input value
		 * 	and all stored tags
		 * 
		 * 	@param	caseMode	Indicates the case mode of the application. A constant
		 * 						of the <code>CaseMode</code> class.
		 * 	@return	The method used to compare the user input value and all stored
		 * 			tags.
		 * 
		 * 	@see constants.CaseMode
		 */
		private function getCompareFunction(caseMode:uint):Function {
			var compareFunction:Function;
			if (caseMode == CaseMode.CASE_SENSITIVE) {
				compareFunction = this.getSensitiveTagResult;
			} else if (caseMode == CaseMode.CASE_INSENSITIVE) {
				compareFunction = this.getInsensitiveTagResult;
			}
			return compareFunction;
		}
		
		/**
		 * 	Compares the user input value and a stored tag. Comparaison is case
		 * 	sensitive.
		 * 
		 * 	@param	value	The user input value.
		 * 	@param	tag		The stored tag to compare with the <code>value</code>
		 * 					parameter.
		 * 
		 *	@return	<code>true</code> if <code>value</code> matches <code>tag</code>;
		 * 			<code>false</code> otherwise.
		 */
		private function getSensitiveTagResult(value:String, tag:String):Boolean {
			return Boolean(tag.indexOf(value) != -1);
		}
		
		/**
		 * 	Compares the user input value and a stored tag. Comparaison is case
		 * 	insensitive.
		 * 
		 * 	@param	value	The user input value.
		 * 	@param	tag		The stored tag to compare with the <code>value</code>
		 * 					parameter.
		 * 
		 *	@return	<code>true</code> if <code>value</code> matches <code>tag</code>;
		 * 			<code>false</code> otherwise.
		 */
		private function getInsensitiveTagResult(value:String, tag:String):Boolean {
			var v:String = value.toLocaleLowerCase();
			var t:String = tag.toLocaleLowerCase();
			return Boolean(t.indexOf(v) != -1);
		}
	}
}