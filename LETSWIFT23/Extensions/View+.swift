//
//  View+.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/26.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

extension View {
    // MARK: - animations
    func animationsDisabled(_ value: Bool = true) -> some View {
        if value {
            return self.transaction { (tx: inout Transaction) in
                tx.disablesAnimations = true
                tx.animation = nil
            }
        } else {
            return self.transaction { ( _: inout Transaction) in }
        }
    }
    
    func reverseMask<M>(_ mask: M) -> some View where M: View {
        self.mask(
            mask
                .background(Color.white)
                .foregroundColor(.black)
                .compositingGroup()
                .luminanceToAlpha()
        )
    }
}
