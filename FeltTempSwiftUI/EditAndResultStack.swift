//
//  EditAndResultStack.swift
//  FeltTempSwiftUI
//
//  Created by Arcaurel on 2/16/20.
//  Copyright © 2020 Ramosam. All rights reserved.
//

import SwiftUI

struct EditAndResultStack: View {
    
    var isWind: Bool
    @Binding var windSpeed: Double
    let minimumValue: Double
    let maximumValue: Double
    
    @Binding var humidityTextField: String
    var feltTemp: String
    var actualTemp: String
    
    var isCompact: Bool
    
    
    var body: some View {
        

        
        VStack {
            if self.isWind {
                HStack {
                    Text("Wind: ")
                    Text("\(Int(minimumValue))")
                    Slider(value: self.$windSpeed, in: minimumValue...maximumValue)
                        
                    Text("\(Int(maximumValue))")
                        .padding(.trailing)
                    Text("\(Int(windSpeed))")
                }
                .padding(10)
                .frame(height: 24.0)
            } else {
                HStack {
                    Text("Humidty: ")
                    TextField("0.01", text: self.$humidityTextField)
                }
                .padding(10)
                .padding(.leading, 80)
                .frame(width: 300, height: 24)
            }
            
            HStack {
                Text("Felt Temperature: ")
                Text(String(format: "%.1f", feltTemp))
            }
            .padding(10)
            
            HStack {
                Text("Actual Temperature: ")
                Text(String(format: "%.1f", actualTemp))
            }
            .padding(10)
        }
        .frame(width: 335, height: 190)
        .background(Color.white.opacity(0.6))
        .keyboardResponsive()
    }
}

//
//struct EditAndResultStack_Previews: PreviewProvider {
//    static var previews: some View {
//        EditAndResultStack()
//    }
//}
