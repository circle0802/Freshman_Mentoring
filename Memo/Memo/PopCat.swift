//
//  PopCat.swift
//  Memo
//
//  Created by hawon on 3/8/26.
//
import SwiftUI

struct PopCat: View {
    @State private var isOpen: Bool = false
    @State private var count: Int = 0
    @State var backgroundColor: Color = .clear

    var body: some View {
        VStack {
            Spacer()
            Text("\(count)")
                .font(.largeTitle)
            Image(isOpen ? "popCatOpen" : "popCatOff")
                .onTapGesture {
                    backgroundColor = Color(
                        red: Double.random(in: 0...1),
                        green: Double.random(in: 0...1),
                        blue: Double.random(in: 0...1)
                    )
                    count += 1
                    isOpen = true
                    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
                        isOpen = false
                    }
                }
            Spacer()
        }.background(backgroundColor)
    }
}

#Preview {
    PopCat()
}
