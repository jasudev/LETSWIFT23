//
//  AFThoughtsOnFlashView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/01.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct AFThoughtsOnFlashView: View {
    
    let pdfPath = "https://newslang.ch/wp-content/uploads/2022/06/Thoughts-on-Flash.pdf"
    
    var body: some View {
        HStack {
            TableTextView(titleTextColor: Color.pointYellow, items: [
                TitleSetData(title: "보안성 :", subtitle: "Flash는 보안 취약점이 많아서 악성 소프트웨어에 쉽게 노출"),
                TitleSetData(title: "안정성 :", subtitle: "Flash는 브라우저 충돌과 성능 문제를 야기할 수 있음"),
                TitleSetData(title: "성능 :", subtitle: "Flash는 리소스를 많이 사용하여 웹 페이지의 성능을 저하시킬 수 있음"),
                TitleSetData(title: "배터리 수명 :", subtitle: "Flash는 모바일 기기의 배터리 수명을 단축시킬 수 있음"),
                TitleSetData(title: "웹 표준 :", subtitle: "Flash는 웹 표준을 준수하지 않고, 다양한 플랫폼에서 호환성 문제를 일으킬 수 있음"),
                TitleSetData(title: "혁신 :", subtitle: "Flash는 크로스 플랫폼으로 애플의 혁신 기술을 충분히 활용할 수 없음")
            ])
            .foregroundColor(Color.primaryLevel3)
            .setFont(sizeType: .description3, weight: .regular)
            .titleDivider(title: "Thoughts on Flash - Steve Jobs", showLine: false)
            .fixedSize(horizontal: true, vertical: false)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 5) {
                Image("ThoughtsOnFlash")
                    .resizable()
                    .scaledToFit()
                LinkTextView(pdfPath, path: pdfPath)
                    .setFont(sizeType: .caption3, weight: .regular)
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct AFThoughtsOnFlashView_Previews: PreviewProvider {
    static var previews: some View {
        AFThoughtsOnFlashView()
    }
}
