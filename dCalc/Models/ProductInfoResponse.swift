//
//  UserDetails.swift
//  dCalc
//
//  Created by Daniel Rybak on 02/04/2021.
//

import Foundation

class ProductInfoResponse: Codable {
    var items = [ProductInfoResponse.Item]()
    
    // MARK: - Welcome
    struct Item: Codable {
        let text: String
        let parsed: [Parsed]
        let hints: [Hint]
        let links: Links

        enum CodingKeys: String, CodingKey {
            case text, parsed, hints
            case links = "_links"
        }
    }

    // MARK: - Hint
    struct Hint: Codable {
        let food: HintFood
        let measures: [Measure]
    }

    // MARK: - HintFood
    struct HintFood: Codable {
        let foodID, label: String
        let nutrients: Nutrients
        let category: Category
        let categoryLabel: CategoryLabel
        let image: String?
        let foodContentsLabel, brand: String?
        let servingSizes: [ServingSize]?
        let servingsPerContainer: Double?

        enum CodingKeys: String, CodingKey {
            case foodID = "foodId"
            case label, nutrients, category, categoryLabel, image, foodContentsLabel, brand, servingSizes, servingsPerContainer
        }
    }

    enum Category: String, Codable {
        case fastFoods = "Fast foods"
        case genericFoods = "Generic foods"
        case genericMeals = "Generic meals"
        case packagedFoods = "Packaged foods"
    }

    enum CategoryLabel: String, Codable {
        case food = "food"
        case meal = "meal"
    }

    // MARK: - Nutrients
    struct Nutrients: Codable {
        let enercKcal, procnt, fat, chocdf: Double
        let fibtg: Double?

        enum CodingKeys: String, CodingKey {
            case enercKcal = "ENERC_KCAL"
            case procnt = "PROCNT"
            case fat = "FAT"
            case chocdf = "CHOCDF"
            case fibtg = "FIBTG"
        }
    }

    // MARK: - ServingSize
    struct ServingSize: Codable {
        let uri: String
        let label: Label
        let quantity: Double
    }

    enum Label: String, Codable {
        case apple = "Apple"
        case cup = "Cup"
        case gram = "Gram"
        case kilogram = "Kilogram"
        case ounce = "Ounce"
        case package = "Package"
        case pound = "Pound"
        case serving = "Serving"
        case tablespoon = "Tablespoon"
        case whole = "Whole"
    }

    // MARK: - Measure
    struct Measure: Codable {
        let uri: String
        let label: Label
        let weight: Double
        let qualified: [Qualified]?
    }

    // MARK: - Qualified
    struct Qualified: Codable {
        let qualifiers: [Qualifier]
        let weight: Int
    }

    // MARK: - Qualifier
    struct Qualifier: Codable {
        let uri: String
        let label: String
    }

    // MARK: - Links
    struct Links: Codable {
        let next: Next
    }

    // MARK: - Next
    struct Next: Codable {
        let title: String
        let href: String
    }

    // MARK: - Parsed
    struct Parsed: Codable {
        let food: ParsedFood
    }

    // MARK: - ParsedFood
    struct ParsedFood: Codable {
        let foodID: String
        let label: Label
        let nutrients: Nutrients
        let category: Category
        let categoryLabel: CategoryLabel
        let image: String

        enum CodingKeys: String, CodingKey {
            case foodID = "foodId"
            case label, nutrients, category, categoryLabel, image
        }
    }

}

