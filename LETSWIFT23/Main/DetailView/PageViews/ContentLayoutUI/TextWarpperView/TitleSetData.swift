//
//  TitleSetData.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/02.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct TitleSetData: Identifiable {
    let id = UUID()
    let title: String?
    let subtitle: String
    
    static func dummy() -> Self {
        TitleSetData(title: "타이틀", subtitle: "서브타이틀")
    }
}
