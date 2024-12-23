# SwiftUIMacCommandBug

A sample application to showcase the SwiftUI Command bug in a macOS Document-based app

This issue is reproducible on macOS 15.2 (24C101) and has been reported to Apple (FB16145855).

Steps to Reproduce:
1. Create a document-based SwiftUI lifecycle application via an Xcode template.
2. Add `Commands` that replace either `CommandGroupPlacement.newItem` or `CommandGroupPlacement.saveItem`.
3. Build and observe the incorrect appearance of the File menu.

## `CommandGroupPlacement.newItem`

![CommandGroupPlacement.newItem bug](./images/newItem.png)

- This will replace the New Item menu item, and completely get rid of the Open menu item.
- It will also append an empty disabled `NSMenuItem` to the end of the menu.
- Note: this `NSMenuItem` title is typically indicative of initializing an `NSMenuItem` using the initializer with no arguments and not providing a valid title. Appears this menu item is abandoned and not updated from the default values at all. 

## `CommandGroupPlacement.saveItem`

![CommandGroupPlacement.saveItem bug](./images/saveItem.png)

- This will not actually replace the Save menu item.
- Instead, it will get rid of the Save menu item, replace it with an empty disabled `NSMenuItem`, and append the Open Folder (the sample) item to the end of the menu.

Blog post: https://philz.blog/swiftuis-handling-of-the-mac-menu-bar-is-still-pretty-bad/
