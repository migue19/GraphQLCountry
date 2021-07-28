//
//  Apollo.swift
//  GraphQLCountry
//
//  Created by Miguel Mexicano Herrera on 28/07/21.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    lazy var apollo = ApolloClient(url: URL(string: "https://countries.trevorblades.com")!)
}
