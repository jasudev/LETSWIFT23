//
//  ComponentTitleView.swift
//  LETSWIFT23
//
//  Created by jasu on 10/2/23.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct ComponentTitleView: View {
    let title: String
    var body: some View {
        Text(title)
            .setFont(sizeType: .title, weight: .semibold)
            .foregroundColor(Color.pointYellow)
    }
}

struct ComponentTitleView_Previews: PreviewProvider {
    static var previews: some View {
        ComponentTitleView(title: "Radio")
    }
}
