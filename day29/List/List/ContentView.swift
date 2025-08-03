//
//  ContentView.swift
//  List
//
//  Created by Gunish Sharma on 2025-08-02.
//

import SwiftUI

struct ContentView: View {
    let people = ["Gunish", "Ish", "Aayati", "Gunnu"]
    
    var body: some View {
        List {
            Section("Section 1") {
                Text("Static Row 1")
                Text("Static Row 2")
            }
            Section("Section 2") {
                ForEach(0..<5) {
                    Text("Dynamic Row \($0)")
                }
            }
            Section("Section 3") {
                Text("Static Row 3")
                Text("Static Row 4")
            }
            Section("Section 4") {
                ForEach(people, id:\.self) {
                    Text($0)
                }
            }
        }
        
        .listStyle(.grouped)
    }
}

#Preview {
    ContentView()
}
