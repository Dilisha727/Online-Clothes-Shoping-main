/*import SwiftUI

class NavigationViewModel: ObservableObject {
    @Published var selectedIndex = 0
    @Published var navigationItems: [NavigationItem]
    
    init() {
        let homeView = AnyView(Home_page())
        let categoryView = AnyView(Home_page()) // Replace with your CategoryView
        let chatView = AnyView(Welcom_page()) // Replace with your ChatView
       // let cartView = AnyView(CartView()) // Replace with your CartView
        let profileView = AnyView(MyAccountView()) // Replace with your ProfileView
        
        self.navigationItems = [
            NavigationItem(title: "Home", imageName: "house.fill", destination: homeView),
            NavigationItem(title: "Category", imageName: "list.bullet.rectangle.fill", destination: categoryView),
            NavigationItem(title: "Chat", imageName: "message.fill", destination: chatView),
         //   NavigationItem(title: "Cart", imageName: "cart.fill", destination: cartView),
            NavigationItem(title: "Profile", imageName: "person.fill", destination: profileView)
        ]
    }
    
    func didSelectItem(index: Int) {
        selectedIndex = index
    }
}

struct BottomNavBarViewModel: View {
    @ObservedObject var viewModel: NavigationViewModel
     
     var body: some View {
         HStack {
             ForEach(viewModel.navigationItems.indices, id: \.self) { index in
                 Button(action: {
                     viewModel.didSelectItem(index: index)
                 }) {
                     Image(systemName: viewModel.navigationItems[index].imageName)
                         .font(.system(size: 24))
                         .foregroundColor(viewModel.selectedIndex == index ? .blue : .gray)
                 }
                 .padding(.horizontal, 20)
                 .padding(.vertical, 10)
             }
         }
         .background(Color.white)
         .shadow(radius: 5)
         .clipShape(RoundedRectangle(cornerRadius: 20))
         .padding(.horizontal)
     }
}

struct BottomNavBarViewModel_Previews: PreviewProvider {
     static var previews: some View {
         BottomNavBarViewModel(viewModel: NavigationViewModel())
             .previewLayout(.sizeThatFits)
     }
}
*/
