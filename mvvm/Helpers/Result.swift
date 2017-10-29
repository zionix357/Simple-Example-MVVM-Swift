//
//  Result.swift
//  mvvm
//
//  Created by Arthur Rocha on 29/10/17.
//  Copyright © 2017 DatIn. All rights reserved.
//

import Foundation

enum Result<T, U> where U: Error {
    case success(payload: T)
    case failure(U?)
}
