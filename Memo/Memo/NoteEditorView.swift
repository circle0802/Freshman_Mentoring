//
//  NoteEditorView.swift
//  Memo
//
//  Created by hawon on 3/6/26.
//

import SwiftUI

// 18: 목록 기능 다음으로, 상세 편집 화면(NoteEditorView) 타입을 만들기
struct NoteEditorView: View {
    // 20: 부모 화면의 메모를 직접 수정할 수 있도록 @Binding으로 받기
    @Binding var note: String

    // 19: 상세 편집 화면 UI를 구성
    var body: some View {
        // 21: TextEditor로 메모 내용을 양방향 편집해요.
        TextEditor(text: $note)
            // 22: navigation에 제목 "메모"로 설정
            .navigationTitle("메모")
            // 23: 제목 스타일을 inline으로
            .navigationBarTitleDisplayMode(.inline)
            // 24: 입력 영역 여백을 주기
            .padding(24)
    }
}
