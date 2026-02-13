//
//  Stop.swift
//  Talatna
//
//  Created by Tala Aldhahri on 16/08/1447 AH.
//
import Foundation
import CoreLocation
// We use the following protocols:
// codable: so we can save it in a database later
// caseiterable: for looping through them later for buttons]

//enums and structs always start with a capital letter
enum PriceRange: String, Codable, CaseIterable{
    case free = "Free"
    case cheap = "Cheap"
    case moderate = "Moderate"
    case expensive = "Expensive"
}

enum Category: String, Codable, CaseIterable{
    case restaurant = "Restaurant"
    case cafe = "Cafe"
    case museum = "Museum"
    case park = "Park"
    case shoppingMall = "Shopping Mall"
    case spa = "Spa"
    case amusementPark = "Amusement Park"
}
// equatable: used to compare structs, without it an error would be caused
struct LocationCoordinate: Codable, Equatable {
    var latitude: Double //coordinates need decimals that's why they are double
    var longitude: Double
}
//for structs:
//we only list protocols after the colon not data types
//structs cannot inherit other structs (non-protocol) such as Date
struct TimeWindow: Codable, Equatable {
    var startTime: Date?
    var endTime: Date?
}

struct Stop: Codable, Identifiable, Equatable {
    var id: UUID
    var name: String
    var category: Category
    var priceRange: PriceRange
    var location: LocationCoordinate
    var duration: TimeInterval?
    var timeWindow: TimeWindow?
}
