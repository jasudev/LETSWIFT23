//
//  RadioItemModifier.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct RadioItemModifier<T: Hashable>: ViewModifier {
   @EnvironmentObject private var store: RadioStore<T>
   let tag: T?
   func body(content: Content) -> some View {
      Button {
         store.selection = tag
         store.onTapReceive?(tag)
      } label: {
         content
      }
      .buttonStyle(.plain)
   }
}
extension RadioItemModifier where T: Hashable {
   init(_ tag: T?) {
      self.tag = tag
   }
}
extension View {
   func radioTag<T: Hashable>(_ tag: T?) -> some View {
      self.modifier(RadioItemModifier(tag))
   }
}
