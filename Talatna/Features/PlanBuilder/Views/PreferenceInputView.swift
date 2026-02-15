//
//  PreferenceInputView.swift
//  Talatna
//
//  Created by Tala Aldhahri on 16/08/1447 AH.
//
import SwiftUI

struct PreferenceInputView: View {
    //this will create a connection between autogenview model and this view
    //we use state object instead of state because this view is the owner/creator of the autogenviewmodel
    @StateObject var viewModel = AutoGenViewModel()
    
    var body: some View {
        //so the view is scrollable
        ScrollView{
            VStack (spacing: 24){
                //plan name section
                VStack (alignment: .leading, spacing: 8){
                    Text("Plan Name").font(.headline)
                    
                    TextField("e.g. Relaxtion Day", text: $viewModel.preferences.planName)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                }
                //time section
                
                VStack (alignment: .leading, spacing: 8){
                    Text("Time").font(.headline)
                    
                    DatePicker("", selection: $viewModel.preferences.startTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                }
                Spacer()
                //number of stops section
                
                VStack (alignment: .leading, spacing: 8){
                    HStack{
                        Text("Number of Stops").font(.headline)
                        Spacer()
                        Text("\(Int(viewModel.preferences.numberOfStops))")
                    }
                    Slider(value: $viewModel.preferences.numberOfStops, in: 1...10, step: 1).tint(Color.appSecondary)
                    
                    HStack{
                        Text("1")
                        Spacer()
                        Text("10")
                    }
                    .font(.caption)
                    .foregroundColor(.gray)
                }
                Spacer()
                
                //proximity section
                VStack(alignment: .leading){
                    Text("Proximity").font(.headline)
                    Picker("Proximity", selection: $viewModel.preferences.proximity, content: {
                        ForEach(
                            Proximity.allCases, id:\.self){
                                proximity in Text(proximity.rawValue).tag(proximity)
                            }
                    }).pickerStyle(SegmentedPickerStyle())
                }
                Spacer()
                
                //price range section
                VStack(alignment: .leading){
                    Text("Price Range").font(.headline)
                    Picker("Price Range", selection: $viewModel.preferences.priceRange) {
                        
                        Text("Any").tag(PriceRange?.none)
                        
                        ForEach(
                            PriceRange.allCases, id:\.self){
                                price in Text(price.rawValue).tag(Optional(price))
                            }
                    }.pickerStyle(SegmentedPickerStyle())
                }
            }
            .padding()
        }
        
    }
}
    
#Preview {
    PreferenceInputView()
}
