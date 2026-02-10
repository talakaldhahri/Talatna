 import Foundation

struct Plan: Identifiable {
    let id = UUID()
    let title: String
    let date: String
    let time: String
    let imageName: String
    let isShared: Bool
}


