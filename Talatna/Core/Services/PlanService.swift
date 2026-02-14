//
//  PlanService.swift
//  Talatna
//
//  Created by Tala Aldhahri on 26/08/1447 AH.
//
// this class exists so we follow the singleton pattern = all the code has a single brain.
//we use this pattern in ios for services that manage data

//it will bring the mock data to the views instead of us having to hard code it
//and when we have real data (firebase), it will deliever that to the ui as well instead of us having to change it ourselves

import SwiftUI
//observable object is a part of the combine framework
import Combine

//we use the observable object protocol so that this class will notify the views automatically, of any data changes
class PlanService: ObservableObject {
    //to ensure there's only one instance of plan service shared among that entire code
    static let shared = PlanService()
    //published so the views update automatically
    @Published var plans: [Plan] = []
    //private so no one can create a new service (which will break the singleton [one instance] rule/pattern)
    private init() {
        self.plans = MockPlans
    }
}
