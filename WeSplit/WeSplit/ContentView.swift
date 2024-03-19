//
//  ContentView.swift
//  WeSplit
//
//  Created by Zain Ilyas on 19/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var CheckAmount = 0.0
    @State private var numofpeople = 2
    @State private var tipPercentage = 20
    let tippercentages = [10,20,25,30]
    var totalperpeople: Double {
        let peoplecount = Double (numofpeople + 2 )
        let tipselection = Double (tipPercentage)
        
        let tipvalue = CheckAmount / 100 * tipselection
        let grandtotal = CheckAmount + tipvalue
        let perperson = grandtotal / peoplecount
        return perperson
    }
    var body: some View {
        NavigationView {
            Form{
                Section{
                    TextField("Amount", value: $CheckAmount, format: .currency(code: Locale.current.currencyCode ?? "USD") ).keyboardType(.decimalPad)
                    Picker("Number Of People", selection: $numofpeople){
                        ForEach (2..<100){
                            Text("\($0) People ")
                        }
                    }
                }
                        Section{
                            Picker("Amount of Tip", selection: $tipPercentage){
                                ForEach (tippercentages, id: \.self){
                                    Text($0 , format: .percent)
                                }
                            }
                            .pickerStyle(.segmented)
                            
                        }
                    header: {
                        Text("What percentage you like to have")
                    }
                        Section{
                            Text(totalperpeople, format: .currency(code:  Locale.current.currency?.identifier ?? "USD") )
                        }
                    }
                    
                    .navigationTitle("WeSplit")
                }
            }
        }
    

        
        #Preview {
            ContentView()
        }
    
