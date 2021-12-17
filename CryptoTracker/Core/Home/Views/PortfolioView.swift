//
//  PortfolioView.swift
//  CryptoTracker
//
//  Created by Somesh Arora on 12/16/21.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var viewModel: HomeViewModel
    
    @State private var selectedCoin: CoinModel? = nil
    @State private var quantityText: String = ""
    @State private var showCheckmark: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 4) {
                    SearchBarView(searchText: $viewModel.searchText)
                    coinLogoListView
                    
                    if selectedCoin != nil {
                        portfolioInputSection
                    }
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    trailingNavbarButton
                }
            })
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .preferredColorScheme(.dark)
            .environmentObject(dev.homeViewModel)
    }
}

extension PortfolioView {
    
    private var coinLogoListView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(viewModel.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(8)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                selectedCoin = coin
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(coin.id == selectedCoin?.id ? Color.theme.green : Color.clear, lineWidth: 1)
                        )
                }
            }
            .frame(height: 120)
            .padding(.leading)
        }
    }
    
    private var portfolioInputSection: some View {
        Group {
            Section {
                HStack {
                    Text("Current price of: \(selectedCoin?.symbol.uppercased() ?? "")")
                    Spacer()
                    Text(selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
                }
            }
            
            Section {
                HStack {
                    Text("Amount holding:")
                    Spacer()
                    TextField("Ex: 1.4", text: $quantityText)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.decimalPad)
                }
            }
            
            Section {
                HStack {
                    Text("Current Value:")
                    Spacer()
                    Text(getCurrentValue().asCurrencyWith2Decimals())
                    
                }
            }
        }
        .animation(.none, value: true)
        .padding()
        .font(.headline)
    }
    
    private var trailingNavbarButton: some View {
        HStack(spacing: 10) {
            Image(systemName: "checkmark")
                .opacity(showCheckmark ? 1.0 : 0.0)
            Button(action: { saveButtonPressed() }) {
                Text("Save".uppercased())
            }
            .opacity(selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText) ? 1.0 : 0.0)
        }
        .font(.headline)
    }
    
    private func getCurrentValue() -> Double {
        guard let quantity = Double(quantityText) else {
            return 0
        }
        return quantity * (selectedCoin?.currentPrice ?? 0)
    }
    
    private func saveButtonPressed() {
        guard let coin = selectedCoin else {
            return
        }
        // save to portfolio
        withAnimation(.easeIn) {
            showCheckmark = true
            removeSelectedCoin()
        }
        
        // hide keyboard
        UIApplication.shared.endEditing()
        
        // hide checkmark
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeOut) {
                showCheckmark = false
            }
        }
    }
    
    private func removeSelectedCoin() {
        selectedCoin = nil
        viewModel.searchText = ""
    }
}
