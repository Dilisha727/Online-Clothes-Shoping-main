//
//  Welcom_page.swift
//  Online Clothes Shoping
//
//  Created by NIBM on 2024-03-25.
//

import SwiftUI

struct Welcom_page: View {
    var body: some View {
        ZStack{
            Image("welcome")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack{
                Spacer()
                
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .padding(.bottom, 8)
                
                Text( "Welcome\nto our store")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text( "Ger your groceries in as fast as one hour")
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                
                
                NavigationLink {
                    SignInView()
                } label: {
                    RoundButton(title: "Get Started") {
                    }
                }
                Spacer()
                    .frame(height: 80)
                }
                
            }
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .ignoresSafeArea()
    }
    
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            Welcom_page()
        }
        
    }
}
