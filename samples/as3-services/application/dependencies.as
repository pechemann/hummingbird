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
import services.impl.MockSearchService;
import services.impl.GoogleSearchService;

[RegisterClass(type="controllers.AppController")]
public var appControllerRef:Class = AppController;

[RegisterClass(type="services.impl.MockSearchService")]
public var mockServiceRef:Class = MockSearchService;

[RegisterClass(type="services.impl.GoogleSearchService")]
public var realServiceRef:Class = GoogleSearchService;