//
//  HapticManager.swift
//  CryptoTracker
//
//  Created by Somesh Arora on 12/18/21.
//

import Foundation
import UIKit

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
