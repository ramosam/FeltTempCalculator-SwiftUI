//
//  CalcHistoryView.swift
//  FeltTempSwiftUI
//
//  Created by Arcaurel on 2/16/20.
//  Copyright © 2020 Ramosam. All rights reserved.
//

import SwiftUI

struct CalcHistoryView: View {
    
    var historyList: [(actualTemp: Double, feltTemp: Double)]
    
    var body: some View {
        List {
            ForEach(0 ..< historyList.count) { tempSet in
                HStack {
                    Text("Actual Temp: \(self.historyList[tempSet].actualTemp, specifier: "%g")")
                    Text("Felt Temp: \(self.historyList[tempSet].feltTemp, specifier: "%g")")
                }
            }
        }
    }
}

struct CalcHistoryView_Previews: PreviewProvider {
    
    static var previews: some View {
        CalcHistoryView(historyList: [(actualTemp: 10, feltTemp: 20)])
    }
}
