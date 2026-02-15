

//                DANA


//  ManualGenStartView.swift
//  Talatna
//
//  Created by Dana Alobaid on 13/02/2026.
//
//
//  ManualGenStartView.swift
//  Talatna
//
//  Location: Features/PlanBuilder/Views/ManualGenStartView.swift
//
//  NOTE (architecture): This view no longer owns bottom tabs or core draft state.
//  It binds to ManualGenViewModel (Features/PlanBuilder/ViewModels/ManualGenViewModel.swift)
//  so the draft plan persists across the manual-planning flow.
//

import SwiftUI

struct ManualGenStartView: View {

    // Keep the draft plan state inside the VM (NOT in @State here)
    @StateObject private var viewModel: ManualGenViewModel

    @Environment(\.dismiss) private var dismiss

    // MARK: - Init (allows injection later)
    init(viewModel: ManualGenViewModel = ManualGenViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack(path: $viewModel.path) {
            content
                .navigationTitle("Manual Plan")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            HStack(spacing: 6) {
                                Image(systemName: "chevron.left")
                                Text("Back")
                            }
                        }
                    }
                }
                .navigationDestination(for: ManualGenRoute.self) { route in
                    switch route {
                    case .mapSelection:
                        MapSelectionView(viewModel: viewModel)

                    case .planSummary:
                        PlanSummaryView(viewModel: viewModel)
                    }
                }
        }
    }

    private var content: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // Title / header area (keep your design here)
                headerSection

                // Plan name
                VStack(alignment: .leading, spacing: 8) {
                    Text("Plan name")
                        .font(.headline)

                    TextField("e.g., Friday outing", text: $viewModel.planName)
                        .textInputAutocapitalization(.words)
                        .autocorrectionDisabled(false)
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
                }

                // Date + time
                HStack(spacing: 12) {
                    dateCard
                    timeCard
                }

                // Primary CTA
                Button {
                    viewModel.proceedFromStart()
                } label: {
                    Text("Next")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(RoundedRectangle(cornerRadius: 14).fill(viewModel.canProceedFromStart ? Color.accentColor : Color.gray.opacity(0.35)))
                        .foregroundStyle(viewModel.canProceedFromStart ? Color.white : Color.secondary)
                }
                .disabled(!viewModel.canProceedFromStart)

                // Optional helper text
                if !viewModel.canProceedFromStart {
                    Text("Enter a plan name to continue.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }

                Spacer(minLength: 8)
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
        }
        .sheet(isPresented: $viewModel.showDatePickerSheet) {
            datePickerSheet
        }
        .sheet(isPresented: $viewModel.showTimePickerSheet) {
            timePickerSheet
        }
    }

    // MARK: - Sections

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Create your plan")
                .font(.title2)
                .fontWeight(.bold)

            Text("Set a name, date, and time, then add stops on the map.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(.bottom, 4)
    }

    private var dateCard: some View {
        Button {
            viewModel.showDatePickerSheet = true
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                Label("Date", systemImage: "calendar")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Text(viewModel.formattedDate)
                    .font(.headline)
                    .foregroundStyle(.primary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 14).fill(Color(.secondarySystemBackground)))
        }
        .buttonStyle(.plain)
    }

    private var timeCard: some View {
        Button {
            viewModel.showTimePickerSheet = true
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                Label("Time", systemImage: "clock")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Text(viewModel.formattedTime)
                    .font(.headline)
                    .foregroundStyle(.primary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 14).fill(Color(.secondarySystemBackground)))
        }
        .buttonStyle(.plain)
    }

    // MARK: - Sheets

    private var datePickerSheet: some View {
        NavigationStack {
            VStack(spacing: 16) {
                DatePicker(
                    "Select date",
                    selection: $viewModel.selectedDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .padding()

                Spacer()
            }
            .navigationTitle("Date")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        viewModel.showDatePickerSheet = false
                    }
                }
            }
        }
    }

    private var timePickerSheet: some View {
        NavigationStack {
            VStack(spacing: 16) {
                DatePicker(
                    "Select time",
                    selection: $viewModel.selectedTime,
                    displayedComponents: [.hourAndMinute]
                )
                .datePickerStyle(.wheel)
                .labelsHidden()
                .padding()

                Spacer()
            }
            .navigationTitle("Time")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        viewModel.showTimePickerSheet = false
                    }
                }
            }
        }
    }
}

#Preview {
    ManualGenStartView()
}
