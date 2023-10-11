//
//  CheckStore.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/08/11.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

class CheckStore<T: Hashable>: ObservableObject {
   @Binding var tags: [T]
   var onTapReceive: ((T) -> Void)?
   init(_ tags: Binding<[T]>,
        _ onTapReceive: ((T) -> Void)? = nil) {
      self._tags = tags
      self.onTapReceive = onTapReceive
   }
   func toggleTag(_ tag: T) {
      if tags.contains(tag) {
         removeTag(tag)
      } else {
         addTag(tag)
      }
   }
   private func addTag(_ tag: T) {
      if !tags.contains(tag) {
         tags.append(tag)
      }
   }
   private func removeTag(_ tag: T) {
      if let index = tags.firstIndex(of: tag) {
         tags.remove(at: index)
      }
   }
}
