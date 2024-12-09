//
//  RipeningStagingView.swift
//  P11-Avocados
//
//  Created by Yuriy Gudimov on 09.12.24.
//

import SwiftUI

struct RipeningStagingView: View {
    let ripeningStages = ripeningData
    
    var body: some View {
        ScrollView(.horizontal) {
            VStack {
                Spacer()
                HStack(alignment: .center, spacing: 25) {
                    ForEach(ripeningStages) { ripening in
                        RipeningView(ripening: ripening)
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 25)
                Spacer()
            }
        }
        .scrollIndicators(.hidden)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    RipeningStagingView()
}
