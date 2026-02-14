//
//  PlanPreferences.swift
//  Talatna
//
//  Created by Tala Aldhahri on 16/08/1447 AH.
//
//we use the foundation framework as Date belongs to it
import Foundation

enum Proximity: String, Codable, CaseIterable {
    case nearMe = "Near Me"
    case within5KM = "Within 5 KM"
    case any = "Any"
}

struct PlanPreferences: Codable, Equatable {
    var planName: String = ""
    var startTime: Date = Date() //default will be "now"
    var numberOfStops: Double = 10
    var proximity: Proximity = .nearMe
    var priceRange: PriceRange? = nil //optional because "any" might be a choice
    var Rating: Int? = nil //also optional because "any" could be chosen and therefor it would be nil
    var selectedCategories: [Category] = []
}
