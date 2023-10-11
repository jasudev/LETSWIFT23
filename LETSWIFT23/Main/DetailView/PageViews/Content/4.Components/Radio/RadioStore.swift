//
//  RadioStore.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

class RadioStore<T: Hashable>: ObservableObject {
   
   @Binding var selection: T?
   var onTapReceive: ((T?) -> Void)?
   
   init(_ selection: Binding<T?>,
        _ onTapReceive: ((T?) -> Void)? = nil) {
      self._selection = selection
      self.onTapReceive = onTapReceive
   }
}
