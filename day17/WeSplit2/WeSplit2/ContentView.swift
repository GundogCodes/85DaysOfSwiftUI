//
//  ContentView.swift
//  WeSplit2
//
//  Created by Gunish Sharma on 2025-07-16.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numOfPeople = 0
    @State private var tipPercentage = 0.2
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [0,0.1,0.15,0.2,0.25,0.5]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numOfPeople + 2 )
        let tipSelection = Double(tipPercentage)
        
        let tipValue = (checkAmount) * tipSelection
        let grandTotal  = checkAmount + tipValue
        
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form{
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "CAD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numOfPeople) {
                        ForEach(2..<100){
                                Text("\($0) people")
                            
                        }
                    }
//                    .pickerStyle(.navigationLink)
                }
                
                Section("How much do you want to tip?") {
//                    Text("How much do you want to tip?")
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id:\.self) {
                            Text($0, format: .percent)
                        }
                    }
                    
                    .pickerStyle(.segmented)
                }
                
                Section("Total Per Person") {
                    
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "CAD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done"){
                        amountIsFocused = false
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
