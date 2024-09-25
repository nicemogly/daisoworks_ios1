//
//  daisoworks_ios1
//
//  Created by AD2201016P02 on 9/25/24.
//

import SwiftUI

struct ContentView: View {
    @State private var id: String = ""
    @State private var password: String = ""
    @State private var isCheck = false
    
    var body: some View {
        VStack {
            
            // 이메일 입력
            TextField(
                "Email",
                text: $id
            )
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
            .textInputAutocapitalization(.never)
            .background(Color(red: 249/255, green: 245/255, blue: 244/255))
            .frame(width: 280, height: 40)
            .cornerRadius(7)

            // 비밀번호 입력
            SecureField(
                "Password",
                text: $password
            )
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
            .textInputAutocapitalization(.never)
            .background(Color(red: 249/255, green: 245/255, blue: 244/255))
            .frame(width: 280, height: 40)
            .cornerRadius(7)


            // 로그인 버튼
            Button(action: {}, label: {
                Text("Sign in")
                    .foregroundColor(.white)
                    .frame(width: 280, height: 40)
                    .background(Color.blue)
                    .cornerRadius(5)
            })
            HStack {
                checkBoxView(isCheck: true, checkSize: 17, backgroundSize: 20)
                Text("로그인 상태 유지")
                Spacer()
            }.frame(width: 280)
        }
    }
}

struct checkBoxView: View {
    @State var isCheck: Bool
    let checkColor: Color
    let backgroungColor: Color
    let checkSize : CGFloat
    let conerRadius: CGFloat
    let backgroundSize: CGFloat
    
    init(isCheck: Bool, checkColor: Color = Color.white, backgroundColor: Color = Color(.lightGray), checkSize: CGFloat = 12.5, conerRadius: CGFloat = 5, backgroundSize: CGFloat = 15) {
        self.isCheck = isCheck
        self.checkColor = checkColor
        self.backgroungColor = backgroundColor
        self.checkSize = checkSize
        self.conerRadius = conerRadius
        self.backgroundSize = backgroundSize
    }
    
    var body: some View {
        Button(action: {isCheck = !isCheck}, label: {
            if(isCheck) {
                ZStack(alignment: .center, content: {
                    RoundedRectangle(
                        cornerRadius: conerRadius)
                        .fill(backgroungColor)
                        .frame(width: backgroundSize, height: backgroundSize)
                    Image(systemName: "checkmark").foregroundStyle(checkColor).font(.system(size: checkSize))
                })
            } else {
                RoundedRectangle(
                    cornerRadius: conerRadius)
                    .strokeBorder(lineWidth: 0.2)
                    .foregroundStyle(Color.black)
                    .frame(width: backgroundSize, height: backgroundSize)
            }
        })
    }
}
