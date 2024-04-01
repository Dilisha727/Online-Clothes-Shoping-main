import SwiftUI

struct Search: View {
    @Binding var searchText: String
    @ObservedObject var navigationViewModel: NavigationViewModel // Use ObservedObject for NavigationViewModel
    
    var body: some View {
        VStack {
          
            // Your search bar
            HStack {
                TextField("Search", text: $searchText)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                Button(action: {
                    // Handle search action
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 10)
            }  // Your navigation bar
            BottomNavBarViewModel(viewModel: navigationViewModel)
            
            .padding(.horizontal)
        }
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search(searchText: .constant(""), navigationViewModel: NavigationViewModel())
    }
}
