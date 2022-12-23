//
//  SoundHelper.swift
//  AppleCore
//
//  Created by Richard Torcato on 2022-10-25.
//

import AVFoundation

public final class SoundHelper {
    
    public static let shared = SoundHelper() // Singleton
    
    private var audioPlayer: AVAudioPlayer?
    
    public init(){}
    
    public static func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                SoundHelper.shared.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                SoundHelper.shared.audioPlayer?.play()
            } catch {
                print("ERROR: Cloud not find and play the sound file!")
            }
        }
    }
    
    public static func stopSound() {
        SoundHelper.shared.audioPlayer?.stop()
    }
}

