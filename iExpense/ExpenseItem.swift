//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Ahsan Qureshi on 3/28/24.
//

import ULID

struct ExpenseItem : Identifiable, Codable {
    var id = ULID()
    let name: String
    let type: String
    let amount: Double
}
