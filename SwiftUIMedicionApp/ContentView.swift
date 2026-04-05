//
//  ContentView.swift
//  SwiftUIMedicionApp
//
//  Created by Vincenzo Tipacti Moran on 16/12/25.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var isFocused: Bool
    @State var presentView = false
    @State var elementsCount = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Medición App")
                    .font(Font.largeTitle.weight(.bold))
                Spacer()
                VStack {
                    TextField("Ingrese el número de elementos", text: $elementsCount)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .padding()
                        .focused($isFocused)
                    
                    NavigationLink(destination: HeavyTableView(itemCount: Int(elementsCount) ?? 1)) {
                        Text("Vista de tabla")
                            .foregroundStyle(.white)
                            .bold()
                            .padding(8)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                    
                    NavigationLink(destination: ContinuousAnimationView(itemCount: Int(elementsCount) ?? 1)) {
                        Text("Animación continua")
                            .foregroundStyle(.white)
                            .bold()
                            .padding(8)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
                .padding()
                Spacer()
            }
            .padding()
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onTapGesture {
            isFocused = false
        }.animation(.default, value: isFocused)
    }
}

#Preview {
    ContentView()
}
