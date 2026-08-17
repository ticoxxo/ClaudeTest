//
//  ContentView.swift
//  ClaudeTest
//
//  Created by Alberto Almeida on 17/08/26.
//

import SwiftUI

struct ContentView: View {

    @State private var noteManager = NoteManager(store: NoteManager.sampleData)

    @State private var showingNewNote = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Header with status indicator
                HStack {
                    Text("My Notes")
                        .font(.title)
                        .fontWeight(.bold)

                    Spacer()

                    // Status indicator with proper accessibility
                    Circle()
                        .fill(noteManager.store.isEmpty ? Color.green : Color.red)
                        .frame(width: 12, height: 12)
                        .accessibilityLabel("Status indicator")
                        .accessibilityValue(noteManager.store.isEmpty ? "No notes" : "Active notes")
                        .accessibilityHint("Shows whether the note list contains active items")
                }
                .padding()
                .background(Color(.systemGray6))

                // Notes list
                List {
                    ForEach(noteManager.store, id: \.id) { note in
                        NoteRowView(note: note)
                            // ACCESSIBILITY ISSUE #2: No accessibility container
                    }
                }
                .listStyle(.plain)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    // Add button with proper accessibility
                    Button(action: { showingNewNote = true }) {
                        Image(systemName: "plus")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                    .frame(width: 44, height: 44)  // Minimum 44x44 touch target
                    .accessibilityLabel("Add new note")
                    .accessibilityHint("Double tap to create a new note")
                    .accessibilityIdentifier("add-note-button")
                }
            }
        }
        .sheet(isPresented: $showingNewNote) {
            NewNoteView(noteManager: noteManager)
        }
    }
}







enum NotePriority {
    case high, medium, low
}

#Preview {
    ContentView()
}
