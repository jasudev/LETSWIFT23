//
//  PContentStore.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

enum DirectionType: CaseIterable {
    case prev
    case next
    case same
}

class PContentStore: ObservableObject {
    
    static let shared = PContentStore()
    
    @AppStorage("isShowSideBar") var isShowSideBar: Bool = false
    
    @Published var screenSize: CGSize = .zero
    @Published var contentSize: CGSize = .zero
    
    @Published var direction: DirectionType = .same
    @Published var hoverData: PModel?
    @Published var backgroundColor: Color = Color.primaryLevel5
    @Published var flattenedDatas: [PModel] = []
    @Published var videoFileName: String?

    @Published var currentData: PModel = .dummy()
    @Published var currentId: Int = 0 {
        didSet {
            if self.currentId == 0 {
                self.resetCurrentIndex()
            }
            SoundManager.shared.playSound(sound: .whoosh)
            
            self.direction = self.getSlideDirection()
            self.setupDatas()
            self.setupTimer()
            withAnimation(.easeInOut(duration: 0.5)) {
                self.shouldShowSidebar()
                self.backgroundColor = self.currentId <= 1 || self.currentId >= self.flattenedDatas.count - 2 ? Color.primaryLevel5 : Color.background
            }
        }
    }
    
    var startDate: Date?
    var endDate: Date?
    private var prevData: PModel = .dummy()
    private var nextData: PModel?
    
    private init() {
        let flattenedDatas = flattenedDatas(PContentProvider.datas, parent: nil)
        self.flattenedDatas = flattenedDatas
        self.indexByID(flattenedDatas)
        self.currentId = 0
    }
    
    func getPrevData() -> PModel {
        return getData(id: prevData.id) ?? PModel.dummy()
    }
    
    func getNextData() -> PModel? {
        guard let nextData = nextData else { return nil }
        return getData(id: nextData.id)
    }
    
    func getDepthDatas(_ depth: DepthType) -> [PModel] {
        return flattenedDatas.filter { data in
            data.depth == depth
        }
    }
    
    func getDataByView(_ view: any View) -> PModel {
        return self.getDataByViewName("\(type(of: view))") ?? PModel.dummy()
    }
    
    func setNextID() {
        guard let index = getIndex(id: currentId) else { return }
        if index < flattenedDatas.count - 1 {
            if self.currentId != flattenedDatas[index + 1].id {
                self.currentId = self.flattenedDatas[index + 1].id
            }
        }
    }
    
    func setPrevID() {
        guard let index = getIndex(id: currentId) else { return }
        if index > 0 {
            if self.currentId != flattenedDatas[index - 1].id {
                self.currentId = self.flattenedDatas[index - 1].id
            }
        }
    }
    
    func getIndex(id: Int) -> Int? {
        guard let index = flattenedDatas.firstIndex(where: { $0.id == id }) else {
            return nil
        }
        return index
    }
    
    func getData(id: Int) -> PModel? {
        guard let data = flattenedDatas.first(where: { $0.id == id }) else {
            return nil
        }
        return data
    }
    
    func startTimer() {
        self.endDate = nil
        let date = Date()
        self.startDate = date
    }
    
    func endTimer() {
        endDate = Date()
    }
    
    // MARK: - private
    private func resetCurrentIndex() {
        for data in flattenedDatas {
            data.pageIndex = 0
        }
    }
    
    private func indexByID(_ flattenedDatas: [PModel]) {
        for i in 0..<flattenedDatas.count {
            flattenedDatas[i].id = i
        }
    }
    
    private func flattenedDatas(_ array: [PModel], parent: PModel?) -> [PModel] {
        var flattenedArray: [PModel] = []
        
        for element in array {
            element.parent = parent
            flattenedArray.append(element)
            flattenedArray.append(contentsOf: flattenedDatas(element.children, parent: element))
        }
        return flattenedArray
    }
    
    private func getDataByViewName(_ viewName: String) -> PModel? {
        guard let data = flattenedDatas.first(where: { $0.view.viewName == viewName }) else {
            return nil
        }
        return data
    }
    
    private func setupDatas() {
        let index = self.getIndex(id: currentId) ?? 0
        if index > 0 {
            let data = self.flattenedDatas[index - 1]
            prevData = data
        }
        self.currentData = self.flattenedDatas[index]
        if index < self.flattenedDatas.count - 1 {
            let data = self.flattenedDatas[index + 1]
            nextData = data
        } else {
            nextData = nil
        }
    }
    
    private func setupTimer() {
        switch currentId {
        case 0:
            self.startDate = nil
            self.endDate = nil
        case 1:
            self.startDate = nil
            self.endDate = nil
            self.startTimer()
        case (flattenedDatas.count - 1): self.endTimer()
        default: break
        }
    }
    
    private func shouldShowSidebar() {
        if currentId == 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                withAnimation(.easeInOut) {
                    self.isShowSideBar = true
                }
            }
        } else if currentId <= 3 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                withAnimation(.easeInOut) {
                    self.isShowSideBar = false
                }
            }
        }
    }
    
    private func getSlideDirection() -> DirectionType {
        if self.prevData.id < self.currentId {
            return .next
        } else if self.prevData.id > self.currentId {
            return .prev
        } else {
            return .same
        }
    }
}
