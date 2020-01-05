//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Evgeniy Uskov on 17/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalculationLogic {
    
    private var number: Double?
    private var intermediateCalculation: (param1: Double, calcMethod: String)?
    
    mutating func setNumber(_ value: Double) {
        self.number = value
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let value = number{
            switch symbol {
            case "AC":
                    return 0
            case "+/-":
                    return value * -1
            case "%":
                    return value * 0.01
            case "=":
                return performTwoNumCalculation(param2: value)
            default:
                self.intermediateCalculation = (param1: value, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(param2: Double) -> Double? {
        if let param1 = intermediateCalculation?.param1,
            let calcMethod = intermediateCalculation?.calcMethod {
            switch calcMethod{
                case "+":
                    return param1 + param2
                case "-":
                    return param1 - param2
                case "×":
                    return param1 * param2
                case "÷":
                    return param1 / param2
                default:
                    fatalError("No such operation allowed to perform")
            }
        }
        return nil
    }
}
