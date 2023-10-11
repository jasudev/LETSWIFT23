//
//  Common.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

let MINI_SIDE_BAR_WIDTH: CGFloat = 60
let LIST_SIDE_BAR_WIDTH: CGFloat = 375
let MIN_FULLSCREEN_SIZE: CGSize = CGSize(width: 1512, height: 982)
let MAX_FULLSCREEN_SIZE: CGSize = CGSize(width: 1728, height: 1117)
let MIN_SCRIPT_WINDOW_SIZE: CGSize = CGSize(width: 1194, height: 781)

let SCRIPT_SPACING: CGFloat = 2

let ANIMATION_CONTENT_LEVEL1: Animation = .easeInOut(duration: 1.0)
let ANIMATION_CONTENT_LEVEL2: Animation = .easeInOut(duration: 0.8)
let ANIMATION_CONTENT_LEVEL3: Animation = .easeInOut(duration: 0.5)
let ANIMATION_SPRING_SLIDE: Animation = .spring(response: 0.5, dampingFraction: 0.86, blendDuration: 0.8)

let PADDING_VERTICAL: CGFloat = 20
let PADDING_HORIZONTAL: CGFloat = 66

let TIMER_MAX_SECONDS: Int = 40 * 60

// MainPresentationKey
struct MainPresentationKey: EnvironmentKey {
    static let defaultValue: Bool = true
}

extension EnvironmentValues {
    var isMainPresentation: Bool {
        get { self[MainPresentationKey.self] }
        set { self[MainPresentationKey.self] = newValue }
    }
}

extension View {
    func isMainPresentation(_ disabled: Bool) -> some View {
        environment(\.isMainPresentation, disabled)
    }
}
