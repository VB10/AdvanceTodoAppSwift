//
//  Codable+Alamofire.swift
//  GetirTodo
//
//  Created by Veli Bacik on 1/13/21.
//

import Foundation

extension Encodable {
    func encoded() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func dictionary() -> [String: Any]? {
        guard let json = try? encoded(),
            let dict = try? JSONSerialization.jsonObject(with: json, options: []) as? [String: Any] else {
                return nil
        }
        return dict

    }
}

extension Data {
    func decoded<T: Decodable>() throws -> T {
        return try JSONDecoder().decode(T.self, from: self)
    }
}


extension Encodable {
  func asDictionary() throws -> [String: Any] {
    let data = try JSONEncoder().encode(self)
    guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
      throw NSError()
    }
    return dictionary
  }
}
