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
    
    @State private var showWindHumidityChanged = false
    @State private var calcHistory = [(actualTemp: Double, feltTemp: Double)]()
    
    func calcTemp() -> (actualTemp: Double, feltTemp: Double) {
        if tempTextField == "" { return (0, 0) }
        let (actualTemp, feltTemp) = FeltTempCalculator.calculateFeltTemp(temp: Double(tempTextField)!, isFahrenheit: isFahrenheit, isWind: isWind, windSpeed: windSpeed, humidity: Double(humidityTextField))
        calcHistory.append((actualTemp, feltTemp))
        return (actualTemp, feltTemp)
    }
    
    var body: some View {
        
        
        if sizeClass == .compact {
            // portrait
            return AnyView(ZStack {

                
                NavigationView {

                    VStack {
                        // TempInputStack
                        TemperatureInputStack(tempTextField: self.$tempTextField, isWind: self.$isWind, isFahrenheit: self.$isFahrenheit)
                        
                        
                        // EditAndResultStack
                        EditAndResultStack(isWind: self.isWind,  windSpeed: self.$windSpeed, minimumValue: self.minimumValue,  maximumValue: self.maximumValue,  humidityTextField: self.$humidityTextField, feltTemp: "\(self.calcTemp().feltTemp)", actualTemp: "\(self.calcTemp().actualTemp)", isCompact: (sizeClass == .compact)
                        )
                        NavigationLink(destination: CalcHistoryView(historyList: calcHistory)) {
                            Text("History")
                        }.buttonStyle(DefaultButtonStyle())
                            .padding()
                        Spacer()
                        NavigationLink(destination: AboutView()) {
                            Text("About")
                        }.buttonStyle(DefaultButtonStyle())
                        .padding()
                        
                        
                    }
                .navigationBarTitle("FeltTemp Calculator")
                }
                
                }
            )
        } else {
            // landscape
            return AnyView(ZStack {

                
                    VStack {
                        HStack {
                            // TempInputStack
                            TemperatureInputStack(tempTextField: self.$tempTextField, isWind: self.$isWind, isFahrenheit: self.$isFahrenheit)
                                .keyboardResponsive()
                            
                            
                            // EditAndResultStack
                            EditAndResultStack(isWind: self.isWind, windSpeed: self.$windSpeed, minimumValue: self.minimumValue, maximumValue: self.maximumValue, humidityTextField: self.$humidityTextField, feltTemp: "\(self.calcTemp().feltTemp)", actualTemp: "\(self.calcTemp().actualTemp)",  isCompact: (sizeClass == .compact)
                            )
                            
                        }
                        
                    }
                   
                
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

