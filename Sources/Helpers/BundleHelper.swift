//
//  BundleHelper.swift
//  AppleCore
//
//  Created by Richard Torcato on 2022-10-17.
//

import Foundation

public final class BundleHelper {
    public static func loadJson<T: Decodable>(
        _ filename: String,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy? = nil,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy? = nil) -> T {
        let data:Data
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            if let dateDecodingStrategy = dateDecodingStrategy {
                decoder.dateDecodingStrategy = dateDecodingStrategy
            }
            if let keyDecodingStrategy = keyDecodingStrategy {
                decoder.keyDecodingStrategy = keyDecodingStrategy
            }
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
    
    // static let instance = BundleHelper() // Singleton
//    public static func loadJson<T: Decodable>(_ type: T.Type,
//                              from file: String,
//    public static func loadJson<T: Decodable>(_ file: String,
//                              dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
//                              keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
//
//        guard let url = Bundle().url(forResource: file, withExtension: nil) else {
//            fatalError("Error: Failed to locate \(file) in bundle.")
//        }
//
//        guard let data = try? Data(contentsOf: url) else {
//            fatalError("Error: Failed to load \(file) from bundle.")
//        }
//        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = dateDecodingStrategy
//        decoder.keyDecodingStrategy = keyDecodingStrategy
//
//        guard let loaded = try? decoder.decode(T.self, from: data) else {
//            fatalError("Error: Failed to decode \(file) from bundle.")
//        }
//        return loaded
//    }
}

//static func loadLocalFile<T: Decodable>(_ filename: String) -> T {
//    let data: Data
//
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//    else {
//        fatalError("Couldn't find \(filename) in main bundle.")
//    }
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//    }
//
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//    }
//}
//
//func load<T:Decodable>(_ filename:String) -> T {
//    let data:Data
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//    else {
//        fatalError("Couldn't find \(filename) in main bundle.")
//    }
//
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//    }
//
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//    }
//}
