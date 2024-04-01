//
//  WelcomePage.swift
//  Online Clothes Shopping
//
//  Created by NIBM on 2024-03-25.
//

import SwiftUI

struct Welcom_page: View {
    @State private var isAnimated = false
    
    var body: some View {
        ZStack{
            Image("Welcom Logo")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
            
                Text("GlamFrame") // Company name
                    .font(Font.custom("Chalkduster", size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .bottom, .trailing], 16)
                    .opacity(isAnimated ? 1 : 0) // Fade in animation
                
                Spacer()

                
                Text( "Happy Shopping")
                    .font(Font.custom("Georgia", size: 32)) // Lora medium, size 32
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .bottom, .trailing], 16)
                    .opacity(isAnimated ? 1 : 0) // Fade in animation
                
                
                Text( "It’s time to experience over thousands of stylish \n products in Genteel")
                    .font(Font.custom("Georgia", size: 16)) // Nunito medium, size 16
                    .foregroundColor(Color(hex: "F7F7F7"))
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .padding([.leading, .bottom, .trailing], 16)
                    .opacity(isAnimated ? 1 : 0) // Fade in animation
                
                
                Button(action: {
                }) {
                    NavigationLink(destination: Home_page()){
                        Text("Get Started")
                            .foregroundColor(.black)
                            .font(Font.custom("Nunito", size: 18))
                            .fontWeight(.medium)
                            .frame(width: 335, height: 50)
                            .background(Color(hex: "78F208")) // Button color: 78F208
                            .cornerRadius(25)
                            .padding([.top, .leading, .bottom], 20)
                            .opacity(isAnimated ? 1 : 0) // Fade in animation
                    }
                }
                .padding(.bottom, 50)
                .frame(width: 360, height: 100)
                
            }
            .padding(.top, 7)
            .onAppear {
                withAnimation(.easeInOut(duration: 1.0)) {
                    isAnimated = true
                }
            }
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
        
    }
}

struct Welcom_page_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Welcom_page()
        }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        self.init(
            red: Double((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: Double((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgbValue & 0x0000FF) / 255.0
        )
    }
}
