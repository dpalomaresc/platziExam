//
//  String+.swift
//  platziExam
//
//  Created by Diego Palomares on 15/06/24.
//

import Foundation

extension String {
    func parseToInt() -> Int {
        return Int(self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) ?? 1
    }
}
