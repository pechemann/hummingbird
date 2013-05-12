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
import models.AppModel;
import controllers.ViewsController;
import services.impl.LogginService;

[RegisterClass(type="models.AppModel")]
public var appModelRef:Class = AppModel;

[RegisterClass(type="controllers.AppController")]
public var appControllerRef:Class = AppController;

[RegisterClass(type="controllers.ViewsController")]
public var viewsControllerRef:Class = ViewsController;

[RegisterClass(type="services.impl.LogginService")]
public var logginServiceRef:Class = LogginService;