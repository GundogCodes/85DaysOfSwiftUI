//
//  ContentView.swift
//  workingWithStrings
//
//  Created by Gunish Sharma on 2025-08-02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("touch me") {
                testStrings()
            }
        }
        .padding()
    }
    func testStrings() {
        let input = """
            a
            b
            c
            """
        let letters = input.components(separatedBy: "\n") // returns array
        let letter = letters.randomElement()
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
    }
    func checkMispelledWords(){
        // 4 steps
        // 1
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = misspelledRange.location == NSNotFound
    }
}

#Preview {
    ContentView()
}
