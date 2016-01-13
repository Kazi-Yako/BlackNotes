//
//  ShareViewController.swift
//  BlackNotesShareExt
//
//  Created by Brian Douglas on 1/13/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

import UIKit
import Social
import Firebase

class ShareViewController: SLComposeServiceViewController {
  
    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
        let text = contentText
        let notesRef = Firebase(url:"https://blacknotes.firebaseio.com/testUser/notes")
        let note = ["title": "Created note", "body":"\(text)"]
      
        notesRef.childByAutoId().setValue(note)
      
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
        self.extensionContext!.completeRequestReturningItems([], completionHandler: nil)
    }

    override func configurationItems() -> [AnyObject]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }
}
