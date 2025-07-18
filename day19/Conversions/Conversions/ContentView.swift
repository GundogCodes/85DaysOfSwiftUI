//
//  ContentView.swift
//  Conversions
//
//  Created by Gunish Sharma on 2025-07-18.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 1.0
    let selections = ["minutes", "hours", "days"]
    @State private var selected = "minutes"
    @FocusState private var secInFocus:Bool
    var conversion:Double {
        if selected == "minutes" {
            return input / 60
        } else if selected == "hours" {
            return input / 60 / 60
        } else if selected == "days" {
            return input / 60 / 60 / 24
        }
        return 0
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("seconds") {
                    TextField("Input", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($secInFocus)
                }
                
                
                Section("To") {
                    Picker("", selection: $selected) {
                        ForEach(selections, id:\.self) {
                            Text($0)
                        }
                       
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Conversion") {
                    if selected == "minutes" {
                        Text("\(conversion) minutes")
                    } else if selected == "hours" {
                        Text("\(conversion) hours")
                    } else if selected == "days" {
                        Text("\(conversion) days")
                    }
                }
            }
            .navigationTitle("Conversions")
            .toolbar {
                if secInFocus {
                    Button("Done") {
                        secInFocus = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
