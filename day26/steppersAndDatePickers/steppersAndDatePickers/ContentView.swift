//
//  ContentView.swift
//  steppersAndDatePickers
//
//  Created by Gunish Sharma on 2025-07-25.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now

    var body: some View {
        VStack {
            Spacer()
            Text(Date.now, format: .dateTime.hour().month().year())
            Text(Date.now.formatted(date: .long, time: .shortened))
            VStack {
                Text("Steppers")
                    .padding()
                    .font(.headline)
                Stepper("\(sleepAmount) hours", value: $sleepAmount, in:4...12, step: 2.0)
                    .frame(maxWidth: 350)
                    .padding()
                    .background(.pink)
                    .foregroundStyle(.white)
                    .cornerRadius(1000)
            }
            
            Text("Date Pickers")
                .padding()
                .font(.headline)
            VStack {
                DatePicker("Please Enter a Date", selection: $wakeUp)
                    .background(.red)
                DatePicker("Please Enter a Date", selection: $wakeUp)
                    .labelsHidden()
                    .background(.blue)
                DatePicker("Please Enter a Date", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .background(.green)
                DatePicker("Please Enter a Date", selection: $wakeUp, in: Date.now...)
                    .background(.orange)
                }
            
            Spacer()
        }
    }
    func exampleDates() {
        let now = Date.now
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = now...tomorrow
        print(range)
        
    }
    func exampleDates2() {
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? .now
        let components =  Calendar.current.dateComponents([.hour,.minute], from: .now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
    }
}
#Preview {
    ContentView()
}
