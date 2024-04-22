//
//  CartButton.swift
//  Online Clothes Shoping
//
//  Created by NIBM-LAB04-PC04 on 2024-03-26.
//
/*
import SwiftUI

struct CartButton: View {
    var numberOfProducts: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart")
                .padding(.top, 5)

            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                    .cornerRadius(50)
            }
        }
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(numberOfProducts: 1)
    }
}
*//*
import SwiftUI

struct ChatView: View {
    var body: some View {
        VStack {
            Text("Chat Window")
                .font(.title)
                .padding()
            Spacer()
        }
    }
}

struct Content1View: View {
    @State private var isChatOpen = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Button(action: {
                    isChatOpen.toggle()
                }) {
                    Image(systemName: "message")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }
                .padding()
            }
            .navigationBarTitle("Chat Example")
            .sheet(isPresented: $isChatOpen) {
                ChatView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
