//
//  SwitchExample.swift
//  LETSWIFT23
//
//  Created by jasu on 2022/09/20.
//  Copyright (c) 2022 jasu All rights reserved.
//

import SwiftUI

struct SwitchExample: View {
   @State var isOn: Bool = false
   var body: some View {
      VStack {
         Switch(isOn: $isOn) { value in
            print("Action: ", value)
         }
         .frame(width: 200, height: 120)
      }
   }
}

struct SwitchExample_Previews: PreviewProvider {
   static var previews: some View {
      SwitchExample(isOn: true)
         .padding()
   }
}
