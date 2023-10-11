//
//  Text+.swift
//  LETSWIFT23
//
//  Created by jasu on 2022/07/27.
//  Copyright (c) 2022 jasu All rights reserved.
//

import SwiftUI

extension Text {
    // How to use:
    //
    //    Text("Some Attributed String") { string in
    //        string.foregroundColor = .blue
    //        if let range = string.range(of: "Attributed") { /// here!
    //            string[range].foregroundColor = .red
    //        }
    //    }
    //
    init(_ string: String, configure: ((inout AttributedString) -> Void)) {
        var attributedString = AttributedString(string)
        configure(&attributedString)
        self.init(attributedString)
    }
}
