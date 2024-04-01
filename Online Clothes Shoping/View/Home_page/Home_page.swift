//
//  Home_page.swift
//  Online Clothes Shoping
//
//  Created by NIBM on 2024-03-25.
//

import SwiftUI

struct Home_page: View {
    @State var goTOCart = false
    @State var goToSearch = false
    @State private var searchText: String = ""
    @State var isSearchActive = false
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    @StateObject var productVM : ProductViewModel = ProductViewModel()
    @State var selected = tabs[0]
    @State private var isAnimated = false
    
    
    var filteredProducts: [Items] {
        let lowercaseSelected = selected.lowercased()
        
        if lowercaseSelected == "all" {
            return productVM.productResults
        } else {
            let filtered = productVM.productResults.filter { $0.category.lowercased() == lowercaseSelected }
            filtered.forEach { item in
                print(item.category)
            }
            return filtered
        }
    }

    @Namespace var animation
    var body: some View {
        NavigationView{
            ZStack{
                Color.white.edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack(alignment:.leading){
                        AppBarView()
                        
                        TagLine()
                            .padding(.horizontal)
                            .padding(.vertical)
                        Searchhome()
                       //Banner()
                        HStack(spacing:0){
                            ForEach(tabs,id:\.self){tab in
                                
                                //tab button
                                RoundButton(title: tab, selected: $selected, animation: animation)
                                
                                //space between
                                if tabs.last != tab{Spacer(minLength: 0)}
                            }
                            
                        }
                        .padding(.horizontal,35)
                        
                        
                        
                        
                        
                        LazyVGrid(columns: self.columns,spacing: 25){
                            
                            ForEach (filteredProducts, id: \.id) { products in
                                
                                ProductRow(product: products)
                                
                                
                                
                            }
                            .padding([.horizontal,.top])
                        }
                        .background(Color.white.edgesIgnoringSafeArea(.all))
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }
                
             
              // NavigationLink("", isActive: $goTOCart) {
                //   Cart()
                    
                }
             /*   NavigationLink(
                    destination: Search(searchTerm: searchText),
                    isActive: $isSearchActive,
                    label: { EmptyView() }
                )*/
                
                
                
                
            }.clipped()
        
    }
}

#Preview {
    Home_page()
}
var tabs = ["All","Men","Women","Unisex"]
struct AppBarView: View {
    var body: some View {
        HStack{
           /* Button(action: {}) {
                Image("Menu")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(width: 30, height:30)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
            */
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 84,height: 84)
            
            
            NavigationLink(destination: MyAccountView()){
                Image("profile")
                    .resizable()
                    .frame(width: 45,height: 45)
                    .cornerRadius(50)
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                
                
            }
            .frame(width: 30, height:30)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .trailing)
            
            Spacer()
            
            
        }.padding(.horizontal)
    }
}

struct TagLine: View {
    var body: some View {
        Text("GlamFrame")
            .font(Font.custom("Chalkduster", size: 30))
            .fontWeight(.bold)
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
            .padding([.leading, .bottom, .trailing], 16)
            //.opacity(isAnimated ? 1 : 0) // Fade in animation
        
    }
}


struct Searchhome: View {
    @State private var searchText: String = ""
    @State var isSearchActive = false
    
    var body: some View {
        HStack {
            HStack{
                
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
            
            // Other content here
            
            /* NavigationLink(
             destination: Search(searchTerm: searchText),
             isActive: $isSearchActive,
             label: { EmptyView() }
             )
             .hidden()
             }*/
            
            
        }
    }
    
    
    
    struct Banner: View {
        var body: some View {
            HStack{
                HStack{
                    Image("banner")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 150)
                        .clipped()
                        .cornerRadius(10)
                }.padding(.horizontal)
                
            }
        }
    }
    
    
    
    
   /* struct BottomNavBarItem: View {
        
        let image: Image
        let action: ()-> Void
        var body: some View {
            Button(action: action, label: {
                image
                    .frame(maxWidth: .infinity)
            })
        }
    }
*/
}

