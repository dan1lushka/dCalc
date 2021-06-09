//
//  NetworkingManager.swift
//  dCalc
//
//  Created by Daniel Rybak on 04/04/2021.
//

import SwiftUI

class NetworkingManager: ObservableObject {
  
  enum RequestType {
    case autoCompleteSearch
    case parserSearch
  }
  
  @Published var response: Codable?
  @Published var errorMessage = ""
  
  func loadData<T: Codable>(ingredient: String, objectType: T.Type, callback: @escaping () -> Void) {
    
    if ingredient.isEmpty {
      return
    }
    
    let request = getURLRequest(ingredient: ingredient, objectType: objectType)
    
    guard let request = request else {
      self.errorMessage = "URL Request error"
      return
    }
    
    print(request.httpBody ?? "no request body found")
    
    URLSession.shared.dataTask(with: request) { data, response, error in
      if let error = error {
        self.errorMessage = "\(error.localizedDescription)"
        print("\(error.localizedDescription)")
        callback()
      } else {
        
        if let response = response as? HTTPURLResponse {
          if response.statusCode != 200 {
            DispatchQueue.main.async {
              self.errorMessage = "Server error \(response.statusCode)"
              print("Server responds with \(response.statusCode) Not Found")
              callback()
            }
          }
        }
        
        if let data = data {
          DispatchQueue.main.async {
            self.performResponseDecoding(data: data, objectType: objectType)
            callback()
          }
        }
        
      }
    }.resume()
  }
  
  private func getURLRequest<T: Codable>(ingredient: String, objectType: T.Type) -> URLRequest? {
    print(ingredient)
    
    let appIdQueryItem = URLQueryItem(name: "app_id", value: NetworkingConsts.apiID)
    let appKeyQueryItem = URLQueryItem(name: "app_key", value: NetworkingConsts.apiKey)
    
    var urlPath: String
    var requestQueryItem: URLQueryItem
    var queryItems: [URLQueryItem]
    
    // todo: move to separate service
    switch objectType {
    case is FoodInfoResponse.Type:
      urlPath = "api/food-database/v2/parser?"
      requestQueryItem = URLQueryItem(name: "ingr", value: ingredient)
      queryItems = [
        requestQueryItem,
        appIdQueryItem,
        appKeyQueryItem
      ]
    case is AutoCompleteResponse.Type:
      urlPath = "auto-complete?"
      requestQueryItem = URLQueryItem(name: "q", value: ingredient)
      queryItems = [
        requestQueryItem
      ]
    default:
      self.errorMessage = "Could not infer type for decoding"
      return nil
    }

    var components = URLComponents(string: "https://api.edamam.com/\(urlPath))")!

    components.queryItems = queryItems

    guard let url = components.url else {
      self.errorMessage = "Invalid URL"
      return nil
    }
    
    print(url)
    
    return URLRequest(url: url)
  }
  
  private func performResponseDecoding<T: Codable>(data: Data, objectType: T.Type) {
    
    var isError = false
    
    do {
      let decodedResponse = try JSONDecoder().decode(T.self, from: data)
      self.response = decodedResponse
      
    } catch let DecodingError.dataCorrupted(context) {
      isError = true
      print(context.codingPath)
      
    } catch let DecodingError.keyNotFound(key, context) {
      isError = true
      print("Key '\(key)' not found:", context.debugDescription)
      print("codingPath:", context.codingPath)
      
    } catch let DecodingError.valueNotFound(value, context) {
      isError = true
      print("Value '\(value)' not found:", context.debugDescription)
      print("codingPath:", context.codingPath)
      
    } catch let DecodingError.typeMismatch(type, context) {
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
