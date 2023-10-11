//
//  PWrapperView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PWrapperView: View {
    
    public let originalView: Any
    private let internalView: AnyView
    
    public init<V: View>(_ view: V) {
        internalView = AnyView(view)
        originalView = view
    }
    
    public var body: some View {
        internalView
    }
    
    public var viewName: String {
        let name = "\(type(of: self.originalView.self))"
        return name
    }
}

struct CPWrapperViewPreviews: PreviewProvider {
    static var previews: some View {
        PWrapperView(Text("test"))
    }
}
