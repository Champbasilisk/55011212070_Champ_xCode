class TipCalculatorModel {
    
    //2
    var total: Double
    var taxPct: Double
    var subtotal: Double{
    get{
        return total / (taxPct+1)
        }
    }
    
    //3
    init(total:Double, taxPct:Double){
        self.total = total                          // self  variable for this constructer
        self.taxPct = taxPct
    }
    //4
    func calcTipWithTipPct(tipPct:Double) ->Double{ //for return with vector ->
        return subtotal * tipPct
    }
    
    //1
    func returnPossibleTips() -> [Int: Double]{
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        let possibleTipExplicit:[Double] = [0.15, 0.18, 0.20]
        var numberOfIntems = possibleTipsInferred.count
        
        //2
        var retval = [Int: Double]()
        for possibleTip in possibleTipsInferred{
            let intPct = Int(possibleTip*100)
            //3
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
}

//6
let tipCalc = TipCalculator(total: 33.25, taxPct: 0.06)
