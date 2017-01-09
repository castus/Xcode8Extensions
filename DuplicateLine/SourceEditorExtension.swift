//
//  SourceEditorExtension.swift
//  DuplicateLine
//
//  Created by Krzysztof Romanowski on 18.06.2016.
//  Copyright © 2016 Krzysztof Romanowski. All rights reserved.
//

import XcodeKit

class SourceEditorExtension: NSObject, XCSourceEditorExtension {
    
    func extensionDidFinishLaunching() {
        print("DuplicateLine Extension started")
    }
}
