//
//  BaseError.swift
//  GetirTodo
//
//  Created by Veli Bacik on 1/12/21.
//

import Alamofire

struct BaseError {
    var errorMessage: String
    var statusCode: Int
    var debugMessage: String
    
    init(_ afError : AFError?) {
        debugMessage = afError.debugDescription
        statusCode = StatusCodes.afErrorNotFound(afError: afError)
        errorMessage = afError?.errorDescription ?? ""
    }
}
