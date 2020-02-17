//
//  TitleView.swift
//  FeltTempSwiftUI
//
//  Created by Arcaurel on 2/16/20.
//  Copyright © 2020 Ramosam. All rights reserved.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        Text("Felt Temperature Calculator")
            .font(.title)
            .fontWeight(.bold)
            // trial and error
            .offset(y: -67)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
