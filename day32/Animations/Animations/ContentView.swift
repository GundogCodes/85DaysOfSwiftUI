//
//  ContentView.swift
//  Animations
//
//  Created by Gunish Sharma on 2025-08-06.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
//            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
//        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount - 1) * 3)
//        .animation(.default, value: animationAmount)
//        .animation(.linear, value: animationAmount)
//        .animation(.spring(duration: 1, bounce: 0.9), value: animationAmount)
//        .animation(.easeInOut(duration: 2), value: animationAmount)
//        .animation(
//            .easeInOut(duration: 2)
//            .delay(1),
//            value: animationAmount)
//        .animation(
//            .easeInOut(duration: 0.5)
//            .repeatCount(23, autoreverses: true),
//            value: animationAmount)
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                    .animation(
                        .easeOut(duration: 1)
                        .repeatForever(autoreverses: false),
                        value: animationAmount)
        )
        .onAppear {
            animationAmount = 2
        }
//        .animation(
//            .easeInOut(duration: 0.5)
//            .repeatForever(autoreverses: true),
//            value: animationAmount)
        
    }
}

#Preview {
    ContentView()
}
