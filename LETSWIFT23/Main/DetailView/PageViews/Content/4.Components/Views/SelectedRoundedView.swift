//
//  SelectedRoundedView.swift
//  LETSWIFT23
//
//  Created by jasu on 10/3/23.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct SelectedRoundedView: View {
    var body: some View {
        Rectangle()
            .stroke(style: StrokeStyle(lineWidth: 2, dash: [8, 5]))
            .fill(Color.pointYellow)
            .transition(.scale.combined(with: .opacity))
    }
}

struct SelectedRoundedView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedRoundedView()
    }
}
