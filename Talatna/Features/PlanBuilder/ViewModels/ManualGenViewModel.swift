


//                            DANA




//  ManualGenViewModel.swift
//  Talatna
//
//  Created by Tala Aldhahri on 16/08/1447 AH.

//           FILE EXPLANATION
// it holds the manual plan draft and all actions
//it wons draft state (planname,Date,andtime..)later actual stop[]
//ui state things ui needs to show: showdatePickerSheet and time as well
//Navigation state path: [ManualGenRoute}
// it provides: canProceedFromStart validation (so “Next” only works if plan name exists)
//formattedDate and formattedTime so views don’t repeat formatter logic
//intent methods like: proceedFromStart() → pushes the next screen and goToSummary() → pushes summary and resetFlow() → goes back to start of flow


import Foundation

@MainActor
final class ManualGenViewModel: ObservableObject {

    // Navigation
    @Published var path: [ManualGenRoute] = []

    // Draft Plan State (belongs in VM not in the View)
    @Published var planName: String = ""
    @Published var selectedDate: Date = Date()
    @Published var selectedTime: Date = Date()
    @Published var stops: Double = 4

    // UI State
    @Published var showDatePickerSheet: Bool = false
    @Published var showTimePickerSheet: Bool = false

    // Validation
    var canProceedFromStart: Bool {
        !planName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    // Formatting (kept here so views stay dumb)
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: selectedDate)
    }

    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: selectedTime)
    }

    // Intents ((View calls these functions, ViewModel decides))
    func proceedFromStart() {
        guard canProceedFromStart else { return }
        path.append(.mapSelection)
    }

    func goToSummary() {
        path.append(.planSummary)
    }

    func resetFlow() {
        path.removeAll()
    }
}
