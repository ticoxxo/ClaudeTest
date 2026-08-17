//
//  Note.swift
//  ClaudeTest
//
//  Created by Alberto Almeida on 17/08/26.
//

import Foundation

struct Note: Identifiable {
    let id = UUID()
    let title: String
    let content: AttributedString
    let priority: NotePriority
}


extension Note {
    static let sampleNote = Note(
        title: "Meeting",
        content: "Si",
        priority: .high
    )
    
    static let sampleNoteMedium = Note(
        title: "Shopping",
        content: "Milk, egg, bread",
        priority: .medium
    )
}
