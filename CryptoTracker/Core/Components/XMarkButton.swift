//
//  XMarkButton.swift
//  CryptoTracker
//
//  Created by Somesh Arora on 12/16/21.
//

import SwiftUI

struct XMarkButton: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            XMarkButton()
                .previewLayout(.sizeThatFits)
            
            XMarkButton()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
       
    }
}
