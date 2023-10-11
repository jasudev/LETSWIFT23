//
//  LayoutExampleView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/04.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct LayoutStatusData {
    
    let starSymbol: (ShowStatusType, ShowStatusType)
    let starText: (ShowStatusType, ShowStatusType)
    let starVStack: (ShowStatusType, ShowStatusType)
    let avocadoText: (ShowStatusType, ShowStatusType)
    let avocadoSpace: (ShowStatusType, ShowStatusType)
    let avocadoImage: (ShowStatusType, ShowStatusType)
    let avocadoHStack: (ShowStatusType, ShowStatusType)
    let descText: (ShowStatusType, ShowStatusType)
    let avocadoVStack: (ShowStatusType, ShowStatusType)
    let rootHStack: (ShowStatusType, ShowStatusType)
    
    static func dummy() -> Self {
        LayoutStatusData(starSymbol: (.normal, .selected),
                         starText: (.normal, .selected),
                         starVStack: (.normal, .selected),
                         avocadoText: (.normal, .selected),
                         avocadoSpace: (.normal, .selected),
                         avocadoImage: (.normal, .selected),
                         avocadoHStack: (.normal, .selected),
                         descText: (.normal, .selected),
                         avocadoVStack: (.normal, .selected),
                         rootHStack: (.normal, .selected))
    }
}

struct LayoutExampleView: View {
    
    @State var statusData: LayoutStatusData = .dummy()
    
    var body: some View {
        HStack {
            VStack {
                Text("★★★★★")
                    .setDottedVisible(dotted: statusData.starSymbol.0, visible: statusData.starSymbol.1)
                Text("5 stars")
                    .setDottedVisible(dotted: statusData.starText.0, visible: statusData.starText.1)
            }
            .font(.system(size: 21, weight: .regular))
            .setDottedVisible(dotted: statusData.starVStack.0, visible: statusData.starVStack.1)
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("Avocado Toast")
                        .font(.system(size: 60, weight: .semibold))
                        .setDottedVisible(dotted: statusData.avocadoText.0, visible: statusData.avocadoText.1)
                    Spacer()
                        .overlay {
                            HSpaceLineView(height: 10)
                                .frame(height: 71)
                                .padding(.horizontal, 6)
                                .setDottedVisible(dotted: statusData.avocadoSpace.0, visible: statusData.avocadoSpace.1)
                        }
                    Image("Avocado")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 71, height: 71)
                        .setDottedVisible(dotted: statusData.avocadoImage.0, visible: statusData.avocadoImage.1)
                }
                .setDottedVisible(dotted: statusData.avocadoHStack.0, visible: statusData.avocadoHStack.1)
                
                Text("Ingredients: Avocado, Almond Butter, Bread, Red Pepper Flakes")
                    .font(.system(size: 24, weight: .regular))
                    .lineLimit(1)
                    .setDottedVisible(dotted: statusData.descText.0, visible: statusData.descText.1)
            }
            .setDottedVisible(dotted: statusData.avocadoVStack.0, visible: statusData.avocadoVStack.1)
        }
        .frame(width: 690)
        .setDottedVisible(dotted: statusData.rootHStack.0, visible: statusData.rootHStack.1)
    }
}

struct LayoutExampleView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutExampleView()
    }
}
