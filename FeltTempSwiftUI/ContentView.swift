//
//  ContentView.swift
//  FeltTempSwiftUI
//
//  Created by Arcaurel on 2/5/20.
//  Copyright © 2020 Ramosam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.horizontalSizeClass) var sizeClass
    
    
    @State private var isWind = true
    @State private var isFahrenheit = true
    
    @State private var tempTextField: String = ""
    @State private var humidityTextField: String = ""
    
    @State private var windSpeed: Double = 50
    private var minimumValue = 1.0
    private var maximumValue = 100.0
    
    private var feltTempLabel = ""
    private var actualTempLabel = ""
    
    func calcTemp() -> (actualTemp: Double, feltTemp: Double) {
        if tempTextField == "" { return (0, 0) }
        let (actualTemp, feltTemp) = FeltTempCalculator.calculateFeltTemp(temp: Double(tempTextField)!, isFahrenheit: isFahrenheit, isWind: isWind, windSpeed: windSpeed, humidity: Double(humidityTextField))
        return (actualTemp, feltTemp)
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                // Background Image
                Image("clouds")
                    .edgesIgnoringSafeArea(.all)

                // Overall Layout
                VStack {
                    // Title
                    Text("Felt Temperature Calculator")
                        .font(.title)
                        .fontWeight(.bold)
                        // trial and error
                        .offset(y: -67)
                    
                    if !(self.sizeClass == .compact) {
                        HStack {
                            // TempInputStack
                            TemperatureInputStack(tempTextField: self.$tempTextField, isWind: self.$isWind, isFahrenheit: self.$isFahrenheit)
                                .keyboardResponsive()
                                
                            
                            // EditAndResultStack
                            EditAndResultStack(isWind: self.isWind,
                                               windSpeed: self.$windSpeed,
                                               minimumValue: self.minimumValue,
                                               maximumValue: self.maximumValue,
                                               humidityTextField: self.$humidityTextField,
                                               feltTemp: "\(self.calcTemp().feltTemp)",
                                                actualTemp: "\(self.calcTemp().actualTemp)",
                                isCompact: false
                            )
                                
                        }
                    } else {
                        VStack {
                            // TempInputStack
                           TemperatureInputStack(tempTextField: self.$tempTextField, isWind: self.$isWind, isFahrenheit: self.$isFahrenheit)

                           // EditAndResultStack
                            EditAndResultStack(isWind: self.isWind,
                                              windSpeed: self.$windSpeed,
                                              minimumValue: self.minimumValue,
                                              maximumValue: self.maximumValue,
                                              humidityTextField: self.$humidityTextField,
                                              feltTemp: "\(self.calcTemp().feltTemp)",
                                               actualTemp: "\(self.calcTemp().actualTemp)",
                                isCompact: true
                           )
                               
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
//        .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
//        .previewDisplayName("iPhone 8")
    }
}
