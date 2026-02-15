

//                 DANA


//  MapSelectionView.swift
//  Talatna
//
//  Created by Tala Aldhahri on 16/08/1447 AH.
//
//             FILE EXPLANATION
// Screen #2 (placeholder for now)
//rn its a stub with countinue to summary button later (next week logic) it becomes the main MAP SDK screen where to: show map, search places, drop pins, add stops, request location permission through location service, and compute route. and to clarify it takes :                   @ObservedObject var viewModel: ManualGenViewModel and it reads/writes same draft plan state creatd in the manual plan start view


import SwiftUI

struct MapSelectionView: View {

    @ObservedObject var viewModel: ManualGenViewModel

    var body: some View {
        VStack(spacing: 16) {
            Text("Map Selection")
                .font(.title2)
                .fontWeight(.bold)

            Text("This screen will contain Map SDK + search + add stop flow (Dana).")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            // Placeholder action until logic week
            Button {
                viewModel.goToSummary()
            } label: {
                Text("Continue to Summary")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(RoundedRectangle(cornerRadius: 14).fill(Color.accentColor))
                    .foregroundStyle(.white)
            }
            .padding(.horizontal, 16)

            Spacer()
        }
        .padding(.top, 24)
        .navigationTitle("Select Stops")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        MapSelectionView(viewModel: ManualGenViewModel())
    }
}
