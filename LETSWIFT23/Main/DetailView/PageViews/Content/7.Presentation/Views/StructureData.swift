//
//  StructureData.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/13.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

enum StructureType {
    case section
    case subsection
    case page
}

struct StructureData: Identifiable {
    let id: UUID = UUID()
    var title: String = ""
    var type: StructureType = .section
    var isShowChildren: Bool = false
    var children: [StructureData] = []
    
    static func dummy() -> Self {
        StructureData(title: "S0", type: .section, isShowChildren: false, children: [])
    }
}
