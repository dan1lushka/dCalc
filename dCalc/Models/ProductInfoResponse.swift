//
//  UserDetails.swift
//  dCalc
//
//  Created by Daniel Rybak on 02/04/2021.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let foodInfoResponse = try FoodInfoResponse(json)

import Foundation

// MARK: - FoodInfoResponse
struct FoodInfoResponse: Codable {
    let text: String?
    let parsed: [Parsed]
    let hints: [Hint]
    let links: Links?

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
    let enercKcal, procnt, fat, chocdf: Double?
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
    let label: String?
    let quantity: Double
}

// MARK: - Measure
struct Measure: Codable {
    let uri: String
    let label: String?
    let qualified: [Qualified]?
}

// MARK: - Qualified
struct Qualified: Codable {
    let qualifiers: [Qualifier]?
}

// MARK: - Qualifier
struct Qualifier: Codable {
    let uri: String?
    let label: String?
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
    let label: String?
    let nutrients: Nutrients
    let category: Category
    let categoryLabel: CategoryLabel
    let image: String?

    enum CodingKeys: String, CodingKey {
        case foodID = "foodId"
        case label, nutrients, category, categoryLabel, image
    }
}
