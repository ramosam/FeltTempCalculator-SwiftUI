//
//  TemperatureInputStack.swift
//  FeltTempSwiftUI
//
//  Created by Arcaurel on 2/16/20.
//  Copyright © 2020 Ramosam. All rights reserved.
//

import SwiftUI

struct TemperatureInputStack: View {
    
    @Binding var tempTextField: String
    @Binding var isWind: Bool
    @Binding var isFahrenheit: Bool
    
    var body: some View {
        VStack {
            
            Text("Enter a temperature:")
            TextField("Temperature", text: $tempTextField)
                .frame(width: 100.0, height: 24.0)
                .padding(5.0)
            
            Text("Additional settings:")
                .padding(5.0)
            HStack {
                Toggle(isOn: self.$isWind) {
                    Text(isWind ? "Wind" : "Humidity")
                    
                }
                .padding(.trailing, 5.0)
                .frame(width: 135.0)
                Toggle(isOn: self.$isFahrenheit) {
                    Text(isFahrenheit ? "Fahrenheit" : "Celsius")
                }
                .frame(width: 150.0)
            }
                
            .padding(5.0)
        }
        .padding()
        .background(Color.white.opacity(0.6))
    }
}
