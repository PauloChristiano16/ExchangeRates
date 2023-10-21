//
//  RatesApi.swift
//  ExchangeRates
//
//  Created by Paulo Christiano on 21/10/23.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
}

struct RatesApi{
    
    static let baseUrl = "https://api.apilayer.com/exchangerates_data"
    static let apiKey = "114feb0bf5e1476a5744d1786f0d9a41"
    static let fluctuation = "/fluctuation"
    static let symbols = "/symbols"
    static let timeseries = "/timeseries"
    
}
