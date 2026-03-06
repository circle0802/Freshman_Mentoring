//
//  ContentView.swift
//  Memo
//
//  Created by hawon on 3/6/26.
//

import SwiftUI

struct ContentView: View {
    @State private var notes: [String] = []
    @State private var path: [Int] = []

    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(notes.indices, id: \.self) { index in
                    NavigationLink(value: index) {
                        Text(notes[index].isEmpty ? "새 메모" : notes[index])
                            .lineLimit(1)
                    }
                }
                .onDelete(perform: deleteNotes)
            }
            .navigationTitle("메모")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        notes.insert("", at: 0)
                        path.append(0)
                    } label: {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("메모 추가")
                }
            }
            .navigationDestination(for: Int.self) { index in
                NoteEditorView(note: $notes[index])
            }
        }
    }

    private func deleteNotes(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}

