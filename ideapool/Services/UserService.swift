//
//  UserAuthentificationService.swift
//  ideapool
//
//  Created by Arnaud Phommasone on 10/02/18.
//  Copyright © 2018 Arnaud Phommasone. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper

enum UserRouter: URLRequestConvertible {
    static let baseURLString = Constants.Network.kBaseURL
    
    case getUserInfo(String)
    
    func asURLRequest() throws -> URLRequest {
        var method: HTTPMethod {
            switch self {
            case .getUserInfo(_):
                return .get
            }
        }
        
        let params: ([String: Any]?) = {
            switch self {
            case .getUserInfo(_):
                return nil
            }
        }()
        let url: URL = {
            // build up and return the URL for each endpoint
            let relativePath: String?
            switch self {
            case .getUserInfo(let token):
                relativePath = Constants.Network.kUserInfoEndPoint
            }
            var url = URL(string: LoginRouter.baseURLString)!
            if let relativePath = relativePath {
                url = url.appendingPathComponent(relativePath)
            }
            return url
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        // Header fields
        switch self {
        case .getUserInfo(let token):
            urlRequest.addValue(token, forHTTPHeaderField: "X-Access-Token")
        }
        
        let encoding = JSONEncoding.default
        return try encoding.encode(urlRequest, with: params)
    }
}


class UserService: NSObject {
    func getUserInfo(token: Token, completion: @escaping (_ result: User) -> Void)-> () {
        let urlRequestProvider = UserRouter.getUserInfo(token.jwt)
        Alamofire.request(urlRequestProvider).responseObject { (response: DataResponse<User>) in
            let user = response.result.value
            completion(user!)
        }
    }
}
