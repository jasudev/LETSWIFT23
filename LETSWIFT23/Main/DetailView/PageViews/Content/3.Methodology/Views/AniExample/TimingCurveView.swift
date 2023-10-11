//
//  TimingCurveView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/10.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
import FabulaItemsProvider

struct TimingCurveView: View {
    public init() {}
    public var body: some View {
        let canvasSize = CGSize(width: 450.0, height: 300)
        CurveView(canvasSize: canvasSize)
            .frame(width: canvasSize.width, height: canvasSize.height)
    }
    
    struct CurveLine: Shape {
        
        var startPoint: CGPoint
        var control1: CGPoint
        var control2: CGPoint
        var endPoint: CGPoint
        
        func path(in rect: CGRect) -> Path {
            var p = Path()
            
            p.move(to: startPoint)
            p.addCurve(to: endPoint, control1: control1, control2: control2)
            
            return p
        }
    }
    
    struct CurveControlLine: Shape {
        
        var startPoint: CGPoint
        var control1: CGPoint
        var control2: CGPoint
        var endPoint: CGPoint
        
        func path(in rect: CGRect) -> Path {
            
            var p = Path()
            p.move(to: startPoint)
            p.addLine(to: control1)
            p.move(to: endPoint)
            p.addLine(to: control2)
            return p
        }
    }
    
    struct CurveControlDragButton: View {
        let title: String
        let subTitle: String
        var body: some View {
            Circle()
                .stroke(lineWidth: 2)
                .fill(Color.white)
                .background(
                    ZStack {
                        Color.fabulaBack1
                        Text(title)
                            .font(.callout)
                            .foregroundColor(Color.white)
                        Text(subTitle)
                            .font(.caption)
                            .foregroundColor(Color.white)
                            .offset(x: 36, y: 36)
                    }
                        .clipShape(Circle())
                )
        }
    }
    
    struct CurveView: View {
        
        let size: CGFloat = 36.0
        var canvasSize: CGSize = CGSize(width: 300, height: 300)
        
        @State private var curveText: String = ""
        @State private var control1New: CGPoint = .zero
        @State private var control1Current: CGPoint = .zero
        
        @State private var control2New: CGPoint = .zero
        @State private var control2Current: CGPoint = .zero
        
        @State private var startPoint: CGPoint = .zero
        @State private var endPoint: CGPoint = .zero
        
        @State private var phase: CGFloat = 0
        @State private var aniValue: CGFloat = 0
        
        var control1Drag: some Gesture {
            DragGesture()
                .onChanged { value in
                    self.control1Current = CGPoint(x: value.translation.width + self.control1New.x,
                                                   y: value.translation.height + self.control1New.y)
                    changeCurveText()
                }
                .onEnded { value in
                    self.control1Current = CGPoint(x: value.translation.width + self.control1New.x,
                                                   y: value.translation.height + self.control1New.y)
                    self.control1New = self.control1Current
                    aniValue = 0
                }
        }
        
        var control2Drag: some Gesture {
            DragGesture()
                .onChanged { value in
                    self.control2Current = CGPoint(x: value.translation.width + self.control2New.x,
                                                   y: value.translation.height + self.control2New.y)
                    changeCurveText()
                }
                .onEnded { value in
                    self.control2Current = CGPoint(x: value.translation.width + self.control2New.x,
                                                   y: value.translation.height + self.control2New.y)
                    self.control2New = self.control2Current
                    aniValue = 0
                }
        }
        
        var body: some View {
            VStack(spacing: 10) {
                ZStack(alignment: .topLeading) {
                    ZStack(alignment: .bottomLeading) {
                        Rectangle()
                            .frame(width: 1)
                        Rectangle()
                            .frame(height: 1)
                    }
                    .overlay(
                        ZStack {
                            Text("Value")
                                .offset(x: 0, y: -15)
                            Text("Time")
                                .offset(x: canvasSize.width + 20, y: canvasSize.height)
                        }
                            .font(.caption)
                            .offset(x: -canvasSize.width / 2, y: -canvasSize.height / 2)
                    )
                    .opacity(0.5)
                    CurveLine(startPoint: startPoint,
                              control1: control1Current,
                              control2: control2Current,
                              endPoint: endPoint)
                    .stroke(lineWidth: 2)
                    .fill(Color.pointYellow)
                    
                    CurveControlLine(startPoint: startPoint,
                                     control1: control1Current,
                                     control2: control2Current,
                                     endPoint: endPoint)
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [4], dashPhase: phase))
                    .fill(Color.fabulaFore1.opacity(0.5))
                    
                    CurveControlDragButton(title: "C1", subTitle: getPointInfo(self.control1Current))
                        .frame(width: size, height: size)
                        .offset(x: self.control1Current.x - size / 2, y: self.control1Current.y - size / 2)
                        .gesture(control1Drag)
                    CurveControlDragButton(title: "C2", subTitle: getPointInfo(self.control2Current))
                        .frame(width: size, height: size)
                        .offset(x: self.control2Current.x - size / 2, y: self.control2Current.y - size / 2)
                        .gesture(control2Drag)
                    
                    Circle()
                        .fill(Color.pointYellow)
                        .offset(x: -18)
                        .frame(width: 36, height: 36)
                        .offset(x: canvasSize.width * aniValue, y: canvasSize.height - 18)
                }
                .frame(width: canvasSize.width, height: canvasSize.height)
                .onAppear {
                    DispatchQueue.main.async {
                        initPosition()
                    }
                }
                
                TextField("", text: $curveText)
                    .padding(.top, 20)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.primaryLevel6)
                    .frame(height: 36, alignment: .bottom)
                    .overlay(
                        Text("Run")
                            .bold()
                            .foregroundColor(Color.white)
                    )
                    .padding(.top)
                    .onTapGesture {
                        aniValue = 0
                        withAnimation(.timingCurve(control1Current.x / canvasSize.width,
                                                   1.0 - (control1Current.y / canvasSize.height),
                                                   control2Current.x / canvasSize.width,
                                                   1.0 - (control2Current.y / canvasSize.height), duration: 3)) {
                            aniValue = 1
                        }
                    }
                    .shadow(radius: 6)
            }
            .onAppear {
                changeCurveText()
            }
        }
        
        private func initPosition() {
            let control1 = CGPoint(x: canvasSize.width * 0.6, y: canvasSize.height * 0.8)
            let control2 = CGPoint(x: canvasSize.width * 0.4, y: canvasSize.height * 0.2)
            
            startPoint = CGPoint(x: 0, y: canvasSize.height)
            endPoint = CGPoint(x: canvasSize.width, y: 0)
            
            control1New = control1
            control1Current = control1
            
            control2New = control2
            control2Current = control2
        }
        
        private func getPointInfo(_ point: CGPoint) -> String {
            String(format: "X:%.2f Y:%.2f", point.x / canvasSize.width, 1.0 - (point.y / canvasSize.height))
        }
        
        private func changeCurveText() {
            curveText = ".timingCurve(\(control1Current.x / canvasSize.width), \(1.0 - (control1Current.y / canvasSize.height)), \(control2Current.x / canvasSize.width), \(1.0 - (control2Current.y / canvasSize.height)), duration: 3)"
        }
    }
}

struct TimingCurveView_Previews: PreviewProvider {
    static var previews: some View {
        TimingCurveView()
    }
}
