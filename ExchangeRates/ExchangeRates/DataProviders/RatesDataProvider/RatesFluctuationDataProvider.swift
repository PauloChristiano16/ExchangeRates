//
//  RatesFluctuationDataProvider.swift
//  ExchangeRates
//
//  Created by Paulo Christiano on 21/10/23.
//

import Foundation
import Combine

protocol RatesFluctuationDataProviderDelegate: DataProviderManagerDelegate {
    func success(model: RatesFluctuationObject)
}

class RatesFluctuationDataProvider: DataProviderManager<RatesFluctuationDataProviderDelegate,RatesFluctuationObject> {
    
    private let ratesStore: RatesStore
    init(ratesStore: RatesStore = RatesStore()) {
        self.ratesStore = ratesStore
    }
    func fetchFluctuation(by base: String, from symbols: [String], startDate: String, endDate: String){
        Task.init{
            do{
                let model = try await ratesStore.fetchFluctuation(by: base, from: symbols, startDate: startDate, endDate: endDate)
                delegate?.success(model: model)
            }catch{
                delegate?.errorData(delegate, error: error)
            }
        }
    }
}
