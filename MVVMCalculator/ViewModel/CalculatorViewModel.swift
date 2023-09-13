//
//  CalculatorViewModel.swift
//  MVVMCalculator
//
//  Created by 권현석 on 2023/09/13.
//

import Foundation

class CalculatorViewModel {
    
    var firstNumber: Observable<String?> = Observable("")
    var secondNumber: Observable<String?> = Observable("")
    var selectedOperator: Observable<OperatorEnum?> = Observable(nil)
    var resultValue: Observable<String> = Observable("")
    
    func calculate() {
        guard
            let first = firstNumber.value,
            let firstNumInt = Int(first) else {
            resultValue.value = "첫 번째 숫자가 잘못됨 수정하세요."
            return
        }
        
        guard
            let second = secondNumber.value,
            let secondNumInt = Int(second) else {
            resultValue.value = "두번째 숫자가 잘못됨 수정하세요."
            return
        }
        
        guard let myOperator = selectedOperator.value else { return }
        
        switch myOperator {
        case .plus:
            resultValue.value = "\(firstNumInt + secondNumInt)"
        case .minus:
            resultValue.value = "\(firstNumInt - secondNumInt)"
        case .multiply:
            resultValue.value = "\(firstNumInt * secondNumInt)"
        case .divide:
            resultValue.value = "\(firstNumInt / secondNumInt)"
        }
    }
}
