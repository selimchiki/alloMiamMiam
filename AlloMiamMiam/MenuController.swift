//
//  MenuController.swift
//  AlloMiamMiam
//
//  Created by Sélim Chiki on 27/09/2017.
//  Copyright © 2017 Sélim Chiki. All rights reserved.
//

import Foundation

class MenuController {
    
    let baseURL = URL(string: "http://localhost:8090/")!
    
    func fetchCategories(completion: @escaping ([String]?) -> Void) {
        
        let categoryURL = baseURL.appendingPathComponent("categories")
        let task = URLSession.shared.dataTask(with: categoryURL)
        {
            (data, response, error) in
                if let data = data,
                    let jsonDictionnary = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                    let categories = jsonDictionnary?["categories"] as? [String] {
                        completion(categories)
                } else {
                    completion(nil)
            }
        }
        task.resume()
    }
    
    func fetchMenuItems(categoryName: String, completion: @escaping ([MenuItem]?) -> Void) {
        
        let initialMenuURL = baseURL.appendingPathComponent("menu")
        var components = URLComponents(url: initialMenuURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "category", value: categoryName)]
        let menuURL = components.url!
        let task = URLSession.shared.dataTask(with: menuURL)
        {
            (data, response, error) in
                var menuItems = [MenuItem]()
                if let data = data,
                    let jsonDictionnary = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                    let menuArray = jsonDictionnary?["items"] as? [[String: Any]] {
                        let menuItems = menuArray.flatMap { MenuItem(json: $0) }
                        completion(menuItems)
                } else {
                    completion(nil)
            }
                    
        }
        task.resume()
    }
    
    func submitOrder(menuIds: [Int], completion: (Int?) -> Void) {
        let orderURL = baseURL.appendingPathComponent("order")
        var request = URLRequest(url: orderURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let data: [String: Any] = ["menuIds": menuIds]
        let jsonData = try! JSONSerialization.data(withJSONObject: data, options: [])
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
                if let data = data,
                    let jsonDictionnary = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                    let prepTime = jsonDictionnary?["preparation_time"] as? Int {
                        completion(prepTime)
                } else {
                        completion(nil)
        }
        task.resume()
    }
}
