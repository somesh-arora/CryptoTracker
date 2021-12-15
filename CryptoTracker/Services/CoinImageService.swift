//
//  CoinImageService.swift
//  CryptoTracker
//
//  Created by Somesh Arora on 12/13/21.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    
    private let coin: CoinModel
    
    private let fileManager = LocalFileManager.instance
    
    private let folderName = "coin_images"
    
    private let imageName:  String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: self.imageName, folderName: self.folderName) {
            image = savedImage
            print("image from file manager")
        } else {
            downloadCoinImage()
            print("downloading image")
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else {
            return
        }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] image in
                guard let self = self, let downloadedImage = image else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
