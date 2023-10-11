//
//  SoundManager.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
import AVFoundation

class SoundManager: ObservableObject {
    
    static let shared = SoundManager()
    private var player: AVAudioPlayer?
    private init() {}
    
    enum SoundOption: String {
        case whoosh = "Whoosh"
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {
            return
        }
        do {
            self.player = try AVAudioPlayer(contentsOf: url)
            self.player?.volume = 0.7
            DispatchQueue.main.async {
                self.player?.play()
            }
        } catch let error {
            print("오류가 발생했습니다.", error)
        }
    }
}
