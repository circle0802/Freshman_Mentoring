//
//  NoteEditorView.swift
//  Memo
//
//  Created by hawon on 3/6/26.
//

import SwiftUI

struct NoteEditorView: View {
    @Binding var note: String

    var body: some View {
        TextEditor(text: $note)
            .navigationTitle("메모")
            .navigationBarTitleDisplayMode(.inline)
            .padding(24)
    }
}
