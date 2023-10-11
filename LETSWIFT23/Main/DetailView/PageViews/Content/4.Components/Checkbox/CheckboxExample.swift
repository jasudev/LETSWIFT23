//
//  CheckboxExample.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/08/11.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct CheckboxExample: View {
   @State private var tags = [0]
   var body: some View {
      Checkbox(tags: $tags) {
         VStack(alignment: .leading) {
            itemView(0)
            itemView(1)
            itemView(2)
         }
      } onTapReceive: { value in
         print("value: ", value)
      }
   }
   private func itemView(_ tag: Int) -> some View {
      HStack(spacing: 20) {
         CheckItem(tag: tag, size: 50)
         Text("Item \(tag + 1)")
            .font(.system(size: 50))
      }
      .padding()
      .checkTag(tag)
   }
}

struct CheckboxExample_Previews: PreviewProvider {
   static var previews: some View {
      CheckboxExample()
   }
}
