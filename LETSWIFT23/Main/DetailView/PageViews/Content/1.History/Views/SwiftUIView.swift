//
//  SwiftUIView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Image("SwiftUI")
            .resizable()
            .scaledToFit()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
            .modifier(PreviewModifier())
    }
}
