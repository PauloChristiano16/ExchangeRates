//
//  RatesFluctuationDataProvider.swift
//  ExchangeRates
//
//  Created by Paulo Christiano on 21/10/23.
//

import Foundation
import Combine

protocol RatesFluctuationDataProviderDelegate: DataProviderManagerDelegate {
    func success(model: [RateFluctuationModel])
}

class RatesFluctuationDataProvider: DataProviderManager<RatesFluctuationDataProviderDelegate, [RateFluctuationModel]> {
    
    private let ratesStore: RatesStore
    
    init(ratesStore: RatesStore = RatesStore()) {
        self.ratesStore = ratesStore
    }
    
    func fetchFluctuation(by base: String, from symbols: [String], startDate: String, endDate: String) {
        Task.init {
            do {
                let object = try await ratesStore.fetchFluctuation(by: base, from: symbols, startDate: startDate, endDate: endDate)
                delegate?.success(model: object.map({ (symbol, fluctuation) -> RateFluctuationModel in
                    return RateFluctuationModel(symbol: symbol, change: fluctuation.change, changePct: fluctuation.changePct, endRate: fluctuation.endRate)
                }))
            } catch {
                delegate?.errorData(delegate, error: error)
            }
        }
    }
}
