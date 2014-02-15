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

package org.flashapi.hummingbird.starling {
	
	// -----------------------------------------------------------
	//  StarlingProperties.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 01/05/2013 11:01
	 *  @see http://www.flashapi.org/
	 */
	
	import flash.display.Stage3D;
	import flash.geom.Rectangle;
	
	/**
	 * 	The <code>StarlingProperties</code> class is a convenient DTO for
	 * 	passing initialization properties to the <code>Starling</code> instance 
	 * 	associated to the Hummingbird container.
	 * 
	 * 	@see org.flashapi.hummingbird.starling.StarlingPropertiesBuilder
	 */
	public class StarlingProperties {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>StarlingProperties</code>
		 * 					instance.
		 */
		public function StarlingProperties() {
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	The antialiasing level; valid values are <code>0-16</code>, where <code>0</code>
		 * 	means no antialasing and <code>16</code> means maximum antialiasing.
		 * 
		 * 	@default 0
		 */
		public var antiAliasing:int = 0;
		
		/**
		 * 	Indicates whether the statistics box is visible (<code>true</code>), or 
		 * 	not (<code>false</code>).
		 * 
		 * 	@default false
		 */
		public var showStats:Boolean = false;
		
		/**
		 * 	A rectangle describing the area into which the content will be rendered.
		 * 
		 * 	@default null
		 */
		public var viewPort:Rectangle = null;
		
		/**
		 *  Specifies the <code>Stage3D</code> object into which the content will
		 * 	be rendered.
		 * 
		 * 	@default null
		 */
		public var stage3D:Stage3D = null;
		
		/**
		 * 	Specifies the <code>Context3DRenderMode</code> that should be requested.
		 * 
		 * 	@default Context3DRenderMode.AUTO
		 */
		public var renderMode:String = "auto";
		
		/**
		 * 	Specifies the <code>Context3DProfile</code> that should be requested.
		 * 
		 * 	@default Context3DProfile.BASELINE_CONSTRAINED
		 */
		public var profile:String = "baselineConstrained";
		
		/**
		 * 	Indicates whether <code>Stage3D</code> render methods will report errors  
		 * 	(<code>true</code>), or not (<code>false</code>).
		 * 
		 * 	@default false
		 */
		public var enableErrorChecking:Boolean = false;
		
		/**
		 * 	Indicates whether Starling should automatically recover from a lost device  
		 * 	context (<code>true</code>), or not (<code>false</code>).
		 * 
		 * 	@default false
		 */
		public var handleLostContext:Boolean = false;
		
		/**
		 * 	Indicates whether multitouch input should be supported (<code>true</code>),
		 * 	or not (<code>false</code>).
		 * 
		 * 	@default false
		 */
		public var multitouchEnabled:Boolean = false;
		
		/**
		 * 	Indicates whether multitouch simulation is enabled (<code>true</code>),
		 * 	or not (<code>false</code>).
		 * 
		 * 	@default false
		 */
		public var simulateMultitouch:Boolean = false;
		
		/**
		 * 	Indicates whether the <code>Context3D</code> render calls are managed
		 * 	externally to Starling (<code>true</code>), or not (<code>false</code>).
		 * 
		 * 	@default false
		 */
		public var shareContext:Boolean = false;
	}
}