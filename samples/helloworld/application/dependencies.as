/////////////////////////////////////////////////////////////////////////////////////
//
//    Hummingbird Framework Template
//    ==============================
//    
//    Copyright 2013 Pascal ECHEMANN.
//    All Rights Reserved.
//    
//    NOTICE: The author permits you to use, modify, and distribute this file
//    in accordance with the terms of the license agreement accompanying it.
//    
/////////////////////////////////////////////////////////////////////////////////////

//--> Dependencies includes: 
//			add herer all the dependencies which are not concerned by a lazy evaluation.
import controllers.AppController;
import models.AppModel;

/**
 * 	The class reference for the default model of the application.
 */
[RegisterClass(type="models.AppModel")]
public var appModelRef:Class = AppModel;

/**
 * 	The class reference for the default controller of the application.
 */
[RegisterClass(type="controllers.AppController")]
public var appControllerRef:Class = AppController;