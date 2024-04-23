/*import SwiftUI

struct SearchView: View {
    @StateObject var productsViewModel = ProductViewModel()
    @State private var gridColumns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    @State private var searchText = ""
    @State private var isAscendingSort = true
    @State private var selectedPriceFilter = "All"
    
    var filteredProducts: [Items] {
        var filtered = searchText.isEmpty ? productsViewModel.productResults : productsViewModel.productResults.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
        
        if isAscendingSort {
            filtered.sort { $0.price < $1.price }
        } else {
            filtered.sort { $0.price > $1.price }
        }
        
        if selectedPriceFilter != "All" {
            let priceRange = getPriceRange(for: selectedPriceFilter)
            filtered = filtered.filter { product in
                priceRange.contains(product.price)
            }
        }
        
        return filtered
    }
    
    var body: some View {
        VStack{
            Text("ddd")
            NavigationView {
                VStack(spacing: 16) {
                
                    Toggle("Sort By Price", isOn: $isAscendingSort)
                        .font(.headline)
                        .padding(.horizontal)
                    
                    Menu("Filter By Price") {
                        ForEach(["All", "Under LKR 500", "LKR 500 - LKR 1500", "LKR 1500 - LKR 2500", "Over LKR 2500"], id: \.self) { filter in
                            Button(filter) {
                                selectedPriceFilter = filter
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    ScrollView {
                        LazyVGrid(columns: gridColumns, spacing: 16) {
                            ForEach(filteredProducts, id: \.id) { product in
                                ProductRow(product: product)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .background(Color.white.edgesIgnoringSafeArea(.all))
                }
                //.navigationTitle("Search Products")
              .searchable(text: $searchText, prompt: "Search")
                .onAppear {
                    // Load initial product data when the view appears
                    productsViewModel.loadProducts()
                }
            }
        }.padding(.bottom,100)
    }
    
    func getPriceRange(for filter: String) -> ClosedRange<Int> {
        switch filter {
        case "Under LKR 500":
            return 0...499
        case "LKR 500 - LKR 1500":
            return 500...1500
        case "LKR 1500 - LKR 2500":
            return 1500...2500
        case "Over LKR 2500":
            return 2500...Int.max
        default:
            return 0...Int.max
        }
    }
}
/*
import SwiftUI

struct SearchView: View {
    @StateObject var productsViewModel = ProductViewModel()
    @State private var gridColumns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    @State private var searchText = ""
    @State private var isAscendingSort = true
    @State private var selectedPriceFilter = "All"
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                sortAndFilterControls
                
                Divider() // Add a divider for visual separation
                
                productGridView
                    .frame(maxHeight: .infinity) // Allow the product grid to expand vertically
                
            }
            .padding(.top,30) // Add padding around the content
            .navigationBarTitle("Search Products", displayMode: .inline)
            .searchable(text: $searchText, prompt: "Search")
            .onAppear {
                productsViewModel.loadProducts()
                
            }
        }.padding(.bottom,100)
    }
    
    private var sortAndFilterControls: some View {
        VStack(spacing: 8) {
            Toggle("Sort By Price", isOn: $isAscendingSort)
                .font(.headline)
                .padding(.horizontal)
            
            Menu("Filter By Price") {
                priceFilterMenuItems
            }
            .padding(.horizontal)
        }
    }
    
    private var priceFilterMenuItems: some View {
        ForEach(["All", "Under LKR 500", "LKR 500 - LKR 1500", "LKR 1500 - LKR 2500", "Over LKR 2500"], id: \.self) { filter in
            Button(filter) {
                selectedPriceFilter = filter
            }
        }
    }
    
    private var productGridView: some View {
        ScrollView {
            LazyVGrid(columns: gridColumns, spacing: 16) {
                ForEach(filteredProducts, id: \.id) { product in
                    ProductRow(product: product)
                }
            }
            .padding(.horizontal)
        }
        .background(Color.white)
        .cornerRadius(12) // Add corner radius for visual appeal
        .shadow(radius: 4) // Add shadow for depth
    }
    
    private var filteredProducts: [Items] {
        var filtered = searchText.isEmpty ? productsViewModel.productResults : productsViewModel.productResults.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
        
        if isAscendingSort {
            filtered.sort { $0.price < $1.price }
        } else {
            filtered.sort { $0.price > $1.price }
        }
        
        if selectedPriceFilter != "All" {
            let priceRange = getPriceRange(for: selectedPriceFilter)
            filtered = filtered.filter { product in
                priceRange.contains(product.price)
            }
        }
        
        return filtered
    }
    
    private func getPriceRange(for filter: String) -> ClosedRange<Int> {
        switch filter {
        case "Under LKR 500":
            return 0...499
        case "LKR 500 - LKR 1500":
            return 500...1500
        case "LKR 1500 - LKR 2500":
            return 1500...2500
        case "Over LKR 2500":
            return 2500...Int.max
        default:
            return 0...Int.max
        }
    }
}
*/
*/
import SwiftUI

struct SearchView: View {
    @StateObject var productsViewModel = ProductViewModel()
    @State private var gridColumns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    @State private var searchText = ""
    @State private var isAscendingSort = true
    @State private var selectedPriceFilter = "All"
    
    var filteredProducts: [Items] {
        var filtered = searchText.isEmpty ? productsViewModel.productResults : productsViewModel.productResults.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
        
        if isAscendingSort {
            filtered.sort { $0.price < $1.price }
        } else {
            filtered.sort { $0.price > $1.price }
        }
        
        if selectedPriceFilter != "All" {
            let priceRange = getPriceRange(for: selectedPriceFilter)
            filtered = filtered.filter { product in
                priceRange.contains(product.price)
            }
        }
        
        return filtered
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                SearchBar(searchText: $searchText)
                    .padding(.horizontal)
                
                Toggle("Sort By Price", isOn: $isAscendingSort)
                    .font(.headline)
                    .padding(.horizontal)
                
                Menu("Filter By Price") {
                    ForEach(["All", "Under LKR 500", "LKR 500 - LKR 1500", "LKR 1500 - LKR 2500", "Over LKR 2500"], id: \.self) { filter in
                        Button(filter) {
                            selectedPriceFilter = filter
                        }
                    }
                }
                .padding(.horizontal)
                
                ScrollView {
                    LazyVGrid(columns: gridColumns, spacing: 16) {
                        ForEach(filteredProducts, id: \.id) { product in
                            ProductRow(product: product)
                        }
                        
                    }
                    .padding(.horizontal)
                }
                .background(Color.white.edgesIgnoringSafeArea(.all))
            }
            .padding()
            .padding(.top,2)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Search Products")
            .onAppear {
                // Load initial product data when the view appears
                productsViewModel.loadProducts()
            }
        }
    }
    
    func getPriceRange(for filter: String) -> ClosedRange<Int> {
        switch filter {
        case "Under LKR 500":
            return 0...499
        case "LKR 500 - LKR 1500":
            return 500...1500
        case "LKR 1500 - LKR 2500":
            return 1500...2500
        case "Over LKR 2500":
            return 2500...Int.max
        default:
            return 0...Int.max
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
            Button(action: {
                searchText = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
            }
        }
    }
}

