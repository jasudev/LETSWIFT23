//
//  Switch.swift
//  LETSWIFT23
//
//  Created by jasu on 2022/09/20.
//  Copyright (c) 2022 jasu All rights reserved.
//

import SwiftUI

struct Switch: View {
   
   @Binding var isOn: Bool
   var onTapReceive: ((Bool) -> Void)?
   @GestureState private var isTapped = false
   
   var backgroundColor: Color {
      isOn ? .pointYellow : Color(hex: 0x222222)
   }
   
   var handleColor: Color {
      isOn ? Color(hex: 0xFFFFFF) : Color(hex: 0xDDDDDD)
   }
   
   var gesture: some Gesture {
      DragGesture(minimumDistance: 0)
         .updating($isTapped) { (_, isTapped, _) in
            isTapped = true
         }
         .onEnded { _ in
            isOn.toggle()
            onTapReceive?(isOn)
         }
   }
   
   var body: some View {
      switchUIView()
         .gesture(gesture)
         .animation(.default, value: isOn)
         .animation(.default, value: isTapped)
   }
   
   @ViewBuilder
   private func switchUIView() -> some View {
      GeometryReader { geo in
         let handleGap = geo.size.height * 0.075
         ZStack(alignment: isOn ? .trailing : .leading) {
            Capsule()
               .fill(backgroundColor)
            Capsule()
               .fill(handleColor)
               .padding(handleGap)
               .frame(width: handleWidth(geo.size))
               .shadow(color: Color.black.opacity(0.4),
                       radius: handleGap * 0.5,
                       x: 0,
                       y: 0)
         }
      }
      .frame(idealWidth: 51, idealHeight: 31)
   }
   
   private func handleWidth(_ size: CGSize) -> CGFloat {
      let w = size.width
      let h = size.height
      return isTapped ? h + (w - h) * 0.3 : h
   }
}

struct Switch_Previews: PreviewProvider {
   static var previews: some View {
      Switch(isOn: .constant(true)) { value in
         print("Action: ", value)
      }
      .frame(width: 200, height: 125)
      .padding()
   }
}
