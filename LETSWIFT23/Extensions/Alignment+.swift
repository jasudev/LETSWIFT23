//
//  Alignment+.swift
//  LETSWIFT23
//
//  Created by jasu on 2021/08/27.
//

import SwiftUI

extension VerticalAlignment {
    private enum CurrentAlignment: AlignmentID {
        static func defaultValue(in dim: ViewDimensions) -> CGFloat {
            return dim[VerticalAlignment.center]
        }
    }
    static let verticalAlignment = VerticalAlignment(CurrentAlignment.self)
}

extension HorizontalAlignment {
    private enum CurrentAlignment: AlignmentID {
        static func defaultValue(in dim: ViewDimensions) -> CGFloat {
            return dim[HorizontalAlignment.center]
        }
    }
    static let horizontalAlignment = HorizontalAlignment(CurrentAlignment.self)
}
