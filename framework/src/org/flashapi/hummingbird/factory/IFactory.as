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

package org.flashapi.hummingbird.factory {
	
	// -----------------------------------------------------------
	//  IFactory.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 28/04/2013 10:36
	 *  @see http://www.flashapi.org/
	 */
	
	import org.flashapi.hummingbird.view.IView;
	
	/**
	 * 	The root interface for accessing a Hummingbird MVC container. This is the 
	 * 	 client view of a MVC object container.
	 * 
	 * 	<p>This interface is implemented by objects that hold a number of MVC objects
	 * 	definitions, each uniquely identified by a <code>String</code> alias.</p>
	 * 
	 * 	<p>The point of this approach is that the MVC factory is a central registry
	 * 	of application components, and centralizes configuration of application
	 * 	components</p>
	 */
	public interface IFactory {
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		//--> TODO : add a Singleton creation process to this method.
		/**
		 * 	Returns an instance of type <code>IView</code> built from the specified
		 * 	class type reference.
		 * 
		 * 	@param	ClassRef	The type reference of the class used to instantiate
		 * 						this view.
		 * 
		 * 	@return	An instance of type <code>IView</code>.
		 * 
		 * 	@throws org.flashapi.hummingbird.exceptions.MetadataException
		 * 			Throws a <code>MetadataException</code> exception if the specified
		 * 			view object contains invalid Metadata.
		 */
		function createView(ClassRef:Class):IView;
	}
}