//
//  ExpenseGroup.swift
//  SplitIt
//
//  Created by Ahkar Hein on 11/9/26.
//

import Foundation

struct ExpenseGroup: Identifiable {
    let id = UUID()
    var name: String
    var members: [String]
}
