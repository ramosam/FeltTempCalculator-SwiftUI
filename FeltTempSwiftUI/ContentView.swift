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
    
    @State var isWind = true
    @State var isFahrenheit = true
    
    @State var tempTextField: String = ""
    @State var humidityTextField: String = ""
    
    @State var windSpeed: Double = 50
    private var minimumValue = 1.0
    private var maximumvalue = 100.0
    
    private var feltTempLabel = "9000"
    private var actualTempLabel = "9000"
    
    
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
                            VStack {
                                
                                Text("Enter a temperature:")
                                TextField("Temperature", text: self.$tempTextField)
                                    .frame(width: 100.0, height: 24.0)
                                    .padding(5.0)
                                Text("Additional settings:")
                                    .padding(5.0)
                                HStack {
                                    Toggle(isOn: self.$isWind) {
                                        Text(self.isWind ? "Wind" : "Humidity")
                                           
                                    }
                                    .padding(.trailing, 5.0)
                                    .frame(width: 135.0)
                                    Toggle(isOn: self.$isFahrenheit) {
                                        Text(self.isFahrenheit ? "Fahrenheit" : "Celsius")
                                    }
                                    .frame(width: 150.0)
                                }
                                .padding(5.0)
                            }
                            .padding()
                            .background(Color.white.opacity(0.6))
                            
                            // EditAndResultStack
                            VStack {
                                HStack {
                                    Text("Wind: ")
                                    Text("\(Int(self.minimumValue))")
                                    Slider(value: self.$windSpeed, in: 1...100)
                                        .frame(width: 100.0)
                                    Text("\(Int(self.maximumvalue))")
                                        .padding(.trailing)
                                    Text("\(Int(self.windSpeed))")
                                }
                                .padding(.vertical, 5.0)
                                .frame(width: 300.0, height: 24.0)

                                HStack {
                                    Text("Humidty: ")
                                    Spacer()
                                    TextField("0.01", text: self.$humidityTextField)

                                }
                                .padding(.vertical, 5.0)
                                .frame(width: 150.0, height: 24.0)
                                
                                HStack {
                                    Text("Felt Temperature: ")
                                    Text("\(self.feltTempLabel)")
                                }
                                .padding(.vertical, 5.0)
                                
                                HStack {
                                    Text("Actual Temperature: ")
                                    Text("\(self.actualTempLabel)")
                                }
                                .padding(.vertical, 5.0)
                            
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 30)
                            .background(Color.white.opacity(0.6))
                        }
                    } else {
                        // TempInputStack
                        VStack {
                            
                            Text("Enter a temperature:")
                            TextField("Temperature", text: self.$tempTextField)
                                .frame(width: 100.0, height: 24.0)
                                .padding(5.0)
                            Text("Additional settings:")
                                .padding(5.0)
                            HStack {
                                Toggle(isOn: self.$isWind) {
                                    Text(self.isWind ? "Wind" : "Humidity")
                                       
                                }
                                .padding(.trailing, 5.0)
                                .frame(width: 135.0)
                                Toggle(isOn: self.$isFahrenheit) {
                                    Text(self.isFahrenheit ? "Fahrenheit" : "Celsius")
                                }
                                .frame(width: 150.0)
                            }
                            .padding(5.0)
                        }
                        .padding()
                        .background(Color.white.opacity(0.6))
                        
                        // EditAndResultStack
                        VStack {
                            HStack {
                                Text("Wind: ")
                                Text("\(Int(self.minimumValue))")
                                Slider(value: self.$windSpeed, in: 1...100)
                                    .frame(width: 100.0)
                                Text("\(Int(self.maximumvalue))")
                                    .padding(.trailing)
                                Text("\(Int(self.windSpeed))")
                            }
                            .padding(.vertical, 5.0)
                            .frame(width: 300.0, height: 24.0)

                            HStack {
                                Text("Humidty: ")
                                Spacer()
                                TextField("0.01", text: self.$humidityTextField)

                            }
                            .padding(.vertical, 5.0)
                            .frame(width: 150.0, height: 24.0)
                            
                            HStack {
                                Text("Felt Temperature: ")
                                Text("\(self.feltTempLabel)")
                            }
                            .padding(.vertical, 5.0)
                            
                            HStack {
                                Text("Actual Temperature: ")
                                Text("\(self.actualTempLabel)")
                            }
                            .padding(.vertical, 5.0)
                        
                        }
                        .padding()
                        .background(Color.white.opacity(0.6))
                    }
                    

                
                }
            }
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
