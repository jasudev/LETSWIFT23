//
//  Radio.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct Radio<T: Hashable, Content: View>: View {
   private let store: RadioStore<T>
   private let content: () -> Content
   var body: some View {
      content()
         .environmentObject(store)
   }
}
extension Radio where T: Hashable, Content: View {
   init(selection: Binding<T?>,
        @ViewBuilder _ content: @escaping () -> Content) {
      self.store = RadioStore(selection)
      self.content = content
   }
   init(selection: Binding<T?>,
        @ViewBuilder _ content: @escaping () -> Content,
        onTapReceive: ((T?) -> Void)?) {
      self.store = RadioStore(selection, onTapReceive)
      self.content = content
   }
}

struct Radio_Previews: PreviewProvider {
   static var previews: some View {
      RadioExample()
   }
}
