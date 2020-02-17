//
//  TemperatureInputStack.swift
//  FeltTempSwiftUI
//
//  Created by Arcaurel on 2/16/20.
//  Copyright © 2020 Ramosam. All rights reserved.
//

import SwiftUI

struct TemperatureInputStack: View {
    
    @State private var showingAlert = false
    
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
//                Button(isWind ? "Wind" : "Humidity") {
//                    self.showingAlert = true
//
//                }
                Button(action: {
                    self.showingAlert = true
                    self.isWind = !self.isWind
                }) {
                    Text(isWind ? "Wind" : "Humidity")
                }
                .buttonStyle(DefaultButtonStyle())
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Settings Changed!"), message: Text(isWind ? "Changed to Wind" : "Changed to Humidity"), dismissButton: .default(Text("Great")))
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
