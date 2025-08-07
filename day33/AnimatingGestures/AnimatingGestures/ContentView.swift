//
//  ContentView.swift
//  AnimatingGestures
//
//  Created by Gunish Sharma on 2025-08-07.
//

import SwiftUI

struct ContentView: View {
    
    @State private var dragAmount = CGSize.zero
    @State private var enabled = false
    let letters = Array("Hello SwiftUI")
    
    var body: some View {
        //        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
        //            .frame(width: 300, height: 200)
        //            .clipShape(.rect(cornerRadius: 10))
        //            .offset(dragAmount)
        //            .gesture(
        //                DragGesture()
        //                    .onChanged { dragAmount = $0.translation }
        //                    .onEnded{ _ in
        //                        withAnimation(.bouncy) {
        //                            dragAmount = .zero
        //                        }
        //
        //                    }
        //            )
        //            .animation(.bouncy, value: dragAmount)
        
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .foregroundStyle(.white)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded{ _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
}

#Preview {
    ContentView()
}
