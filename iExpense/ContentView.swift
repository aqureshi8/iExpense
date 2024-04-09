//
//  ContentView.swift
//  iExpense
//
//  Created by Ahsan Qureshi on 3/27/24.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var path = NavigationPath()

    private let currencyCode = Locale.current.currency?.identifier ?? "USD"

    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("Personal Expenses") {
                    ForEach(expenses.items) { item in
                        if (item.type == "Personal") {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                Spacer()
                                Text(item.amount, format: .currency(code: currencyCode))
                            }
                            .foregroundColor(amountColor(amount: item.amount))
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                
                Section("Business Expenses") {
                    ForEach(expenses.items) { item in
                        if (item.type == "Business") {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                Spacer()
                                Text(item.amount, format: .currency(code: currencyCode))
                            }
                            .foregroundColor(amountColor(amount: item.amount))
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                NavigationLink("Add Expense") {
                    AddView(expenses: expenses)
                        .navigationBarBackButtonHidden()
                }
            }
            .navigationTitle("iExpense")
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func amountColor(amount: Double) -> Color {
        if (amount < 10.0) {
            return .green
        } else if (amount < 100) {
            return .yellow
        } else {
            return .red
        }
    }
}

#Preview {
    ContentView()
}
