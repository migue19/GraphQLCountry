//
//  ContentView.swift
//  GraphQLCountry
//
//  Created by Miguel Mexicano Herrera on 28/07/21.
//

import SwiftUI

struct ContentView: View {
    @State var countryEmoji = ""
    var body: some View {
        Text(countryEmoji).onAppear(perform: {
            Network.shared.apollo.fetch(query: SpecificCountryQuery()) { result in
                switch result {
                case .success(let graphQLResult):
                    DispatchQueue.main.async {
                        if let emoji = graphQLResult.data?.country?.emoji {
                            self.countryEmoji = emoji
                        }
                    }
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
