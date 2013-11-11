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

import controllers.AppController;
import services.impl.MockService;
import services.impl.PhpService;

[RegisterClass(type="controllers.AppController")]
public var appControllerRef:Class = AppController;

[RegisterClass(type="services.impl.MockService")]
public var MockServiceRef:Class = MockService;

[RegisterClass(type="services.impl.PhpService")]
public var PhpServiceRef:Class = PhpService;

//import services.impl.AirService;
//[RegisterClass(type="services.impl.AirService")]
//public var AirServiceRef:Class =  AirService;
