//
//  ContinuousAnimationView.swift
//  SwiftUIMedicionApp
//
//  Created by Vincenzo Tipacti Moran on 16/12/25.
//

import SwiftUI

struct ContinuousAnimationView: View {
    @State private var rotate = false
    var itemCount = 50
    let maxColumns = 6
    let rowSpacing: CGFloat = 12
    
    var body: some View {
        let rows = max(0, (itemCount + maxColumns - 1) / maxColumns)
        
        ScrollView {
            LazyVStack(alignment: .center, spacing: rowSpacing) {
                ForEach(Array(0..<rows), id: \.self) { r in
                    let remaining = itemCount - (r * maxColumns)
                    let columns = max(0, min(remaining, maxColumns))
                    
                    LazyHStack(spacing: 5) {
                        ForEach(Array(0..<columns), id: \.self) { _ in
                            Image(systemName: "gear")
                                .font(.largeTitle)
                                .rotationEffect(.degrees(rotate ? 360 : 0))
                                .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: rotate)
                                .onAppear { rotate = true }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    ContinuousAnimationView()
}

