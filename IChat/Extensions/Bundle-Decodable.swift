//
//  Bundle-Decodable.swift
//  IChat
//
//  Created by Байсангур on 09.10.2022.
//

import Foundation
import UIKit

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}

//,
//dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
//keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys
//
//decoder.dateDecodingStrategy = dateDecodingStrategy
//decoder.keyDecodingStrategy = keyDecodingStrategy
