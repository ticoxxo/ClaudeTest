//
//  NoteStore.swift
//  ClaudeTest
//
//  Created by Alberto Almeida on 17/08/26.
//
import SwiftUI

@Observable
class NoteManager {
    var store: [Note] = []

    init() {}

    init(store: [Note]) {
        self.store = store
    }

}

extension NoteManager {

    static let sampleData = [
        Note.sampleNote,
        Note(
            title: "Ideas",
            content: "New app features",
                priority: .low
            ),
        Note.sampleNoteMedium
        ]
}
