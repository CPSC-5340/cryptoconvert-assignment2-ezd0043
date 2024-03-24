//
//  Converter.swift
//  Assignment2
//
//  Created by Emily Denham on 3/20/24.
//
import Foundation
import SwiftUI

struct Converter: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("World Currency Exchange", value: "currency")
                NavigationLink("Crypto Exchange", value: "crypto")            }
            .navigationDestination(for: String.self) { textValue in
                if textValue == "currency" {
                    CurrencyView()
                } else {
                    CryptoView()
                }
            }
             .navigationTitle("Conversion App")
        }
    }
}

struct Converter_Previews: PreviewProvider {
    static var previews: some View {
        Converter()
    }
}


struct CurrencyView: View {

    @ObservedObject var viewModel = CurrencyConverterViewModel()
    
    var body: some View {
        Text("1 USD Exchange Rate")
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                ForEach(viewModel.listOfCards) { card in
                    CurrencyItem(card: card)
                        .onTapGesture {
                            viewModel.flip(card: card)
                        }
                }
            }
        }
        .onAppear {
            viewModel.fetchCards()
        }
    }
}

struct CryptoView: View {
    
    @ObservedObject var viewModel = CryptoConverterViewModel()
    
    var body: some View {
        List {
            Section {
                HStack {
                    Text("Bitcoin: ")
                    TextField("Amount", text: $viewModel.bitcoins)
                        .keyboardType(.numberPad)
                    }
                }
            Section {
                ForEach(viewModel.listOfCryptos) { card in
                    CryptoItem(card: card.cardContent)
                }
            }
        }
        .onAppear {
            viewModel.fetchCryptos()
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
