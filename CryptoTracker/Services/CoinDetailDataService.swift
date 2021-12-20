//
//  CoinDetailDataService.swift
//  CryptoTracker
//
//  Created by Somesh Arora on 12/19/21.
//

import Foundation
import Combine

class CoinDetailDataService {
    
    @Published var coinDetails: CoinDetailModel? = nil
    
    var coinDetailSubscription: AnyCancellable?
    
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinDetails()
    }
    
    func getCoinDetails() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else {
            return
        }
        
        coinDetailSubscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] coinDetails in
                self?.coinDetails = coinDetails
                self?.coinDetailSubscription?.cancel()
            })
    }
}

