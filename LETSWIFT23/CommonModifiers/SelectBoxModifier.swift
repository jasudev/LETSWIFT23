//
//  SelectBoxModifier.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/10/01.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

public typealias SelectBoxStateCompleted = (DragState, CGRect, EventModifiers?) -> Void
public enum DragState: String, Hashable, CaseIterable {
    case start
    case move
    case end
}

struct SelectBoxModifier: ViewModifier {
    
    @State private var isDragFirst = true
    @State private var startPoint: CGPoint = .zero
    @State private var movePoint: CGPoint = .zero
    
    var completed: SelectBoxStateCompleted?
    
    var moveWidth: CGFloat {
        abs(movePoint.x - startPoint.x)
    }
    var moveHeight: CGFloat {
        abs(movePoint.y - startPoint.y)
    }
    var offsetPoint: CGPoint {
        var point = CGPoint(x: startPoint.x - 1, y: startPoint.y - 2)
        if startPoint.x > movePoint.x {
            point.x = movePoint.x - 1
        }
        if startPoint.y > movePoint.y {
            point.y = movePoint.y - 2
        }
        return point
    }
    
    var rect: CGRect {
        CGRect(x: offsetPoint.x, y: offsetPoint.y, width: moveWidth, height: moveHeight)
    }

    func body(content: Content) -> some View {
        content
            .gesture(drag())
//            .highPriorityGesture(move(.shift).modifiers(.shift))
    }
    
    private func drag(_ modifiers: EventModifiers? = nil) -> some Gesture {
        DragGesture(minimumDistance: 0.01, coordinateSpace: CoordinateSpace.local)
            .onChanged { val in
                if isDragFirst {
                    startPoint = CGPoint(x: val.location.x, y: val.location.y)
                    movePoint = startPoint
                    isDragFirst = false
                    completed?(.start, rect, modifiers)
                } else {
                    movePoint = CGPoint(x: val.location.x, y: val.location.y)
                    completed?(.move, rect, modifiers)
                }
            }
            .onEnded { _ in
                isDragFirst = true
                completed?(.end, rect, modifiers)
            }
    }
}

extension SelectBoxModifier {
    init(_ completed: @escaping SelectBoxStateCompleted) {
        self.completed = completed
    }
}

extension View {
    public func showSelectBox(_ completed: @escaping SelectBoxStateCompleted) -> some View {
        modifier(SelectBoxModifier(completed))
    }
}

struct SelectBoxModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("TTT")
            .modifier(SelectBoxModifier({ _, _, _ in
                
            }))
    }
}
