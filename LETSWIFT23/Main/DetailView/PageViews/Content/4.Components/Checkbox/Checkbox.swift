//
//  Checkbox.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/08/22.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct Checkbox<T: Hashable, Content: View>: View {
   private let store: CheckStore<T>
   private let content: () -> Content
   var body: some View {
      content()
         .environmentObject(store)
   }
}
extension Checkbox where T: Hashable, Content: View {
   init(tags: Binding<[T]>,
        @ViewBuilder _ content: @escaping () -> Content) {
      self.store = CheckStore(tags)
      self.content = content
   }
   init(tags: Binding<[T]>,
        @ViewBuilder _ content: @escaping () -> Content,
        onTapReceive: ((T) -> Void)? = nil) {
      self.store = CheckStore(tags, onTapReceive)
      self.content = content
   }
}

struct Checkbox_Previews: PreviewProvider {
   static var previews: some View {
      CheckboxExample()
   }
}
