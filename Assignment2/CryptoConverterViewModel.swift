//
//  CryptoConverterViewModel.swift
//  Assignment2
//
//  Created by Emily Denham on 3/20/24.
//
import Foundation

class CryptoConverterViewModel: ObservableObject {
    
    @Published private(set) var listOfCryptos = [ConvertModel<CryptoItemModel>]()
    var bitcoins: String = "1" {
        didSet {
            fetchCryptos()
        }
    }
    
    func fetchCryptos() {
        self.listOfCryptos = [
            ConvertModel(cardContent: CryptoItemModel(cryptoName: "US Dollar", cryptoCode: "USD", multiplier: getConversion(23450))),
            ConvertModel(cardContent: CryptoItemModel(cryptoName: "Ethereum", cryptoCode: "ETH", multiplier: getConversion(14.3))),
            ConvertModel(cardContent: CryptoItemModel(cryptoName: "Tether", cryptoCode: "THR", multiplier: getConversion(23450))),
            ConvertModel(cardContent: CryptoItemModel(cryptoName: "BNB", cryptoCode: "BNB", multiplier: getConversion(77.2))),
            ConvertModel(cardContent: CryptoItemModel(cryptoName: "USD Coin", cryptoCode: "USC", multiplier: getConversion(23454))),
            ConvertModel(cardContent: CryptoItemModel(cryptoName: "XRP", cryptoCode: "XRP", multiplier: getConversion(62113))),
        ]
    }
    
    func getConversion(_ multiplyer: Double) -> Double {
        if let doubleBitcoins = Double(bitcoins) {
            return multiplyer * doubleBitcoins
        }
        return multiplyer
    }
}
