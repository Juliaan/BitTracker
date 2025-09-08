//
//  CurrencyListCellView.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/05.
//

import SwiftUI

struct CurrencyListCellView: View {
    
    var currency: Currency
    
    var body: some View {
        
        HStack {
            
            Text(currency.name)
                .font(.system(size: 20))
                
            Spacer()
            
            Text(currency.code)
                .font(.system(size: 20))
                .fontWeight(.semibold)
            
        }
        .foregroundColor(Color.flashDarkGreen)
        
    }
    
}

#Preview {
    
    var currency: Currency = Currency(code: "BTC", name: "Bitcoin")
    CurrencyListCellView(currency: currency)
    
}
