//
//  ContentView.swift
//  Convertemp
//
//  Created by Keerthik Muruganandam on 8/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var intemp: Double = 32
    @State private var inunit: String = "Fahrenheit"
    @State private var outunit: String = "Celsius"
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var lcd: Double {
        if (inunit == "Fahrenheit") {
            return (intemp - 32) * (5/9) + 273.15
        } else if (inunit == "Celsius") {
            return intemp + 273.15
        } else {
            return intemp
        }
    }
    
    var outtemp: Double {
        if (outunit == "Fahrenheit") {
            return (lcd - 273.15) * (9/5) + 32
        } else if (outunit == "Celsius") {
            return lcd - 273.15
        } else {
            return lcd
        }
    }
    var body: some View {
        NavigationStack {
            Form {
                Section("Input") {
                    TextField("Temperature", value: $intemp, format: .number)
                    
                    Picker("Units:", selection: $inunit) {
                        ForEach(units, id:\.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.automatic)
                }
                
                Section("Output") {
                    Picker("Converting to:", selection: $outunit) {
                        ForEach(units, id:\.self) {
                            Text($0)
                        }
                    }
                    Text(outtemp, format: .number)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
