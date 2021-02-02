//
//  NetworkService.swift
//  GetirTodo
//
//  Created by Veli Bacik on 1/12/21.
//

import Alamofire
import Foundation


final class NetworkService: INetworkService {

    let baseConfig: BaseConfig

    init(config: BaseConfig) {
        self.baseConfig = config
    }


    func fetch<T>(path: String, paramaters: [String: String]?, data: Codable?, method: HTTPMethod, onSuccess: @escaping (BaseResponse<T>) -> Void, onError: @escaping (BaseError) -> Void) where T: Encodable, T: Decodable {

        let data = generateData(data: data)
        AF.request(networkPath(path: path),
                   method: method,
                   parameters: data,
                   encoding: JSONEncoding.default
        ).validate().responseDecodable(of: T.self)
        { (response) in
            guard let model = response.value else {

                if StatusCodes.isSuccess(val: response.response?.statusCode ?? StatusCodes.notFound.rawValue) {
                    onSuccess(BaseResponse(model: nil, message: "Succes but doesnt have model"))
                }
                onError(BaseError(response.error))
                return
            }
            onSuccess(BaseResponse.init(model: model, message: "Success"))
        }
    }

    internal func generateData(data: Codable?) -> [String: Any]? {
        if let data = data {
            do {
                return try data.asDictionary()
            } catch { }
            //TODO
        }
        return nil

    }

}
