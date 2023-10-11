//
//  LETSWIFT23.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

@main
struct LETSWIFT23: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var store = PContentStore.shared
    
    var body: some Scene {
        WindowGroup("LETSWIFT23 for SwiftUI") {
            ContentView()
                .environment(\.colorScheme, .dark)
                .environmentObject(store)
        }
        WindowGroup("LETSWIFT23 for SwiftUI Script", id: "Script") {
            if store.contentSize != .zero {
                ScriptView()
                    .environment(\.colorScheme, .dark)
                    .environmentObject(store)
            }
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        for window in NSApplication.shared.windows {
            window.tabbingMode = .disallowed
        }
    }
}
