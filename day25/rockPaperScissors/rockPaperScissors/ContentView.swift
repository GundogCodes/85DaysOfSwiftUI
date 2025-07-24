//
//  ContentView.swift
//  rockPaperScissors
//
//  Created by Gunish Sharma on 2025-07-24.
//

import SwiftUI

struct Header: View {
    var round:Int
    var score:Int
    var body: some View {
        VStack {
            Text("Rock Paper Scissors")
                .foregroundStyle(.white)
                .font(.largeTitle).bold()
            HStack{
                Text("Round: \(round)")
                    .padding()
                Text("Score: \(score)")
                    .padding()
            }
        }
        .frame(maxWidth: .infinity)
        .background(.red)
        
    }
}

struct ComputerSection: View {

    var computerChoice: String
    var body: some View {
        VStack {
            Text("Computer Chooses: ")
            Text("\(computerChoice)")
                .font(.largeTitle).bold()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.pink)
    }
    
}

struct UserChoiceSection: View {
    var options:Array<String>
    @Binding var computerChoice: String
    @Binding var userChoice: String
    @Binding var score: Int
    @Binding var round: Int
    @Binding var showAlert:Bool
    var body: some View {
        HStack {
            ForEach(options, id:\.self) {
                 let option = $0
                
                Button(option){
                    userChoice = option
                    decideWinner()
                    computerChoice = options.randomElement() ?? ""
                }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.red)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func decideWinner(){
        if computerChoice == "Rock" && userChoice == "Paper"{
            score += 1
        } else if computerChoice == "Paper" && userChoice == "Scissor" {
            score += 1
        } else if computerChoice == "Scissor" && userChoice == "Rock" {
            score += 1
        }
        round += 1
        if round >= 10 {
            showAlert = true
        }
    }
}
struct ContentView: View {
    let options = ["Rock", "Paper", "Scissor"]
    @State private var round = 0
    @State private var userChoice = ""
    @State private var score = 0
    @State private var computerChoice = "Rock"
    @State private var showAlert = false
    var body: some View {
        VStack {
            Header(round: round, score: score)
            ComputerSection(computerChoice: computerChoice)
            UserChoiceSection(options: options, computerChoice: $computerChoice, userChoice: $userChoice, score:$score, round: $round, showAlert: $showAlert)
        }
        .alert("Game Over", isPresented: $showAlert) {
            Button("Play Again?") {
                resetGame()
            }
        }

    }
    func resetGame() {
        round = 1
        score = 0
        userChoice = ""
        computerChoice = "Rock"
    }
}

#Preview {
    ContentView()
}
