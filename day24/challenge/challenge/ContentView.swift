//
//  ContentView.swift
//  challenge
//
//  Created by Gunish Sharma on 2025-07-22.
//

import SwiftUI

struct PageTitle: ViewModifier {
    var title = ""
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: 100)
            .font(.largeTitle)
            .foregroundStyle(.white).bold()
            .background(.mint)
    }
}

extension View {
    func aTitle() -> some View {
        modifier(PageTitle())
    }
}

struct ContentView: View {
    
    @State private var billAmount = 0.00
    @State private var numOfPeople = 0
    @State private var tipPercentage = 0.0
    var total:Double {
        let peopleCount = Double(numOfPeople + 2)
        let tipAmount = billAmount * tipPercentage
        let totalPayment = billAmount + tipAmount
        
        return totalPayment / peopleCount
    }
    
    let tips = [0,0.25,0.50,0.75,1]

    var body: some View {
        Text("WeSplit Again")
            .aTitle()
        VStack {
            Form {
                Section {
                    TextField("Total Bill Amount", value: $billAmount, format: .currency(code: Locale.current.currency?.identifier ?? "CAD"))
                        .keyboardType(.decimalPad)
                }
                Section {
                    Picker("Number of People", selection: $numOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section {
                    Text("Tip Percentage")
                    Picker("Tip Amount", selection: $tipPercentage) {
                        ForEach(tips, id:\.self) {
                            Text($0, format: .percent)
                                
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    Text("Total")
                        .font(.largeTitle)
                    Text("\(total)")
                        .foregroundStyle(tipPercentage == 0 ? .red : .blue)
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
