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
                    Slider(value: self.$windSpeed, in: 1...100)
                        .frame(width: 100.0)
                    Text("\(Int(maximumValue))")
                        .padding(.trailing)
                    Text("\(Int(windSpeed))")
                }
                .padding(.vertical, 5.0)
                .frame(width: 300.0, height: 24.0)
            } else {
                HStack {
                    Text("Humidty: ")
                    Spacer()
                    TextField("0.01", text: self.$humidityTextField)
                    
                }
                .padding(.vertical, 5.0)
                    
                .frame(width: 150.0, height: 24.0)
            }
            HStack {
                Text("Felt Temperature: ")
                Text(String(format: "%.1f", feltTemp))
            }
            .padding(.vertical, 5.0)
            
            HStack {
                Text("Actual Temperature: ")
                Text(String(format: "%.1f", actualTemp))
            }
            .padding(.vertical, 5.0)
        }
        .frame(width: isCompact ? 350 : 335)
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
