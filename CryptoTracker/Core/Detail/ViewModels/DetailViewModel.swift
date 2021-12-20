//
//  DetailViewModel.swift
//  CryptoTracker
//
//  Created by Somesh Arora on 12/19/21.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailService.$coinDetails.sink { coinDetails in
            print("coin details received")
            print(coinDetails)
        }
        .store(in: &cancellables)
    }
}
