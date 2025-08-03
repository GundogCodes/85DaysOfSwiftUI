//
//  ContentView.swift
//  loadingResources
//
//  Created by Gunish Sharma on 2025-08-02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
    func testBundles() {
        // try find somefile.txt in our app bundle
        if let fileURL = Bundle.main.url(forResource: "someFile", withExtension: "txt") {
            if let fileContents =  try? String(contentsOf: fileURL, encoding: .ascii) {
                // we loaded the file, idk bout this encoding though
            } 
        }
    }
}
#Preview {
    ContentView()
}
