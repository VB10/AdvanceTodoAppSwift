//
//  TodoServiceProtocol.swift
//  GetirTodo
//
//  Created by Veli Bacik on 1/13/21.
//

protocol NetworkManagerProtocol {
    var service: INetworkService { get }
}


extension NetworkManagerProtocol {
    var service: INetworkService {
        return NetworkService(config: ApplicationConstants.BASE_CONFIG)
    }
}
