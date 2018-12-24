//
//  Transaction.swift
//  PokeApp
//
//  Created by andrea on 24/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import Foundation

enum TransactionError: Error {
    case invalidURL
    case invalidHttpResponse
    case statusCodeProblem
    case decodingError
    case server(message: String)
}

enum Transaction<Value:Any> {
    case sucess(Value)
    case fail(Error)
}
