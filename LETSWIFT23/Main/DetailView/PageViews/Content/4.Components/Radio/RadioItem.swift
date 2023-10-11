//
//  RadioItem.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct RadioItem<T: Hashable>: View {
   @EnvironmentObject private var store: RadioStore<T>
   let tag: T?
   var size: CGFloat = 24
   var body: some View {
      ZStack(alignment: .center) {
         Circle()
            .fill(Color.white.opacity(0.1))
         Circle()
            .stroke()
            .fill(Color.primaryLevel2)
         if tag == store.selection {
            Circle()
               .fill(Color.pointYellow)
               .frame(width: size * 0.5, height: size * 0.5)
               .transition(.scale)
         }
      }
      .frame(width: size, height: size)
      .animation(.default, value: store.selection)
   }
}

struct RadioItem_Previews: PreviewProvider {
   static var previews: some View {
      RadioItem(tag: 0, size: 100)
         .padding()
         .environmentObject(RadioStore(.constant(0)))
   }
}
