//
//  SourceEditorCommand.swift
//  DuplicateLine
//
//  Created by Krzysztof Romanowski on 18.06.2016.
//  Copyright © 2016 Krzysztof Romanowski. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: (NSError?) -> Void ) -> Void {
        
        let buffer = invocation.buffer
        
        guard let selection = buffer.selections.firstObject as? XCSourceTextRange else {
            completionHandler(NSError(domain: "DuplicateLine", code: -1, userInfo: [NSLocalizedDescriptionKey: "No selection"]))
            return
        }
        
        var padding = 0
        for index in selection.start.line...selection.end.line {
            buffer.lines.insert(buffer.lines[index + padding], at: selection.start.line)
            padding = padding + 1
        }
        for index in selection.start.line...selection.end.line {
            buffer.lines.insert(buffer.lines[index + padding], at: selection.start.line)
            padding = padding + 1
        }
        
        completionHandler(nil)
    }
    
}
