//
//  CreditCardView.swift
//  Credit Card App
//
//  Created by Abdelrahman Shehab on 19/9/2020.
//

import SwiftUI

struct CreditCardView<Content>: View where Content: View  {
    var content: () -> Content

    var body: some View {
        content()
    }
}

struct FrontCreditCardView: View {
    let name: String
    let expired: String

    var body: some View {

        
        VStack(alignment: .leading) {

            HStack(alignment: .top) {

                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.white)

                Spacer()

                Text("VISA")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .bold()
                    .italic()
            }

            Spacer()

            Text("**** **** **** 9797")
                .font(.system(size: 25))
                .foregroundColor(.white)
                .bold()

            Spacer()

            HStack {

                VStack(alignment: .leading) {

                    Text("CARD HOLDER")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    Text(name)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }

                Spacer()

                VStack(alignment: .trailing) {

                    Text("EXPIRES")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)

                    Text(expired)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
        }
        .padding()
        .frame(width: 300, height: 200)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5481430292, green: 0, blue: 0.4720868468, alpha: 1)), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(12)
        .shadow(color: .gray, radius: 10)

    }
}

struct BackCreditCardView: View {
    let cvv: String

    var body: some View {

        VStack {

            Rectangle()
                .colorInvert()
                .frame(maxWidth: .infinity, maxHeight: 20)
                .padding([.top])

            Spacer()

            HStack {
                Text(cvv)
                    .foregroundColor(.black)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                    .padding(5)
                    .frame(width: 50, height: 20)
                    .background(Color.white)
                Spacer()
            }.padding()
        }
        .frame(width: 300, height: 200)
        .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(12)
        .padding()
        .shadow(color: .gray, radius: 10)
    }
}

struct CreditCardView_Previews: PreviewProvider {
    static var previews: some View {
        CreditCardView<FrontCreditCardView>(content: {FrontCreditCardView(name: "Abdelrhamn Shehab", expired: "06/22")})
//        CreditCardView<BackCreditCardView>(content: {
//            BackCreditCardView(cvv: "123")
//        })

    }
}
