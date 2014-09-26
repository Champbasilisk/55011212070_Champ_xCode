//
//  File.swift
//  TipCalculator
//
//  Created by student on 9/12/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import Foundation
class TipCalculatorModel {
    
    //2
    var total: Double
    var taxPct: Double
    var subtotal: Double {
        get {
            return total / (taxPct+1)
        }
    }
    
    //3
    init(total:Double, taxPct:Double){
        self.total = total                          // self  variable for this constructer
        self.taxPct = taxPct
    }
    //4
    func calcTipWithTipPct(tipPct:Double) -> (tipAmt:Double, total:Double){ //for return with vector ->
        let tipAmp = subtotal * tipPct
        let finalTotal = total + tipAmp
        return (tipAmp, finalTotal)
    }
    
    //1
    func returnPossibleTips() -> [Int: (tipAmt:Double, total:Double)]{
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        let possibleTipExplicit:[Double] = [0.15, 0.18, 0.20]
        
        //2
        var retval = Dictionary<Int, (tipAmt:Double, total:Double)>()
        for possibleTip in possibleTipsInferred{
            let intPct = Int(possibleTip*100)
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
}

//6
let tipCalC = TipCalculatorModel(total: 33.25, taxPct: 0.06)