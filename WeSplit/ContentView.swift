//
//  ContentView.swift
//  WeSplit
//
//  Created by abulhashim on 15/09/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var amountOfTip = 5
    
    let tipAmounts = [50,100,200,300,500,0]
    
    // Claculating the total Per Person:
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipAmounts[amountOfTip])
        let orderAmount = Double(checkAmount) ?? 0
        
        let grandTotal = orderAmount + tipSelection
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }

    var body: some View {
        NavigationView {
            Form {
                // Reading text from User:
                Section {
                    TextField("Enter Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    // Creating Pickers in a Form:
                    Picker("Number of People", selection: $numberOfPeople){
                        ForEach(2 ..< 30) {
                            Text("\($0) People")
                        }
                    }
                }
                // Adding Semented Control for Tip:
                
                Section(header: Text("How much tip do you wanna leave?")) {
                    Picker("Tip", selection: $amountOfTip){
                        ForEach(0 ..< tipAmounts.count) {
                            Text("\(self.tipAmounts[$0])")
                        }
                    } .pickerStyle(SegmentedPickerStyle())
                }
                // Returning the total Per Person:
                Section {
                    Text("Amount Per Person is: \(totalPerPerson, specifier: "%.2f") Rs")
                }
                
            }
            .navigationBarTitle(Text("WeSplit"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
