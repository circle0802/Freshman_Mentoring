//
//  ContentView.swift
//  Memo
//
//  Created by hawon on 3/6/26.
//
//
//import SwiftUI
//
//// 1: 먼저 앱의 메인 목록 화면(ContentView)부터
//struct ContentView: View {
//    // 4: 화면에 필요한 핵심 데이터(메모 목록 상태)를 먼저 정의
//    @State private var notes: [String] = []
//    // 5: 다음으로 화면 이동을 제어할 네비게이션 상태(path)를 준비
//    @State private var path: [Int] = []
//
//    // 2: 그다음 body에서 UI 뼈대를 만들기 시작
//    var body: some View {
//        // 25: 목록 화면와 편집 화면 이동을 위해 NavigationStack을 감싸기
//        NavigationStack(path: $path) {
//            // 6: 메인 화면의 중심 UI인 메모 리스트를 배치
//            List {
//                // 7: 메모 배열을 순회하면서 목록 행 만들기
//                ForEach(notes.indices, id: \.self) { index in
//                    // 26: 각 행을 탭하면 상세 편집 화면으로 갈 수 있게 NavigationLink를 붙이기
//                    NavigationLink(value: index) {
//                        // 8: 목록에 보여줄 텍스트 규칙(비어 있으면 "새 메모") 추가
//                        Text(notes[index].isEmpty ? "새 메모" : notes[index])
//                            // 9: 목록 가독성을 위해 한 줄 표시 제한
//                            .lineLimit(1)
//                    }
//                }
//                // 30: 삭제를 연결
//                .onDelete(perform: deleteNotes)
//            }
//            // 10: 네비게이션 제목을 설정
//            .navigationTitle("메모")
//            // 11: 생성 기능을 위해 상단 툴바를 추가
//            .toolbar {
//                // 12: 우상단에 추가 버튼 배치
//                ToolbarItem(placement: .topBarTrailing) {
//                    // 13: "+" 버튼 동작을 구현
//                    Button {
//                        // 14: 새 메모를 먼저 데이터에 추가하고,
//                        notes.insert("", at: 0)
//                        // 15: 바로 편집하도록 해당 메모 상세 화면으로 이동
//                        path.append(0)
//                    } label: {
//                        // 16: 버튼 모양은 시스템 plus 아이콘을 사용
//                        Image(systemName: "plus")
//                    }
//                    // 17: 레이블을 추가
//                    .accessibilityLabel("메모 추가")
//                }
//            }
//            // 27: NoteEditorView를 만든 뒤, 여기서 상세 화면 라우팅을 연결
//            .navigationDestination(for: Int.self) { index in
//                // 28: 선택된 메모를 바인딩으로 넘겨서 상세 화면에서 직접 수정 가능하게 하기
//                NoteEditorView(note: $notes[index])
//            }
//        }
//    }
//
//    // 29: 삭제 기능에 필요한 실제 데이터 처리 함수 생성
//    private func deleteNotes(at offsets: IndexSet) {
//        notes.remove(atOffsets: offsets)
//    }
//}
//
//// 3: Xcode Preview로 빠르게 확인
//#Preview {
//    ContentView()
//}
