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

package models.dto {
	
	// -----------------------------------------------------------
	//  Todo.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 31/10/2013 14:37
	 *  @see http://www.flashapi.org/
	 */
	
	import domain.business.business_internal;
	import org.flashapi.hummingbird.utils.DtoUtil;
	
	use namespace business_internal;
	
	/**
	 * 	The Data Transfert Object that represents a todo row in the Data base.
	 */
	public class Todo extends Object {
		
		//--------------------------------------------------------------------------
		//
		//  Getter / setter properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Returns the ID of this <code>Todo</code> instance. yhis property is
		 * 	immutable.
		 */
		public function get id():uint {
			return _id;
		}
		/**
		 * 	@private
		 */
		public function set id(value:uint):void { }
		
		/**
		 * 	Gets or sets the text of this <code>Todo</code> instance.
		 */
		public function get label():String {
			return _label;
		}
		public function set label(value:String):void {
			_label = value;
		}
		
		/**
		 * 	Indicates whether this <code>Todo</code> instance is completed (<code>true</code>),
		 * 	or not (<code>false</code>).
		 */
		public function get completed():Boolean {
			return _completed;
		}
		public function set completed(value:Boolean):void {
			_completed = value;
		}
		
		/**
		 * 	@private
		 * 
		 * 	Returns the GUID of this <code>Todo</code> instance.
		 */
		[Transient]
		public function get guid():uint {
			return _pseudoGuid;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 */
		public function toString():String {
			return DtoUtil.formatToString(this, "DtoUtil", "id", "label", "completed", "guid");
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 */
		private var _id:uint;
		
		/**
		 * 	@private
		 */
		private var _pseudoGuid:uint;
		
		/**
		 * 	@private
		 */
		private var _completed:Boolean;
		
		/**
		 * 	@private
		 */
		private var _label:String;
		
		//--------------------------------------------------------------------------
		//
		//  Iternal methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	Used by the DAO to set the GUID of this <code>Todo</code> instance.
		 */
		business_internal function setGuid(guid:uint):void {
			_pseudoGuid = guid;
		}
		
		/**
		 * 	@private
		 * 
		 * 	Used by the DAO to set the ID of this <code>Todo</code> instance.
		 */
		business_internal function setId(id:uint):void {
			_id = id;
		}
	}
}