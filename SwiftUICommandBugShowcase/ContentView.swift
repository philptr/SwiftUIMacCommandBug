//
//  ContentView.swift
//  SwiftUICommandBugShowcase
//
//  Created by Phil Zakharchenko on 12/22/24.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: SwiftUICommandBugShowcaseDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}
