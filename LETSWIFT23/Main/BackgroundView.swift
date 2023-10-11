//
//  BackgroundView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/09/22.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Color.black
            .overlay {
                Image("background")
                    .resizable()
                    .scaledToFill()
            }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
