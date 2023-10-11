//
//  CodeView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
import CodeHighlighter

struct CodeView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    @Binding var fileName: String
    @State var topGap: CGFloat = 50
    @State var fontSize: CGFloat = 25
    
    @State private var code: String = ""
    
    var body: some View {
        Color.codeBackground
            .overlay(alignment: .topLeading) {
                ScrollView {
                    HStack {
                        CodeTextView(code, fontSize: fontSize)
                            .textSelection(.enabled)
                        Spacer()
                    }
                    .padding(26)
                    .padding(.top, topGap)
                    .frame(maxWidth: .infinity)
                }
            }
            .task {
                getCodeFromBundle(fileName) { contents in
                    self.code = contents ?? ""
                }
            }
            .onChange(of: fileName) { newValue in
                Task {
                    if newValue.isEmpty {
                        code = ""
                    } else {
                        getCodeFromBundle(newValue) { contents in
                            self.code = contents ?? ""
                        }
                    }
                }
            }
    }
    
    func getCodeFromGit(_ url: String, completed: ((String?) -> Void)? = nil) {
        if let url = URL(string: url) {
            URLSession.shared.dataTask(
                with: url,
                completionHandler: { data, response, _ in
                    guard
                        let data = data,
                        let httpResponse = response as? HTTPURLResponse,
                        200..<300 ~= httpResponse.statusCode
                    else {
                        completed?("현재 사용 중인 네트워크에서는 github에 액세스할 수 없습니다.")
                        return
                    }
                    completed?(String(decoding: data, as: UTF8.self))
                }).resume()
        } else {
            completed?("현재 사용 중인 네트워크에서는 github에 액세스할 수 없습니다.")
        }
    }
    
    func getCodeFromBundle(_ name: String, completed: ((String?) -> Void)? = nil) {
        if let filepath = Bundle.main.path(forResource: name, ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                completed?(contents)
            } catch {
                completed?("해당 파일에 액세스할 수 없습니다.")
                return
            }
        } else {
            completed?("해당 파일에 액세스할 수 없습니다.")
            return
        }
    }
}

struct CodeView_Previews: PreviewProvider {
    static var previews: some View {
        CodeView(fileName: .constant("Code_environmentObject1"))
    }
}
