//
//  HeavyTableView.swift
//  SwiftUIMedicionApp
//
//  Created by Vincenzo Tipacti Moran on 16/12/25.
//

import SwiftUI

struct HeavyTableView: View {
    var itemCount = 50
    
    var body: some View {
        List {
            ForEach(0..<itemCount, id: \.self) { item in
                HStack {
                    Text("Item \(item)")
                    Spacer()
                    Text("\(computeValue(for: item))")
                        .foregroundStyle(.gray)
                }
            }
        }
    }
    
    func computeValue(for n: Int) -> Int {
        return (1...50).reduce(0) { $0 + ($1 * n) }
    }
}

#Preview {
    return HeavyTableView()
}
