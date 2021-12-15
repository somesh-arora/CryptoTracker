//
//  LocalFileManager.swift
//  CryptoTracker
//
//  Created by Somesh Arora on 12/14/21.
//

import Foundation
import UIKit

class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    private init() {
        
    }
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        // Create folder
        createFolderIfNeeded(folderName: folderName)
        
        // get path for image
        guard let data = image.pngData(), let url = getUrlForImage(imageName: imageName, folderName: folderName) else {
            return
        }
        
        // save image to path
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image. \(error), imageName: \(imageName)")
        }
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        guard let url = getUrlForImage(imageName: imageName, folderName: folderName),
        FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getUrlForFolder(folderName: folderName) else {
            return
        }
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("Error creating directory \(error), for foldername: \(folderName)")
            }
        }
    }
    
    private func getUrlForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        return url.appendingPathComponent(folderName)
    }
    
    private func getUrlForImage(imageName: String, folderName: String) -> URL? {
        guard let folderUrl = getUrlForFolder(folderName: folderName) else {
            return nil
        }
        return folderUrl.appendingPathComponent(imageName + ".png")
    }
}
