//
//  AppServerClient.swift
//  mvvm
//
//  Created by Arthur Rocha on 28/10/17.
//  Copyright © 2017 DatIn. All rights reserved.
//

import Alamofire
import ObjectMapper

class AppServerClient {
    
    enum GetPostFailureReason: Int, Error {
        case notFound = 404
        case internalServerError = 500
    }
    
    typealias GetPostResult = Result<[Post], GetPostFailureReason>
    typealias GetPostCompletion = (_ result : GetPostResult) -> Void
    
    func getPosts(completion: @escaping GetPostCompletion) {
        Alamofire.request("https://jsonplaceholder.typicode.com/posts")
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    guard let content = Mapper<Post>().mapArray(JSONObject: response.result.value) else {
                        completion(.failure(GetPostFailureReason.internalServerError))
                        return
                    }
                    completion(.success(payload: content))
                case .failure(_):
                    if let statusCode = response.response?.statusCode,
                        let reason = GetPostFailureReason(rawValue: statusCode) {
                        completion(.failure(reason))
                        return
                    }
                    completion(.failure(GetPostFailureReason.internalServerError))
                }
        }
    }
    
}
