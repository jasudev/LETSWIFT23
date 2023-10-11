//
//  OpenScriptWindowModifier.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/26.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

@available(macOS 13.0, *)
struct OpenScriptWindowModifier: ViewModifier {
    
    @Environment(\.openWindow) private var openScriptWindow
    
    func body(content: Content) -> some View {
        content
            .background(
                Button("Open Script Window") {
                    openScriptWindow(id: "Script")
                }
                    .hidden()
                    .keyboardShortcut("1")
            )
    }
}
