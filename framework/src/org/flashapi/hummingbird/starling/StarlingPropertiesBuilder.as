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
	//  StarlingPropertiesBuilder.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 01/05/2013 11:54
	 *  @see http://www.flashapi.org/
	 */
	
	import flash.display.Stage3D;
	import flash.geom.Rectangle;
	
	/**
	 * 	The <code>StarlingPropertiesBuilder</code> class is a convenient builder 
	 * 	for easily creating instances of the <code>StarlingProperties</code> class.
	 * 
	 * 	@see org.flashapi.hummingbird.starling.StarlingProperties
	 */
	public class StarlingPropertiesBuilder {
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Creates and returns a new <code>StarlingProperties</code> instance, built
		 * 	from the values passed as parameters of the <code>StarlingPropertiesBuilder</code>
		 * 	class methods.
		 * 
		 * 	@return The built <code>StarlingProperties</code> instance.
		 */
		public function build():StarlingProperties {
			var props:StarlingProperties = new StarlingProperties();
			this.setValue(props, "antiAliasing", _antiAliasing);
			this.setValue(props, "showStats", _showStats);
			this.setValue(props, "viewPort", _viewPort);
			this.setValue(props, "stage3D", _stage3D);
			this.setValue(props, "renderMode", _renderMode);
			this.setValue(props, "profile", _profile);
			this.setValue(props, "enableErrorChecking", _enableErrorChecking);
			this.setValue(props, "handleLostContext", _handleLostContext);
			this.setValue(props, "multitouchEnabled", _multitouchEnabled);
			this.setValue(props, "simulateMultitouch", _simulateMultitouch);
			this.setValue(props, "shareContext", _shareContext);
			return props;
		}
		
		/**
		 * 	Sets the <code>antiAliasing</code> property of the built <code>StarlingProperties</code>
		 * 	instance.
		 * 
		 * 	@param	value	The new value for the <code>antiAliasing</code> property.
		 * 
		 * 	@return	 A reference to this <code>StarlingPropertiesBuilder</code> instance.
		 */
		public function antiAliasing(value:int):StarlingPropertiesBuilder {
			_antiAliasing = value;
			return this;
		}
		
		/**
		 * 	Sets the <code>showStats</code> property of the built <code>StarlingProperties</code>
		 * 	instance.
		 * 
		 * 	@param	value	The new value for the <code>showStats</code> property.
		 * 
		 * 	@return	 A reference to this <code>StarlingPropertiesBuilder</code> instance.
		 */
		public function showStats(value:Boolean):StarlingPropertiesBuilder {
			_showStats = value;
			return this;
		}
		
		/**
		 * 	Sets the <code>viewPort</code> property of the built <code>StarlingProperties</code>
		 * 	instance.
		 * 
		 * 	@param	value	The new value for the <code>viewPort</code> property.
		 * 
		 * 	@return	 A reference to this <code>StarlingPropertiesBuilder</code> instance.
		 */
		public function viewPort(value:Rectangle):StarlingPropertiesBuilder {
			_viewPort = value;
			return this;
		}
		
		/**
		 * 	Sets the <code>stage3D</code> property of the built <code>StarlingProperties</code>
		 * 	instance.
		 * 
		 * 	@param	value	The new value for the <code>stage3D</code> property.
		 * 
		 * 	@return	 A reference to this <code>StarlingPropertiesBuilder</code> instance.
		 */
		public function stage3D(value:Stage3D):StarlingPropertiesBuilder {
			_stage3D = value;
			return this;
		}
		
		/**
		 * 	Sets the <code>renderMode</code> property of the built <code>StarlingProperties</code>
		 * 	instance.
		 * 
		 * 	@param	value	The new value for the <code>renderMode</code> property.
		 * 
		 * 	@return	 A reference to this <code>StarlingPropertiesBuilder</code> instance.
		 */
		public function renderMode(value:String):StarlingPropertiesBuilder {
			_renderMode = value;
			return this;
		}
		
		/**
		 * 	Sets the <code>profile</code> property of the built <code>StarlingProperties</code>
		 * 	instance.
		 * 
		 * 	@param	value	The new value for the <code>profile</code> property.
		 * 
		 * 	@return	 A reference to this <code>StarlingPropertiesBuilder</code> instance.
		 */
		public function profile(value:String):StarlingPropertiesBuilder {
			_profile = value;
			return this;
		}
		
		/**
		 * 	Sets the <code>enableErrorChecking</code> property of the built <code>StarlingProperties</code>
		 * 	instance.
		 * 
		 * 	@param	value	The new value for the <code>enableErrorChecking</code> property.
		 * 
		 * 	@return	 A reference to this <code>StarlingPropertiesBuilder</code> instance.
		 */
		public function enableErrorChecking(value:Boolean):StarlingPropertiesBuilder {
			_enableErrorChecking = value;
			return this;
		}
		
		/**
		 * 	Sets the <code>handleLostContext</code> property of the built <code>StarlingProperties</code>
		 * 	instance.
		 * 
		 * 	@param	value	The new value for the <code>handleLostContext</code> property.
		 * 
		 * 	@return	 A reference to this <code>StarlingPropertiesBuilder</code> instance.
		 */
		public function handleLostContext(value:Boolean):StarlingPropertiesBuilder {
			_handleLostContext = value;
			return this;
		}
		
		/**
		 * 	Sets the <code>multitouchEnabled</code> property of the built <code>StarlingProperties</code>
		 * 	instance.
		 * 
		 * 	@param	value	The new value for the <code>multitouchEnabled</code> property.
		 * 
		 * 	@return	 A reference to this <code>StarlingPropertiesBuilder</code> instance.
		 */
		public function multitouchEnabled(value:Boolean):StarlingPropertiesBuilder {
			_multitouchEnabled = value;
			return this;
		}
		
		/**
		 * 	Sets the <code>simulateMultitouch</code> property of the built <code>StarlingProperties</code>
		 * 	instance.
		 * 
		 * 	@param	value	The new value for the <code>simulateMultitouch</code> property.
		 * 
		 * 	@return	 A reference to this <code>StarlingPropertiesBuilder</code> instance.
		 */
		public function simulateMultitouch(value:Boolean):StarlingPropertiesBuilder {
			_simulateMultitouch = value;
			return this;
		}
		
		/**
		 * 	Sets the <code>shareContext</code> property of the built <code>StarlingProperties</code>
		 * 	instance.
		 * 
		 * 	@param	value	The new value for the <code>shareContext</code> property.
		 * 
		 * 	@return	 A reference to this <code>StarlingPropertiesBuilder</code> instance.
		 */
		public function shareContext(value:Boolean):StarlingPropertiesBuilder {
			_shareContext = value;
			return this;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	The antialiasing level for the <code>Starling</code> instance.
		 */
		private var _antiAliasing:int;
		
		/**
		 * 	@private
		 * 
		 * 	Indicates whether to show stats, or not.
		 */
		private var _showStats:Boolean;
		
		/**
		 * 	@private
		 * 
		 * 	The viewport rectangle for the <code>Starling</code> instance.
		 */
		private var _viewPort:Rectangle;
		
		/**
		 * 	@private
		 * 
		 * 	The <code>Stage3D</code> reference for the <code>Starling</code> instance.
		 */
		private var _stage3D:Stage3D;
		
		/**
		 * 	@private
		 * 
		 * 	The rendering mode for the <code>Starling</code> instance.
		 */
		private var _renderMode:String;
		
		/**
		 * 	@private
		 * 
		 * 	The <code>Context3DProfile</code> that should be requested.
		 */
		private var _profile:String;
		
		/**
		 * 	@private
		 * 
		 * 	Indicates whether to enable for error checking, or not.
		 */
		private var _enableErrorChecking:Boolean;
		
		/**
		 * 	@private
		 * 
		 * 	Indicates whether to handle for error checking, or not.
		 */
		private var _handleLostContext:Boolean;
		
		/**
		 * 	@private
		 * 
		 * 	Indicates whether to enable multitouch, or not.
		 */
		private var _multitouchEnabled:Boolean;
		
		/**
		 * 	@private
		 * 
		 * 	Indicates whether to simulate multitouch, or not.
		 */
		private var _simulateMultitouch:Boolean;
		
		/**
		 * 	@private
		 * 
		 * 	Indicates whether the Context3D render calls are managed externally
		 * 	to Starling, or not.
		 */
		private var _shareContext:Boolean;
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	Sets the value to the specified property.
		 * 
		 * 	@param	props		A reference to the built <code>StarlingProperties</code>
		 * 						instance.
		 * 	@param	property	The property to set with the specified value.
		 * 	@param	value		The new value for the specified property.
		 */
		private function setValue(props:StarlingProperties, property:String, value:*):void {
			if (value) {
				props[property] = value;
			}
		}
	}
}