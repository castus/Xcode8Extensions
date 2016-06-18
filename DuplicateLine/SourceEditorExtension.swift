//
//  SourceEditorExtension.swift
//  DuplicateLine
//
//  Created by Krzysztof Romanowski on 18.06.2016.
//  Copyright © 2016 Krzysztof Romanowski. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorExtension: NSObject, XCSourceEditorExtension {
    
    func extensionDidFinishLaunching() {
        print("DuplicateLine Extension started")
    }
    
    /*
    var commandDefinitions: [[XCSourceEditorCommandDefinitionKey: AnyObject]] {
        // If your extension needs to return a collection of command definitions that differs from those in its Info.plist, implement this optional property getter.
        return []
    }
    */
    
}
