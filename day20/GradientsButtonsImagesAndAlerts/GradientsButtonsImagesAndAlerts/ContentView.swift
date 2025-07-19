//  ContentView.swift
//  GradientsButtonsImagesAndAlerts
//
//  Created by Gunish Sharma on 2025-07-18.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    var body: some View {
        
//GRADIENTS
        VStack {
            LinearGradient(colors: [.white,.black], startPoint: .top, endPoint: .bottom)
                
            
            RadialGradient(colors:[.blue, .black], center: .center, startRadius: 20, endRadius: 200)
            
            AngularGradient(colors: [.red,.yellow, .green,.blue, .purple, .red], center: .center)
            
            Section {
                Text("Simple Gradient")
                    .padding(50)
                    .frame(width: .infinity)
                    .colorInvert()
            }
            .frame(width:500,height: 80)
            .background(.red.gradient)
            
        }
        
//BUTTONS AND IMAGES
        VStack {
            Button("Button 1", role: .destructive, action: executeDelete)
            
            Button("Button 2", role: .destructive){}
                .buttonStyle(.bordered)
            
            Button("Button 3", role: .destructive){}
                .buttonStyle(.borderedProminent)
            
            Button("Button 4",){}
                .buttonStyle(.borderedProminent)
            
            Button("Button 5",){}
                .buttonStyle(.borderedProminent)
                .tint(.indigo)
            
            //Custom Button
            
            Button {
                print("Button was tapped")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
            
            //IMAGES
            
            Image(decorative: "Ireland")
            
            Image(systemName:"pencil.circle")
                .foregroundStyle(.red)
                .font(.largeTitle)
            
            // custom button with image
            Button {
                print("Button was tapped")
            } label: {
                Image(systemName: "globe")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.pink)
            }
            // or simplier
            Button("Edit", systemImage: "pencil") {}
        }

// ALERTS
        
        Button("Show Alert") {
            showAlert = true
        }
        .alert("Important Message", isPresented: $showAlert) {
            Button("Delete", role:.destructive) {}
            Button("Cancel", role:.cancel) {}
        } message: {
            Text("Please read this")
        }
        
    }
    func executeDelete() {
        print("yo")
    }
}

#Preview {
    ContentView()
}
