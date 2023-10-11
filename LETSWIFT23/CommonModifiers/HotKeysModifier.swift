//
//  HotKeysModifier.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import Foundation
import SwiftUI
import Combine

@available(OSX 11.0, *)
extension View {
    func addCustomHotkeys( _ hotkeys: [HotkeyCombination] ) -> some View {
        self.modifier(HotKeysModifier(hotkeys))
    }
}

@available(OSX 11.0, *)
public struct HotKeysModifier: ViewModifier {
    @State private var subs = Set<AnyCancellable>() // Cancel onDisappear
    var hotkeys: [HotkeyCombination]
    
    init(_ hotkeys: [HotkeyCombination] ) {
        self.hotkeys = hotkeys
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            DisableSoundsView(hotkeys: hotkeys)
            content
        }
    }
}

struct DisableSoundsView: NSViewRepresentable {
    var hotkeys: [HotkeyCombination]
    
    func makeNSView(context: Context) -> NSView {
        let view = DisableSoundsNSView()
        
        view.hotkeys = hotkeys
        
        return view
    }
    
    func updateNSView(_ nsView: NSView, context: Context) { }
}

class DisableSoundsNSView: NSView {
    var hotkeys: [HotkeyCombination] = []
    
    override func performKeyEquivalent(with event: NSEvent) -> Bool {
        return hotkeysSubscription(combinations: hotkeys)
    }
}

func hotkeysSubscription(combinations: [HotkeyCombination]) -> Bool {
    for comb in combinations {
        let basePressedCorrectly = comb.keyBasePressed
        
        if basePressedCorrectly && comb.key.isPressed {
            comb.action()
            return true
        }
    }
    
    return false
}

struct HotkeyCombination {
    let keyBase: [KeyBase]
    let key: CGKeyCode
    let action: () -> Void
}

extension HotkeyCombination {
    var keyBasePressed: Bool {
        let mustBePressed = KeyBase.allCases.filter { keyBase.contains($0) }
        let mustBeNotPressed = KeyBase.allCases.filter { !keyBase.contains($0) }
        
        if !mustBePressed.contains(where: { !$0.isPressed }) && !mustBeNotPressed.contains(where: { $0.isPressed }) {
            return true
        } else {
            return false
        }
    }
}

enum KeyBase: CaseIterable {
    case option
    case command
    case shift
    case control
    
    var isPressed: Bool {
        switch self {
        case .option:
            return CGKeyCode.kVK_Option.isPressed  || CGKeyCode.kVK_RightOption.isPressed
        case .command:
            return CGKeyCode.kVK_Command.isPressed || CGKeyCode.kVK_RightCommand.isPressed
        case .shift:
            return CGKeyCode.kVK_Shift.isPressed   || CGKeyCode.kVK_RightShift.isPressed
        case .control:
            return CGKeyCode.kVK_Control.isPressed || CGKeyCode.kVK_RightControl.isPressed
        }
    }
}
