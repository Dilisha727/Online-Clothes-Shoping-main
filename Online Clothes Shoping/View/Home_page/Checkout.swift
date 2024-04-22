import SwiftUI
import Combine

class AlertViewModel: ObservableObject {
    @Published var showAlert = false
    var alertMessage = ""
}

struct CheckoutView: View {
    @State private var selectedPaymentMethod: PaymentMethod?
    @State private var isEditingShippingAddress = false // Added state for editing shipping address
    
    enum PaymentMethod {
        case creditDebitCard, cashOnDelivery
    }
    
    @ObservedObject var alertViewModel = AlertViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack{
                    BackButton(action: {
                        
                        
                    })
                    Text("Checkout")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                       // .padding(.top, 20)
                        
                }.padding(.bottom,40)
                
                Text("Shipping Address")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                RoundedRectangle(cornerRadius: 8)
                    .frame(height: 48)
                    .foregroundColor(.green.opacity(0.2))
                    .overlay(
                        HStack {
                            Text("Add Shipping Address")
                                .foregroundColor(.black)
                            Spacer()
                            NavigationLink(destination: ShippingAddressView(), isActive: $isEditingShippingAddress) {
                                Image(systemName: "pencil.circle")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                        }
                        .padding(.horizontal)
                    )
                
                Text("Payment Method")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 20) {
                    PaymentSelectionView(text: "Credit/Debit Card", isSelected: selectedPaymentMethod == .creditDebitCard)
                        .onTapGesture {
                            selectedPaymentMethod = .creditDebitCard
                        }
                    
                    PaymentSelectionView(text: "Cash on Delivery", isSelected: selectedPaymentMethod == .cashOnDelivery)
                        .onTapGesture {
                            selectedPaymentMethod = .cashOnDelivery
                        }
                }
                
                Spacer()
                Button(action: {
                    // Add action for payment
                    alertViewModel.showAlert = true
                    alertViewModel.alertMessage = "Payment successful!"
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        alertViewModel.showAlert = false
                    }
                }) {
                    Text("Pay")
                        .foregroundColor(.black)
                        .font(Font.custom("Nunito", size: 18))
                        .fontWeight(.medium)
                        .frame(width: 335, height: 50)
                        .background(Color(hex: "78F208")) // Button color: 78F208
                        .cornerRadius(25)
                        .padding([.top, .leading, .bottom], 20)
                }
                .padding(.bottom, 50)
                .frame(width: 360, height: 100)
                .alert(isPresented: $alertViewModel.showAlert) {
                    Alert(title: Text("Payment Status"), message: Text(alertViewModel.alertMessage), dismissButton: .default(Text("OK")))
                }
            }
            .padding(.horizontal)
            .navigationBarTitle("", displayMode: .inline) // Hide navigation bar title
            .navigationBarHidden(false) // Show navigation bar
        }
    }
}

// Dummy view for Shipping Address editing

//

struct PaymentSelectionView: View {
    let text: String
    let isSelected: Bool
    
    var body: some View {
        Text(text)
            .frame(width: 160, height: 60)
            .background(isSelected ? Color.blue : Color.gray)
            .cornerRadius(8)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
