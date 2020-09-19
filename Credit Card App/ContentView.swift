//
//  ContentView.swift
//  Credit Card App
//
//  Created by Abdelrahman Shehab on 19/9/2020.
//

import SwiftUI

struct ContentView: View {

    init () {
//        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }

    @State private var flipped: Bool = false
    @State private var rotateDegrees: Double = 0
    @State private var  name: String = ""
    @State private var expired: String = ""
    @State private var cvv: String = ""

    var body: some View {

        NavigationView {

            VStack {

                Spacer()

                CreditCardView {
                    VStack {

                        Group {
                            if flipped {
                                BackCreditCardView(cvv: cvv)
                            } else {
                                FrontCreditCardView(name: name, expired: expired)
                            }
                        }
                    }.rotation3DEffect(
                        .degrees(rotateDegrees),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                }
                .padding(20)
                .onTapGesture(perform: {
                    withAnimation {
                        rotateDegrees += 180
                        flipped.toggle()
                    }
                })

                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .colorInvert()
                    .padding([.top, .leading, .trailing])

                TextField("Expiration", text: $expired)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .colorInvert()
                    .padding([.leading, .trailing])

                TextField("CVV", text: $cvv) { (editingChanged) in
                    withAnimation {
                        rotateDegrees += 180
                        flipped.toggle()
                    }
                } onCommit: {}
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .colorInvert()
                .padding([.leading, .trailing])

                Spacer()

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)

            .navigationBarTitle("VISA Card")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
