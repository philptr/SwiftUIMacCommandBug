//
//  SwiftUICommandBugShowcaseApp.swift
//  SwiftUICommandBugShowcase
//
//  Created by Phil Zakharchenko on 12/22/24.
//

import SwiftUI

@main
struct SwiftUICommandBugShowcaseApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: SwiftUICommandBugShowcaseDocument()) { file in
            ContentView(document: file.$document)
        }
        .commands {
            FolderCommandsReplacingNewItem()
            // FolderCommandsReplacingSaveItem()
        }
    }
}

/// This will replace the New Item menu item, and completely get rid of the Open menu item.
/// It will also append an empty disabled `NSMenuItem` to the end of the menu.
struct FolderCommandsReplacingNewItem: Commands {
    var body: some Commands {
        CommandGroup(replacing: .newItem) {
            Button("Open Folder…") {
                print("Open Folder…")
            }
            .keyboardShortcut("O", modifiers: [.command, .option])
        }
    }
}

/// This will not actually replace the Save menu item.
/// Instead, it will get rid of the Save menu item, replace it with an empty disabled `NSMenuItem`, and append the Open Folder item to the end of the menu.
struct FolderCommandsReplacingSaveItem: Commands {
    var body: some Commands {
        CommandGroup(replacing: .saveItem) {
            Button("Open Folder…") {
                print("Open Folder…")
            }
            .keyboardShortcut("O", modifiers: [.command, .option])
        }
    }
}
