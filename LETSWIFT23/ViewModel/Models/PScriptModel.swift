//
//  PScriptModel.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/29.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PScriptModel {
    
    var startIndex: Int = 0
    var scripts: [String] = []
    
    init(scripts: [String]) {
        self.scripts = scripts
    }
    
    init(startIndex: Int, scripts: [String]) {
        self.startIndex = startIndex
        self.scripts = scripts
    }
    
    static func dummy() -> PScriptModel {
        return PScriptModel(startIndex: 0, scripts: [])
    }
}
