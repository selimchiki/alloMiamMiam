//
//  MenuItem.swift
//  AlloMiamMiam
//
//  Created by Sélim Chiki on 27/09/2017.
//  Copyright © 2017 Sélim Chiki. All rights reserved.
//

import Foundation

struct MenuItem {
    
    var id: Int
    var name: String
    var description: String
    var price: Double
    var category: String
    var imageURL: URL
    
    struct Propertykey {
        static let id = "id"
        static let name = "name"
        static let description = "description"
        static let price = "price"
        static let category = "category"
        static let imageURL = "image_url"
    }
    
    init?(json: [String: Any]) {
        guard let id = json[Propertykey.id] as? Int,
        let name = json[Propertykey.name] as? String,
        let description = json[Propertykey.description] as? String,
        let price = json[Propertykey.price] as? Double,
        let category = json[Propertykey.category] as? String,
        let imageString = json[Propertykey.imageURL] as? String,
            let imageURL = URL(string: imageString) else {
                return nil
        }
        
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.category = category
        self.imageURL = imageURL
    }
}
