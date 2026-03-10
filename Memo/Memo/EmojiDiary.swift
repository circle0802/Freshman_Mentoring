import SwiftUI

struct DiaryEntry: Identifiable {
    let id = UUID()
    let emoji: String
    let text: String
    let date = Date()
}

struct ContentView: View {

    @State private var selectedEmoji = "😀"
    @State private var text = ""
    @State private var entries: [DiaryEntry] = []

    let emojis = ["😀", "🙂", "😐", "😢", "😡"]

    var body: some View {
        NavigationView {
            List {
                // 기분 선택 섹션
                Section("오늘의 기분") {
                    HStack(spacing: 12) {
                        ForEach(emojis, id: \.self) { emoji in
                            Text(emoji)
                                .font(.largeTitle)
                                .scaleEffect(selectedEmoji == emoji ? 1.3 : 1.0)
                                .animation(.spring(response: 0.3), value: selectedEmoji)
                                .onTapGesture {
                                    selectedEmoji = emoji
                                }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 4)
                }

                // 일기 입력 섹션
                Section("오늘 있었던 일") {
                    TextField("적어보세요...", text: $text, axis: .vertical)
                        .lineLimit(4, reservesSpace: true)
                }

                // 저장 버튼
                Section {
                    Button(action: saveEntry) {
                        Label("저장하기", systemImage: "checkmark.circle.fill")
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(text.isEmpty ? .gray : .blue)
                    }
                    .disabled(text.isEmpty)
                }

                // 기록 섹션
                if !entries.isEmpty {
                    Section("기록") {
                        ForEach(entries.reversed()) { entry in
                            HStack(spacing: 12) {
                                Text(entry.emoji)
                                    .font(.title2)
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(entry.text)
                                        .lineLimit(2)
                                    Text(entry.date.formatted(date: .abbreviated, time: .shortened))
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .padding(.vertical, 2)
                        }
                        .onDelete { entries.remove(atOffsets: $0) }
                    }
                }
            }
            .navigationTitle("Emoji Diary")
            .navigationBarTitleDisplayMode(.large)
        }
    }

    func saveEntry() {
        entries.append(DiaryEntry(emoji: selectedEmoji, text: text))
        text = ""
    }
}
