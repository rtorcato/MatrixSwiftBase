//
//  SoundHelper.swift
//  MatrixSwiftBase
//
//  Created by Richard Torcato on 2022-10-25.
//

import Foundation
import AVFoundation

public final class SoundHelper {
    
    public static let shared = SoundHelper() // Singleton
    
    private var audioPlayer: AVAudioPlayer?
    
    public init(){}
    
    public static func playSound(sound: String, type: SoundFileTypes = .mp3) {
        let fileType: String? = type.description
        if let path = Bundle.main.path(forResource: sound, ofType: fileType) {
            do {
                SoundHelper.shared.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                SoundHelper.shared.audioPlayer?.play()
            } catch {
                print("ERROR: Could not find and play the sound file!")
            }
        }
    }
    
    public static func stopSound() {
        SoundHelper.shared.audioPlayer?.stop()
    }
}

//    func playSound(sound: String, type: SoundFileTypes) {
//        let fileType: String? = type.description
//        if let path = Bundle.main.path(forResource: sound, ofType: fileType) {
//            do {
//                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
//                audioPlayer?.play()
//            } catch {
//                print("Could not play the sound file.")
//            }
//        }
//    }
