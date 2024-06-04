//
//  ContentView.swift
//  Unity
//
//  Created by Anushka Mathur on 04/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var input: Double = 0.0
    @State private var inputUnit: Dimension = UnitLength.centimeters
    @State private var outputUnit: Dimension = UnitLength.meters
    
    @State private var selectedType: Int = 0 //by default length
    
    let conversionTypes: [String] = ["Length", "Temperature", "Volume", "Time", ]
    
    var unitsOfMeasurement: [[Dimension]] {
        let lengthUnits: [UnitLength] = [.centimeters, .decameters, .decimeters, .fathoms, .feet, .furlongs, .hectometers, .inches, .megameters, .micrometers, .millimeters, .picometers, .parsecs, .yards, .kilometers, .lightyears]
        let tempUnits: [UnitTemperature] = [.celsius, .fahrenheit, .kelvin]
        let volUnits: [UnitVolume] = [.gallons, .liters, .milliliters, .cubicMeters, .cubicCentimeters]
        let timeUnit: [UnitDuration] = [.hours,.microseconds,.milliseconds,.minutes,.seconds,.picoseconds]
        return[
            lengthUnits,
            tempUnits,
            volUnits,
            timeUnit
        ]
    }
    
    var result: String {
         let inputValue  = Measurement(value: input, unit: inputUnit)
         let outputValue = inputValue.converted(to: outputUnit)
         return outputValue.formatted()
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Amount To Convert"){
                    TextField("Amount", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                }
                Section{
                    unitPicker(title: "Convert From Unit", selectedUnits: $inputUnit)
                    unitPicker(title: "Convert To Unit", selectedUnits: $outputUnit)
                }
                Section("Result"){
                    Text("\(result)")
                }
                
                
                    Picker("Category", selection: $selectedType){
                        ForEach(0..<conversionTypes.count, id: \.self){
                            Text(conversionTypes[$0])
                        }
                    }.pickerStyle(.wheel)
                    .frame(height: 170)
                
            }
        .navigationTitle("Unity")
        }
    }
    private func unitPicker(title: String, selectedUnits: Binding<Dimension>) -> some View{
        
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        
        
        return Picker(title, selection: selectedUnits){
            ForEach(unitsOfMeasurement[selectedType], id: \.self){
                Text(formatter.string(from: $0).capitalized)
            }
        }.pickerStyle(.navigationLink)
    }
}

#Preview {
    ContentView()
}
