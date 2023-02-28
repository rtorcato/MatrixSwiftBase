//
//  ContentView.swift
//  SweaterShopApp
//
//  Created by Stephanie Diep on 2021-12-23.
//

import SwiftUI

struct ShoppingCartContentView: View {
    @StateObject var cartManager = CartManager()
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(ShoppingCartItem.productList, id: \.id) { shoppingCartItem in
                        ProductCard(product: shoppingCartItem)
                            .environmentObject(cartManager)
                    }
                }
                .padding()
            }
            .navigationTitle(Text("Sweater Shop"))
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)
                } label: {
                    ShoppingCartButton(numberOfProducts: cartManager.products.count)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ShoppingCartContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartContentView()
    }
}
