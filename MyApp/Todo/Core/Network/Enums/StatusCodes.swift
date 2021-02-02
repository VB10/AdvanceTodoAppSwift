//
//  StatusCodes.swift
//  GetirTodo
//
//  Created by Veli Bacik on 1/12/21.
//
import Alamofire
enum StatusCodes: Int {
    case notFound = 404
    case success = 200
    
    static func afErrorNotFound(afError: AFError?) -> Int {
        return afError?.responseCode ?? notFound.rawValue
    }
}

extension StatusCodes {
    
    static func isSuccess(val: Int) -> Bool {
        return  val == StatusCodes.success.rawValue
    }
}
