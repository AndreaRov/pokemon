//
//  Transaction.swift
//  PokeApp
//
//  Created by andrea on 24/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import Foundation

enum TransactionError: Error {
    case server(message: String)
    case entityUnwrappedFails
    case urlRequestUnwrappedFails
    case expectedPopularMovieEntity
    case expectedMovieDetailsEntity
    case expectedVideosEntity
}

enum Transaction<Value:Any> {
    case sucess(Value)
    case fail(Error)
}
