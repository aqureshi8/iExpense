//
//  AddView.swift
//  iExpense
//
//  Created by Ahsan Qureshi on 3/29/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss

    @State private var name = "New Expense"
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    private let currencyCode = Locale.current.currency?.identifier ?? "USD"

    var expenses: Expenses

    let types = ["Business", "Personal"]

    var body: some View {
        Form {
            Picker("Type", selection: $type) {
                ForEach(types, id: \.self) {
                    Text($0)
                }
            }

            TextField("Amount", value: $amount, format: .currency(code: currencyCode))
                .keyboardType(.decimalPad)
        }.navigationTitle($name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
