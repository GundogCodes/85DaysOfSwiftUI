//
//  ContentView.swift
//  Edutainment
//
//  Created by Gunish Sharma on 2025-08-07.
//

import SwiftUI

struct ContentView: View {
    @State private var showSubTitle = false
    @State private var showWhichTablePicker = true
    @State private var showHowManyQuestions = false
    @State private var showQuestions = false
    
    @State private var selectedTable = 2
    @State private var selectedNumOfQuestions = 5
    
    let numOfQuestionOptions = [5,10,15]
   
    @State private var inputAnswer = ""
    @State private var questionNum = 1
    @State private var randomInt = 0
    @State private var showAlert = false
    @State private var score = 0
    @State private var bounce = false
    
    
    var body: some View {
        ZStack {
            if showWhichTablePicker {
                LinearGradient(colors: [.white, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            }
            if showHowManyQuestions {
                LinearGradient(colors: [.white, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            }
            if showQuestions {
                LinearGradient(colors: [.white, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            }
            VStack {
                Section {
                    if !showQuestions {
                        VStack {
                            Text("Edutainment")
                                .font(.system(size: 65))
                                .foregroundStyle(.pink)
                                .fontDesign(.rounded).bold()
                            Text("Learn your times tables!")
                                .foregroundStyle(.orange)
                                .font(.system(size: 25))
                        }
                        
                    }
                    
                }
                Spacer()
                
                ZStack {
                    VStack {
                        if showWhichTablePicker {
                            Text("Pick Your Table!")
                                .frame(width: 370,height: 50)
                                .background(LinearGradient(colors: [.red, .orange], startPoint: .bottomLeading, endPoint: .topTrailing))
                                .foregroundStyle(.white)
                                .font(.title)
                                
                            Picker("", selection: $selectedTable) {
                                ForEach(2...12, id: \.self) { num  in
                                    Text("\(num)")
                                        .frame(width: 150, height: 30)
                                        .background(.blue)
                                        .foregroundStyle(.white)
                                        .clipShape(.capsule)
                                    
                                }
                            }
                            .padding()
                            .pickerStyle(.wheel)
                            
                            Button("Select") {
                                showWhichTablePicker = false
                                showHowManyQuestions = true
                            }
                            .padding()
                            .font(.title)
                        }
                        
                    }
                    .frame(width: 370, height: 300)
                    .background(Material.ultraThinMaterial)
                    .cornerRadius(40)
                    Spacer()
                    if showHowManyQuestions {
                        VStack {
                            Text("How Many Questions?")
                                .frame(width: 370,height: 50)
                                .background(LinearGradient(colors: [.blue, .cyan], startPoint: .bottomLeading, endPoint: .topTrailing))
                                .foregroundStyle(.white)
                                
                                .font(.title)
                                
                            Picker("", selection: $selectedNumOfQuestions) {
                                ForEach(numOfQuestionOptions, id: \.self) { num  in
                                    Text("\(num)")
                                    
                                }
                                
                                
                            }
                            .frame(width: 300, height: 140)
                            .pickerStyle(.segmented)
                            .padding()
                            Button("Select") {
                                showHowManyQuestions = false
                                print("\(selectedTable) times table selected")
                                print("\(selectedNumOfQuestions) questions selected")
                                showQuestions = true
                            }
                            .padding()
                            .font(.title)
                        }
                        .frame(width: 370, height: 300)
                        .background(Material.ultraThinMaterial)
                        .cornerRadius(40)
                        
                    }

                    Spacer()
                    if showQuestions {
                        VStack {
                            Text("Question \(questionNum)")
                                .font(.system(size: 70))
                                .frame(width:350,height: 100)
                                .foregroundStyle(.white)
                                .background(LinearGradient(colors: [.green, .accentColor], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .clipShape(.capsule)
                                .scaleEffect(bounce ? 1.1 : 1.0)
                                .animation(.interpolatingSpring(stiffness: 200, damping: 5), value: bounce)
                            Text("\(selectedTable) x \(randomInt) = ?")
                                .onAppear() {
                                    getRandInt()
                                }
                                .font(.system(size: 50))
                                .frame(width:400,height: 100)
                                .background(.ultraThinMaterial)
                            TextField("Answer...", text: $inputAnswer)
                                .font(.title)
                                .frame(width: 370, height: 100)
                                .background(.white)
                                .cornerRadius(40)
                                
                            Button("Enter") {
                                
                                if Int(inputAnswer) == randomInt * selectedTable {
                                    score += 1
                                }
                                inputAnswer = ""
                                bounce.toggle()
                                questionNum += 1
                                
                                
                                if questionNum > selectedNumOfQuestions {
                                    showAlert = true
                                } else {
                                    getRandInt()
                                }
                                
                            }
                            .padding()
                            .font(.title)
                            .alert("Game over", isPresented: $showAlert) {
                                
                                Button("Cancel") {
                                    showAlert = false
                                }
                                Button("Play Again") {
                                    showAlert = false
                                    showQuestions = false
                                    showWhichTablePicker = true
                                    questionNum = 1
                                    selectedTable = 2
                                    score = 0
                                }
                            } message: {
                                Text("Score \(score)")
                            }
                            Text("Score \(score)")
                                .padding()
                                .font(.title)
                        }
                        .frame(width: 390, height: 850)
                        .background(Material.ultraThinMaterial)
                        .cornerRadius(40)
                    }
                }
                Spacer()
            }
        }
           
    }
        
    
    
    func answerResult(timesTable: Int, randInt: Int, answer:Int) -> Bool {
        if timesTable * randInt == answer {
            return true
        } else {
            return false
        }
    }
    
    func getRandInt() {
        randomInt = Int.random(in: 2...20)
    }
}

#Preview {
    ContentView()
}
