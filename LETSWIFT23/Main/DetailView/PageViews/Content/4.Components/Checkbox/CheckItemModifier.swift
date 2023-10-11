//
//  CheckItemModifier.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/08/11.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct CheckItemModifier<T: Hashable>: ViewModifier {
   @EnvironmentObject private var store: CheckStore<T>
   private let tag: T
   func body(content: Content) -> some View {
      content
         .contentShape(Rectangle())
         .onTapGesture {
            store.toggleTag(tag)
            store.onTapReceive?(tag)
         }
   }
}
extension CheckItemModifier where T: Hashable {
   init(_ tag: T) {
      self.tag = tag
   }
}
extension View {
   func checkTag<T: Hashable>(_ tag: T) -> some View {
      self.modifier(CheckItemModifier(tag))
   }
}

struct CheckItemModifier_Previews: PreviewProvider {
   static var previews: some View {
      CheckboxExample()
   }
}
