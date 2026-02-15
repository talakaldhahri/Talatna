



//                       DANA


//  ManualGenRoute.swift
//  Talatna
//
//  Created by Dana Alobaid on 15/02/2026.
//      below is explanation of this file
//typed routes for the Manual Planning flow
//it defines the screens you can navigate to
//SwiftUI NavigationStack(path:) uses a path array for navigation
//this avoids string based navigation and keeps flow scalable
// example: StartView → path.append(.mapSelection) → MapSelectionView
import Foundation

enum ManualGenRoute: Hashable {
  case mapSelection
  case planSummary
}

