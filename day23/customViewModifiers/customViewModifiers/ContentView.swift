//
//  ContentView.swift
//  customViewModifiers
//
//  Created by Gunish Sharma on 2025-07-21.
//

import SwiftUI

struct CapsuleText: View { // creating a complicated view outside of main ContentView!
    var text: String
    var light: Bool = false
    var body: some View {
        Button(text) {}
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .foregroundStyle(light ? .white : .black)
            .clipShape(.capsule)
            
    }
}

struct Title: ViewModifier { // custom Modifier!
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.orange)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View { // using an exstention on the view modifier to allow us to write the modifier
    func titleStyle() -> some View { // as a method
        modifier(Title())
    }
}

struct ContentView: View {
    
    let motto1 = Text("Ish") // can create views in the property section
    let motto2 = Text("Gunish")
    
    // returning mutliple views (3 different ways)
    //1
    var name: some View {
        VStack {
            Text("Rohan ")
            Text("Ronak ")
        }
    }
    //2
    var names: some View {
        Group {
            Text("Big Chungus")
            Text("Small Chungus")
        }
    }
    //3 (perferred)
    @ViewBuilder var moreNames: some View {
        Text("Parth")
        Text("Abhishek")
        
    }
    
    @State private var useRedText = false
    
    var body: some View { // remember opaque return types!
        VStack {
            Button("Hello, world") {
                print(type(of: self.body)) // print type
                useRedText.toggle()
            }
            .frame(width: 200,height: 200) // order of modifiers matter
            .padding()
            .background(.red)
            .foregroundStyle(useRedText ? .blue : .white) // conditional modifier
            
            Text("Gunish")
                .modifier(Title()) // applying our custom modififer
            
            Text("Gunish")
                .titleStyle() // applying custom modifier in simpler text
            Text("Gunish")
                .font(.largeTitle) // local override
            Text("Gunish")
                .blur(radius: 5)
            motto1
                .foregroundStyle(.red)
                .foregroundStyle(.blue)
            motto2
            
            name
            
            names
            
            moreNames
                
            
            CapsuleText(text: "First")
            CapsuleText(text: "Second", light: true)
            
        }
        .font(.title) // child modifiers take precedent over local ones
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.green)
        .blur(radius: 0) // not all the time tho
        

    }

}

#Preview {
    ContentView()
}
