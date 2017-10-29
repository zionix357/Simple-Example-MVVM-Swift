//
//  PostViewModel.swift
//  mvvm
//
//  Created by Arthur Rocha on 29/10/17.
//  Copyright © 2017 DatIn. All rights reserved.
//

import UIKit

class PostViewModel : NSObject{
    
    let appServerClient = AppServerClient()
    var posts : [Post] = []
    
    func getAll(completion: @escaping () -> ()){
        appServerClient.getPosts { (response) in
            switch response {
            case .success(payload: let content):
                self.posts = content
                completion()
                break
            case .failure(let error):
                print(error?.localizedDescription ?? "Failure: empty")
                completion()
                break
            }
        }
    }
}
