//
//  ButtonPressModifier.swift
//  LETSWIFT23
//
//  Created by jasu on 2022/08/02.
//  Copyright (c) 2022 jasu All rights reserved.
//

import SwiftUI

public struct ButtonPressModifier: ButtonStyle {
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.3 : 1.0)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
    }
}

extension ButtonStyle where Self == ButtonPressModifier {
    public static func dsPressButtonStyle() -> Self {
        return ButtonPressModifier()
    }
}

struct ButtonPressModifier_Previews: PreviewProvider {
    static var previews: some View {
        Button {
            
        } label: {
            Text("Button")
        }
        .buttonStyle(.dsPressButtonStyle())
        .modifier(PreviewModifier())
    }
}
