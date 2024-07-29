//
//  ContentView.swift
//  Unit Conversion(D19C)
//
//  Created by Jatin Singh on 29/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var units = ["sec", "min", "hrs", "days"]
    @State private var value  = 0.0
    @State private var inputUnit : String = "sec"
    @State private var outputUnit : String = "min"
    
    @FocusState private var isValueFocused : Bool
    
    private var firstConvertion : Double {
        let firstInput : Double = value
        switch(inputUnit){
        case "sec":
            return firstInput
        case "min":
            return firstInput * 60
        case "hrs":
            return firstInput * 3600
        case "days":
            return firstInput * 3600 * 24
        default :
            return firstInput
        }
    }
    
    private var secondConversion : Double {
        let secondInput : Double = firstConvertion
        switch(outputUnit){
        case "sec":
            return secondInput
        case "min":
            return secondInput / 60
        case "hrs":
            return secondInput / 3600
        case "days":
            return secondInput / (3600 * 24)
        default :
            return secondInput
        }
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section("value"){
                    TextField("enter value here", value: $value, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isValueFocused)
                    
                }
                Section("Unit 1"){
                    Picker("input unit", selection: $inputUnit){
                        ForEach(units, id: \.self){
                            Text("\($0)")
                        }
                    }
                }
                Section("Unit 2"){
                    Picker("output unit", selection: $outputUnit){
                        ForEach(units, id: \.self){
                            Text("\($0)")
                        }
                    }
                }
                Section("result"){
                    Text(secondConversion, format: .number)
                }
                    
            }
            .navigationTitle("Unit Conversion")
            .toolbar{
                if isValueFocused {
                    Button("Done"){
                        isValueFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
