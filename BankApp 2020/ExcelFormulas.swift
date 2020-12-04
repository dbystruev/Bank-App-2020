//
//  ExcelFormulas.swift
//  BankApp 2020
//
//  Created by Denis Bystruev on 04.12.2020.
//
//  https://gist.github.com/glaucocustodio/58f86d7e5f184f7b6f2c

import Foundation

class ExcelFormulas {
    class func pmt(rate : Double, nper : Double, pv : Double, fv : Double = 0, type : Double = 0) -> Double {
        return ((-pv * pvif(rate: rate, nper: nper) - fv) / ((1.0 + rate * type) * fvifa(rate: rate, nper: nper)))
    }
    class func pow1pm1(x : Double, y : Double) -> Double {
        return (x <= -1) ? pow((1 + x), y) - 1 : exp(y * log(1.0 + x)) - 1
    }
    class func pow1p(x : Double, y : Double) -> Double {
        return (abs(x) > 0.5) ? pow((1 + x), y) : exp(y * log(1.0 + x))
    }
    class func pvif(rate : Double, nper : Double) -> Double {
        return pow1p(x: rate, y: nper)
    }
    class func fvifa(rate : Double, nper : Double) -> Double {
        return (rate == 0) ? nper : pow1pm1(x: rate, y: nper) / rate
    }
}
