//
//  RadioExample.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/09/25.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct RadioExample: View {
   @State private var selection: Int? = 0
   var body: some View {
      Radio(selection: $selection) {
         VStack(alignment: .leading) {
            itemView(0)
            itemView(1)
            itemView(2)
         }
      } onTapReceive: { value in
         print("value: ", value ?? "")
      }
   }
   private func itemView(_ tag: Int) -> some View {
      HStack(spacing: 20) {
         RadioItem(tag: tag, size: 50)
         Text("Item \(tag + 1)")
            .font(.system(size: 50))
      }
      .padding()
      .radioTag(tag)
   }
}

struct RadioExample_Previews: PreviewProvider {
   static var previews: some View {
      RadioExample()
   }
}
