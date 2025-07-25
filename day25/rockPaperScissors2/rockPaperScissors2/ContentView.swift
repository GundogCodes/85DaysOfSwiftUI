//
//  ContentView.swift
//  rockPaperScissors2
//
//  Created by Gunish Sharma on 2025-07-24.
//

import SwiftUI

struct Heading: View {
    @Binding var rounds: Int
    @Binding var userScore: Int
    
    var body: some View {
        VStack {
            Text("Rock Paper Scissors")
                .font(.largeTitle).bold()
            VStack {
                Text("Round: \(rounds)")
                    
                Text("Score: \(userScore)")
            }
        }
        .frame(maxWidth: .infinity)
        .background()
    }
}

struct ComputerSection: View {
    var choices: Array<String>
    @Binding var computerChoice: String
    
    var body: some View {
        Text("Computer Chooses: \(computerChoice)")
            .frame(maxWidth: .infinity, maxHeight: 200)
            .background(.red)
    }
}

struct WinOrLoseSection: View {
    
    var winDecsions: Array<String>
    @Binding var winOrLose: String
    
    var body: some View {
        HStack {
            Text("You Must")
            Text("\(winOrLose)")
                .bold()
        }
    }
}

struct UserSection: View {
    var options: Array<String>
    @Binding var userChoice: String
    @Binding var userScore: Int
    @Binding var round: Int
    var body: some View {
        HStack {
            ForEach(options, id: \.self) {
                let userTapped = $0
                Button("\(userTapped)"){
                    
                }
            }
            
        }
    }
}
struct ContentView: View {
        let options = ["Rock", "Paper", "Scissors"]
        let winDecsions = ["Win", "Lose"]
        @State private var winDecsion = ""
        @State private var userChoice = ""
        @State private var computerChoice = "Rock"
        @State private var userScore = 0
        @State private var round = 1
        
        var body: some View {
            VStack {
                Heading(rounds: $round, userScore: $userScore)
                ComputerSection(choices: options, computerChoice: $computerChoice)
                WinOrLoseSection(winDecsions: winDecsions, winOrLose: $winDecsion)
            }
            
        }
    }
    
#Preview {
    ContentView()
}

