//
//  Home_page.swift
//  Online Clothes Shoping
//
//  Created by NIBM on 2024-03-30.
//


import SwiftUI



struct Home_page: View {
    @State var goTOCart = false
    @State var goToSearch = false
    @State private var searchText: String = ""
    @State var isSearchActive = false
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    @StateObject var productVM: ProductViewModel = ProductViewModel()
    @State var selected = tabs[0]
    @State private var showChat = false
    @State private var messages: [Message] = [
        Message(sender: "Seller", content: "Welcome to the chat!", timestamp: Date())
    ]
    @State private var newMessage: String = ""

    @Namespace var animation

    var filteredProducts: [Items] {
        let lowercaseSelected = selected.lowercased()

        if lowercaseSelected == "all" {
            return productVM.productResults
        } else {
            let filtered = productVM.productResults.filter { $0.category.lowercased() == lowercaseSelected }
            return filtered
        }
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(alignment:.leading) {
                        Searchhome()
                        HStack(spacing:0) {
                            ForEach(tabs,id:\.self) { tab in
                                RoundButton(title: tab, selected: $selected, animation: animation)
                                if tabs.last != tab { Spacer(minLength: 0) }
                            }
                        }
                        .padding(.horizontal,35)

                        LazyVGrid(columns: self.columns, spacing: 25) {
                            ForEach(filteredProducts, id: \.id) { products in
                                ProductRow(product: products)
                            }
                            .padding([.horizontal, .top])
                        }
                        .background(Color.white.edgesIgnoringSafeArea(.all))

                        Spacer()
                    }
                    .padding(.bottom, 100)

                }

                Button(action: {
                    showChat.toggle()
                }) {
                    Image(systemName: "message")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                }
                .padding(.trailing, 300)
                .padding(.top, 500)
                .navigationTitle("GlamFrame")
                .toolbar {
                    NavigationLink(destination: Cart()) {
                        Image(systemName: "cart")
                            .foregroundColor(.black)
                    }
                    Spacer()
                    NavigationLink(destination: MyAccountView()) {
                        Image("profile")
                            .resizable()
                            .frame(width: 45,height: 45)
                            .cornerRadius(50)
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal, 10.0)
                    }
                    .frame(width: 30, height:30)
                    .padding(.trailing, 10)
                }

            }
        }
        .overlay(
            Group {
                if showChat {
                    VStack {
                        Spacer()
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.white)
                                .frame(width: 300, height: 400)
                                .shadow(radius: 5)
                            VStack(spacing: 20) {
                                Text("Chat with Seller")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(.top, 20)

                                ScrollView {
                                    VStack(spacing: 10) {
                                        ForEach(messages) { message in
                                            MessageRow(message: message)
                                        }
                                    }
                                    .padding(.horizontal, 20)
                                }

                                Divider()

                                HStack {
                                    TextField("Type your message", text: $newMessage)
                                        .padding(.horizontal, 20)
                                        .textFieldStyle(RoundedBorderTextFieldStyle()) // Added style
                                    Button(action: sendMessage) {
                                        Text("Send")
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 5)
                                            .background(Color.blue)
                                            .foregroundColor(.white)
                                            .cornerRadius(8)
                                    }
                                    .padding(.trailing, 20)
                                }
                                .padding(.bottom, 20)
                            }
                        }
                        .onTapGesture {} // Add empty gesture to prevent tap closing
                    }
                    .frame(width: 300, height: 400)
                    .background(Color.black.opacity(0.4).edgesIgnoringSafeArea(.all))
                    .onTapGesture {
                        // Remove showChat.toggle() from here
                    }
                }
            }
        )
        .clipped()
    }

    func sendMessage() {
        guard !newMessage.isEmpty else { return }
        messages.append(Message(sender: "User", content: newMessage, timestamp: Date()))
        newMessage = ""
    }

    struct MessageRow: View {
        let message: Message

        var body: some View {
            HStack {
                if message.sender == "Seller" {
                    Spacer()
                }
                Text(message.content)
                    .padding(8)
                    .background(message.sender == "Seller" ? Color.green : Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal, 10)
                if message.sender != "Seller" {
                    Spacer()
                }
            }
        }
    }
}

struct Home_page_Previews: PreviewProvider {
    static var previews: some View {
        Home_page()
    }
}

var tabs = ["All","Men","Women","Kids"]

struct Searchhome: View {
    @State private var searchText: String = ""
    @State var isSearchActive = false

    var body: some View {
        HStack {
            HStack {
                TextField("Search clothings", text: $searchText)
                    .padding()
                    .frame(height: 50)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.black, lineWidth: 2)
                    )

                Button(action: {
                    isSearchActive = true
                }) {
                    Image(systemName: "magnifyingglass")
                        .padding()
                        .frame(width: 55, height: 55)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            NavigationLink(destination: SearchView(), isActive: $isSearchActive) {
                                EmptyView()
                            }
                            .hidden()
        }
    }
}


