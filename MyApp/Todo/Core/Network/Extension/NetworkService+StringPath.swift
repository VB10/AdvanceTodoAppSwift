//
//  String+NetworkConfig.swift
//  GetirTodo
//
//  Created by Veli Bacik on 1/12/21.
//

import Foundation
extension NetworkService {
    //MARK: It's FirebaseRest Path must be required .json
    func networkPath(path: String) -> String {
        return "\(baseConfig.baseUrl)\(path)".toJson
    }
}
