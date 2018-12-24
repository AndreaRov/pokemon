//
//  ApiRequestDelegate.swift
//  PokeApp
//
//  Created by andrea on 24/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import Foundation

protocol APIRequestDelegate {
    associatedtype Response: Decodable
    var resourceName: String { get }
}
