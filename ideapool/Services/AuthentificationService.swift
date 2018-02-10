//
//  AuthentificationService.swift
//  Idea Pool
//
//  Created by Arnaud Phommasone on 9/02/18.
//  Copyright © 2018 Arnaud Phommasone. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper

enum LoginRouter: URLRequestConvertible {
    static let baseURLString = Constants.Network.kBaseURL
    
    case login([String: Any])
    case signup([String: Any])
    case getRefreshedToken([String: Any])
    case logout([String: Any])
    
    func asURLRequest() throws -> URLRequest {
        var method: HTTPMethod {
            switch self {
            case .login(let _):
                return .post
            case .signup(let _):
                return .post
            case .getRefreshedToken(let _):
                return .post
            case .logout(let _):
                return .delete
            }
        }
        
        let params: ([String: Any]?) = {
            switch self {
            case .login(let userInfo):
                return (userInfo)
            case .signup(let userInfo):
                return (userInfo)
            case .getRefreshedToken(let token):
                return (token)
            case .logout(let token):
                return (token)
            }
        }()
        let url: URL = {
            // build up and return the URL for each endpoint
            let relativePath: String?
            switch self {
            case .login(_):
                relativePath = Constants.Network.kUserLoginTokenEndPoint
            case .signup(_):
                relativePath = Constants.Network.kSignupEndPoint
            case .getRefreshedToken(_):
                relativePath = Constants.Network.kUserLoginRefreshTokenEndPoint
            case .logout(_):
                relativePath = Constants.Network.kUserLoginTokenEndPoint
            }
            var url = URL(string: LoginRouter.baseURLString)!
            if let relativePath = relativePath {
                url = url.appendingPathComponent(relativePath)
            }
            return url
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let encoding = JSONEncoding.default
        return try encoding.encode(urlRequest, with: params)
    }
}

class AuthentificationService: NSObject {
    func signUp(username: String, email: String, password: String, completion: @escaping (_ result: Token) -> Void)-> () {
        let userInfo: [String: Any] = ["name": username, "email": email, "password": password]
        let urlRequestProvider = LoginRouter.signup(userInfo)
        Alamofire.request(urlRequestProvider).responseObject { (response: DataResponse<Token>) in
            let token = response.result.value
            completion(token!)
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping (_ result: Token) -> Void)-> () {
        let userInfo: [String: Any] = ["email": email, "password": password]
        let urlRequestProvider = LoginRouter.login(userInfo)
        Alamofire.request(urlRequestProvider).responseObject { (response: DataResponse<Token>) in
            let token = response.result.value
            completion(token!)
        }
    }
    
    func logoutUser(token: Token, completion: @escaping (_ result: Bool) -> Void)-> () {
        let tokenInfo: [String: Any] = ["refresh_token": token.refresh_token]
        let urlRequestProvider = LoginRouter.logout(tokenInfo)
        
        Alamofire.request(urlRequestProvider)
            .responseJSON { response in
                let resultat = String(data:  response.data!, encoding: .utf8)
                print(resultat)
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling DELETE on /todos/1")
                    print(response.result.error!)
                    
                    completion(false)
                    return
                }
                completion(true)
        }
    }
    
    func refreshToken(token: Token, completion: @escaping (_ result: Token) -> Void)-> () {
        let tokenInfo: [String: Any] = ["refresh_token": token.refresh_token]
        let urlRequestProvider = LoginRouter.getRefreshedToken(tokenInfo)
        Alamofire.request(urlRequestProvider).responseObject { (response: DataResponse<Token>) in
            let newToken = response.result.value
            newToken?.refresh_token = token.refresh_token
            completion(token)
        }
    }
}
