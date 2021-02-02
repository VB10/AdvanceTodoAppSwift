//
//  INetworkService.swift
//  GetirTodo
//
//  Created by Veli Bacik on 1/12/21.
//
import Alamofire
protocol INetworkService {
    func fetch<T>(path: String, paramaters: [String: String]?, data: Codable?, method: HTTPMethod, onSuccess: @escaping (BaseResponse<T>) -> Void, onError: @escaping (BaseError) -> Void)

    func generateData(data: Codable?) -> [String: Any]?
}
