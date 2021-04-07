//
//  NetworkingManager.swift
//  dCalc
//
//  Created by Daniel Rybak on 04/04/2021.
//

import SwiftUI

class NetworkingManager {
    //https://api.edamam.com/api/food-database/v2/parser?ingr=red%20apple&app_id=28526b11&app_key=4de8fa36fbd575043b56c4fbd3858816
    
    //Carbs are labeled as CHOCDF
    // example here :
    //https://api.edamam.com/api/food-database/v2/parser?ingr=red%20apple&app_id=28526b11&app_key=4de8fa36fbd575043b56c4fbd3858816
    
    //DOC
    //https://developer.edamam.com/food-database-api-docs
    
    //Autocomplete API
    // http://api.edamam.com/auto-complete
   
    var response = ProductInfoResponse()
    
    func loadData() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(ProductInfoResponse.self, from: data) {
                    DispatchQueue.main.async {
                        
                        
                    }
                    return
                }
            }
            print("loadMovies has this error \(LocalizedError.self)")
        }.resume()
    }
}
