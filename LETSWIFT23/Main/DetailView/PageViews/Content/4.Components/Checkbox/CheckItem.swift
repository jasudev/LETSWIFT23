//
//  CheckItem.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/08/11.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct CheckItem<T: Hashable>: View {
   @EnvironmentObject private var store: CheckStore<T>
   let tag: T
   var size: CGFloat = 24
   var body: some View {
      ZStack {
         if store.tags.contains(tag) {
            RoundedRectangle(cornerRadius: 2)
               .fill(Color.primaryLevel6)
            Image("checkIcon")
               .resizable()
               .scaledToFit()
               .foregroundColor(Color.pointYellow)
               .padding(size * 0.15)
               .transition(.scale)
         } else {
            RoundedRectangle(cornerRadius: 2)
               .stroke()
               .fill(Color.primaryLevel3)
         }
      }
      .frame(width: size, height: size)
      .animation(.default, value: store.tags)
   }
}

struct CheckItem_Previews: PreviewProvider {
   static var previews: some View {
      CheckItem(tag: 0, size: 100)
         .padding()
         .environmentObject(CheckStore(.constant([0])))
   }
}
