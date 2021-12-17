//
//  MarketDataService.swift
//  CryptoTracker
//
//  Created by Somesh Arora on 12/16/21.
//

import Foundation
import Combine

class MarketDataService {
    
    @Published var marketData: MarketDataModel?
    
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    private func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else {
            return
        }
        
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] globalData in
                self?.marketData = globalData.data
                self?.marketDataSubscription?.cancel()
            })
    }
}
