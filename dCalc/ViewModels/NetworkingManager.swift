//
//  NetworkingManager.swift
//  dCalc
//
//  Created by Daniel Rybak on 04/04/2021.
//

import SwiftUI

class NetworkingManager: ObservableObject {
    
    @Published var response: FoodInfoResponse?
    @Published var errorMessage = ""
    
    func loadData(ingredient: String, callback: @escaping () -> ()) {
        
        guard let request = getURLRequest(ingredient: ingredient) else {
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                
                DispatchQueue.main.async {
                    self.performResponseDecoding(data: data)
                    callback()
                }
                
                return
            } else {
                self.errorMessage = "Cannot get data"
                print("Cannot get data")
            }
            
        }.resume()
        
    }
    
    private func getURLRequest(ingredient: String) -> URLRequest? {
        print(ingredient)
        
        let apiID = "4ccff81d"
        let apiKey = "e79e643e49de8cfd4b1425baa583798a"
        
        var components = URLComponents(string: "https://api.edamam.com/api/food-database/v2/parser?")!
        
        components.queryItems = [
            URLQueryItem(name: "ingr", value: ingredient),
            URLQueryItem(name: "app_id", value: apiID),
            URLQueryItem(name: "app_key", value: apiKey)
        ]
        
        guard let url = components.url else {
            self.errorMessage = "Invalid url"
            return nil
        }
        
        print(url)
        
        return URLRequest(url: url)
    }
    
    func performResponseDecoding(data: Data) {
        
        var isError = false
        
        do {
            let decodedResponse = try JSONDecoder().decode(FoodInfoResponse.self, from: data)
            self.response = decodedResponse
            print(self.response?.parsed.first?.food.nutrients.chocdf ?? "carbs not found")
            
        } catch let DecodingError.dataCorrupted(context) {
            isError = true
            print(context.debugDescription)
            
        } catch let DecodingError.keyNotFound(key, context) {
            isError = true
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            
        } catch let DecodingError.valueNotFound(value, context) {
            isError = true
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            
        } catch let DecodingError.typeMismatch(type, context)  {
            isError = true
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            
        } catch {
            isError = true
            print("error: ", error)
        }
        
        if isError {
            self.errorMessage = "An unexpected error occured"
        }
    }
}
