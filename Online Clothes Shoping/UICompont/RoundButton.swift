//
//  RoundButton.swift
//  Online Clothes Shoping
//
//  Created by NIBM on 2024-03-25.
//

import SwiftUI

struct RoundButton: View {
    @State var title: String = "Tittle"
    var didTap: (()->())?
    var body: some View {
        Button {
            didTap?()
        } label: {
            Text(title)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
        .background( Color.red)
        .cornerRadius(20)
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton()
            .padding(20)
    }
}
