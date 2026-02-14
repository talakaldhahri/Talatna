//
//  ManualGenStartView.swift
//  Talatna
//
//  Created by Dana Alobaid on 13/02/2026.
//

import SwiftUI

struct ManualGenStartView: View {

    // UI-only state
    @State private var planName: String = ""
    @State private var selectedDate: Date = Date()
    @State private var selectedTime: Date = Date()
    @State private var stops: Double = 4

    @State private var selectedTab: BottomTab = .create

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {

                // Top Bar
                HStack(spacing: 10) {
                    Button {
                        print("Back tapped")
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                    }

                    Text("Create Outing Plan Manually")
                        .font(.headline)

                    Spacer()
                }
                .padding(.horizontal, 18)
                .padding(.top, 12)

                // Card (pulled down a bit)
                VStack(spacing: 18) {

                    // Image chooser row (UI-only placeholder)
                    HStack(alignment: .center, spacing: 16) {

                        Button {
                            print("Choose image tapped")
                        } label: {
                            ZStack {
                                Circle()
                                    .fill(Color(.systemGray6))
                                    .frame(width: 110, height: 110)

                                Image(systemName: "calendar")
                                    .font(.system(size: 40))
                                    .foregroundColor(.gray)

                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 34, height: 34)
                                    .overlay(
                                        Image(systemName: "camera")
                                            .font(.system(size: 14))
                                            .foregroundColor(.gray)
                                    )
                                    .offset(x: 38, y: 38)
                            }
                        }
                        .buttonStyle(.plain)

                        // show fully on ONE line
                        Text("Choose Outing Plan Image")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                            .lineLimit(1)
                            .minimumScaleFactor(0.85)   // if screen is small, it shrinks slightly instead of cutting
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Spacer(minLength: 0)
                    }

                    // Plan Name
                    HStack(spacing: 12) {
                        Text("Plan Name:")
                            .font(.headline)
                            .frame(width: 110, alignment: .leading)

                        TextField("Evening With Friends", text: $planName)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 12)
                            .frame(maxWidth: .infinity)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    }

                    // Date
                    HStack(spacing: 12) {
                        Text("Date:")
                            .font(.headline)
                            .frame(width: 110, alignment: .leading)

                        DatePicker("", selection: $selectedDate, displayedComponents: .date)
                            .labelsHidden()
                            .datePickerStyle(.compact)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    }

                    // Time
                    HStack(spacing: 12) {
                        Text("Time:")
                            .font(.headline)
                            .frame(width: 110, alignment: .leading)

                        DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .datePickerStyle(.compact)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    }

                    // Number of stops
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Number of Stops:")
                            .font(.headline)

                        Slider(value: $stops, in: 1...10, step: 1)
                            .tint(.orange)

                        HStack {
                            Text("1")
                            Spacer()
                            Text("\(Int(stops))")
                            Spacer()
                            Text("10")
                        }
                        .font(.caption)
                        .foregroundColor(.gray)
                    }

                    // Done (UI only)
                    Button {
                        print("Done tapped")
                    } label: {
                        Text("Done")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color.orange)
                            .cornerRadius(14)
                            .shadow(radius: 4)
                    }

                }
                .padding(18)
                .background(Color.white)
                .cornerRadius(22)
                .shadow(radius: 10)
                .padding(.horizontal, 18)
                .padding(.top, 18)

                Spacer() // pushes the card area upward, but bottom bar is pinned by safeAreaInset
            }
            .background(Color.white)

            // This pins the bottom bar  and allows a divider above it
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 0) {
                    Divider() // the thin separating line

                    BottomMenuBar(selectedTab: $selectedTab)
                        .padding(.vertical, 10)
                        .background(Color.white)
                }
            }
        }
    }
}

//  Bottom Menu

private enum BottomTab {
    case home, create, calendar, profile
}

private struct BottomMenuBar: View {

    @Binding var selectedTab: BottomTab

    var body: some View {
        HStack {
            tabButton(tab: .home, normalImage: "HomeTab", selectedImage: "HomeTabSelected")

            Spacer()

            tabButton(tab: .create,
                      normalImage: "CreatePlanTab",
                      selectedImage: "CreatePlanTabSelected",
                      isCenterPlus: true)

            Spacer()

            tabButton(tab: .calendar, normalImage: "MyPlansTab", selectedImage: "MyPlansTabSelected")

            Spacer()

            tabButton(tab: .profile, normalImage: "ProfileTab", selectedImage: "ProfileTabSelected")
        }
        .padding(.horizontal, 34)
    }

    @ViewBuilder
    private func tabButton(
        tab: BottomTab,
        normalImage: String,
        selectedImage: String,
        isCenterPlus: Bool = false
    ) -> some View {

        Button {
            selectedTab = tab
            print("Tab tapped:", tab)
        } label: {
            Image(selectedTab == tab ? selectedImage : normalImage)
                .resizable()
                .scaledToFit()
                .frame(width: isCenterPlus ? 44 : 28, height: isCenterPlus ? 44 : 28)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ManualGenStartView()
}
