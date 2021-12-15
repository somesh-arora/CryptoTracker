//
//  UIApplication.swift
//  CryptoTracker
//
//  Created by Somesh Arora on 12/14/21.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
