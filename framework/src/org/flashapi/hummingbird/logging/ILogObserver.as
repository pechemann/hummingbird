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

package org.flashapi.hummingbird.logging {
	
	// -----------------------------------------------------------
	//  ILogObserver.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 27/10/2013 08:58
	 *  @see http://www.flashapi.org/
	 */
	
	import org.flashapi.hummingbird.core.IFinalizable;
	
	/**
	 *  The <code>ILogObserver</code> interface defines the basic set of APIs 
	 * 	implemented by custom Log manager utilities.
	 */
	public interface ILogObserver extends IFinalizable {
		
		//--------------------------------------------------------------------------
		//
		//  Getter / setter properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Indicates whether the "[Hummingbird]" tag for the log be should added to
		 * 	the outpout (<code>true</code>), or not (<code>false</code>).
		 * 
		 * 	@default true
		 */
		function get includeFrameworkTag():Boolean;
		function set includeFrameworkTag(value:Boolean):void;
		
		/**
		 * 	Indicates whether the level for the log be should added to the outpout
		 * 	(<code>true</code>), or not (<code>false</code>).
		 * 
		 * 	@default true
		 */
		function get includeLevel():Boolean;
		function set includeLevel(value:Boolean):void;
		
		/**
		 * 	The separator string to use between fields.
		 * 
		 * 	@default " "
		 */
		function get fieldSeparator():String;
		function set fieldSeparator(value:String):void;
		
		/**
		 * 	Indicates whether the date for the log be should added to the outpout
		 * 	(<code>true</code>), or not (<code>false</code>).
		 * 
		 * 	@default true
		 */
		function get includeDate():Boolean;
		function set includeDate(value:Boolean):void;
		
		/**
		 * 	Indicates whether the time for the log be should added to the outpout
		 * 	(<code>true</code>), or not (<code>false</code>).
		 * 
		 * 	@default true
		 */
		function get includeTime():Boolean;
		function set includeTime(value:Boolean):void;
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Sets the <code>ILogger</code> singleton reference to this 
		 * 	<code>ILogObserver</code> object.
		 * 
		 * 	@param The category of the Flex logger that is used by this adapter.
		 * 
		 * 	@see org.flashapi.hummingbird.logging.ILogger
		 * 	@see org.flashapi.hummingbird.core.HummingbirdBase#getLogger()
		 */
		function setLogger(logger:ILogger):void;
		
		/**
		 * 	Returns the <code>ILogger</code> singleton reference for this 
		 * 	<code>ILogObserver</code> object.
		 * 
		 * 	@return The <code>ILogger</code> singleton reference for this 
		 * 			<code>ILogObserver</code> object.
		 * 	@see org.flashapi.hummingbird.logging.ILogger
		 */
		function getLogger():ILogger;
	}
}