//
//  SoundHelper.swift
//  AppleCore
//
//  Created by Richard Torcato on 2022-10-25.
//

import AVFoundation

final class SoundHelper {
    
    static let instance = SoundHelper() // Singleton
    
    private var audioPlayer: AVAudioPlayer?
    
    static func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                SoundHelper.instance.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                SoundHelper.instance.audioPlayer?.play()
            } catch {
                print("ERROR: Cloud not find and play the sound file!")
            }
        }
    }
    
    static func stopSound() {
        SoundHelper.instance.audioPlayer?.stop()
    }
}

