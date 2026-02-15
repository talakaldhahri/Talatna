//
//  AutoGenViewModel.swift
//  Talatna
//
//  Created by Tala Aldhahri on 16/08/1447 AH.
//

import SwiftUI
import Combine

class AutoGenViewModel: ObservableObject {
    //this variable represents the "form" that the user is filling out
    @Published var preferences = PlanPreferences()
    
    //to validate the inputs: so that the user cannot move to the next screen without filling out the plan's name and categories
    var isFormValid: Bool {
        return !preferences.selectedCategories.isEmpty && !preferences.planName.isEmpty
    }
}
