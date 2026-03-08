//
//  PopCat.swift
//  Memo
//
//  Created by hawon on 3/8/26.
//
import SwiftUI

// 1: 똑같이 구조체 생성하기
struct PopCat: View {
    // 6: 팝캣의 상태 정의하기
    @State var isOpen: Bool = false
    // 9: 배경화면 색 정의하기
    @State var backgroundColor: Color = .clear
    // 11: 팝캣 누른 숫자 카운트 정의
    @State var count: Int = 0

    // 2: body 생성하기
    var body: some View {
        // 3: stack을 이용하여 layout 잡기
        VStack {
            
            // 15: 더 예쁜 UI를 위해 배경 꽉 채우기
            Spacer()

            // 13: 팝캣 머리 위에 count 하기
            Text("\(count)")
                .font(.largeTitle)
            // 4: 이미지 생성하기
            Image(isOpen ? "popCatOpen" : "popCatOff")
                // 5: 이미지를 눌렀을 때 어떤 일이 발생하는지
                .onTapGesture {
                    // 7: Image가 눌렸을 때 isOpen true 처리 입 열기
                    isOpen = true
                    // 8: 0.1초간 true 유지 후 다시 false로 입 다물기
                    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
                        isOpen = false
                    }
                    // 10: 배경화면 색 랜덤 돌리기
                    backgroundColor = Color(
                        red: Double.random(in: 0...1),
                        green: Double.random(in: 0...1),
                        blue: Double.random(in: 0...1)
                    )
                    // 12: Image 눌렀을 때마다 count+1 하기
                    count += 1
                }

            // 16: 더 예쁜 UI를 위해 배경 꽉 채우기
            Spacer()
        }
        // 14: 아까 정의해둔 배경색 적용하기
        .background(backgroundColor)
    }
}

// 이건 기본이라 순서 안할게용 body 생성할 때 같이 생성하시길
#Preview {
    PopCat()
}
