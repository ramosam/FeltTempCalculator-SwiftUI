//
//  AboutView.swift
//  FeltTempSwiftUI
//
//  Created by Arcaurel on 2/16/20.
//  Copyright © 2020 Ramosam. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("Welcome to the Felt Temperature Calculator")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            Text("This calculator expects a temperature and based upon the choice of wind or humidity, displays what the temperature feels like.")
                .padding()
            Text("The temperature of 70 degrees Fahrenheit is the splitter where temperatures below 70 are affected by wind.  Temperatures of 70 or greater are affected by the Humidity.")
                .padding()
            Spacer()
            Text("Created by Alicia Ramos")
                .font(.caption)
                .padding()
                
            
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
