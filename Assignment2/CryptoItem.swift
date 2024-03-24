//
//  CryptoItem.swift
//  Assignment2
//
//  Created by Emily Denham on 3/20/24.
//
import Foundation
import SwiftUI

struct CryptoItem: View {
    
    var card: CryptoItemModel
    
    var body: some View {
        HStack {
            Text(card.cryptoName)
            Spacer()
            Text("\(card.multiplier, specifier: "%.2f")")
        }
    }
}

struct CryptoItem_Previews: PreviewProvider {
    static var previews: some View {
        CryptoItem(card: CryptoItemModel(cryptoName: "US Dollar", cryptoCode: "USD", multiplier: 23450))
    }
}

