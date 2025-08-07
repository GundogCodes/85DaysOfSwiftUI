//
//  ContentView.swift
//  GuessTheFlag2
//
//  Created by Gunish Sharma on 2025-07-18.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland","Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var tries = 1
    @State private var showEndingScreen: Bool = false
    @State private var animationAmount = 0.0
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .foregroundStyle(.white)
                    .font(.largeTitle.bold())
                Text("\(tries)/8")
                    .foregroundStyle(.white)
                    .font(.title2.bold())
            
                VStack(spacing: 15){
                VStack{
                    
                    Text("Tap the flag of")
                        .foregroundStyle(.secondary)
                        .font(.subheadline.weight(.heavy))
                    
                    Text(countries[correctAnswer])
                        
                        .font(.largeTitle.weight(.semibold))
                }
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                        withAnimation(.spring(duration:1, bounce:0.5)) {
                            animationAmount  += 360
                        }
                    } label: {
                        Image(countries[number])
                            .clipShape(.capsule)
                            .shadow(radius: 5)
                            .rotation3DEffect(.degrees(animationAmount), axis: (x:0, y:1, z:0))
                    }
                }
                
                
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
        }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            if tries == 8 {
                Button("Play Again?",role: .confirm ,action: reset)

            } else {
                Button("Continue", action: askQuestion)
            }
            
        } message: {
            Text("Your score is \(score)")

        }
    }
    func reset(){
        tries = 1
        score = 0
    }

    func flagTapped(_ number: Int){
        if number == correctAnswer {
            showingScore = true
            score += 1
            scoreTitle = "Correct"
            
        } else {
            showingScore = true
            scoreTitle = "Wrong that is the flag of \(countries[number])"
        }
        
        tries += 1
        
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
