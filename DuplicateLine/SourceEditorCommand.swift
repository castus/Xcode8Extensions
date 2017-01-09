//
//  SourceEditorCommand.swift
//  DuplicateLine
//
//  Created by Krzysztof Romanowski on 18.06.2016.
//  Copyright © 2016 Krzysztof Romanowski. All rights reserved.
//

import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    public func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Swift.Void) {
        let buffer = invocation.buffer
        
        guard let selection = buffer.selections.firstObject as? XCSourceTextRange else {
            completionHandler(NSError(domain: "DuplicateLine", code: -1, userInfo: [NSLocalizedDescriptionKey: "No selection"]))
            return
        }
        
        let selectedRange = getSelection(forSelectedText: selection)
        let selectedLines = getSelectedLines(buffer: buffer, range: selectedRange)
        
        insert(lines: selectedLines, at: selection.start.line, for: buffer)
        
        completionHandler(nil)
    }
    
    fileprivate func getSelection(forSelectedText selectedText: XCSourceTextRange) -> CountableClosedRange<Int> {
        var selectedRange = selectedText.start.line...selectedText.end.line
        
        // For triple-click Xcode selects one additional line, we don't want to duplicate it
        let selectedRangeLength = selectedRange.distance(from: selectedRange.startIndex, to: selectedRange.endIndex)
        if selectedRangeLength > 1 && selectedText.end.column == 0 {
            selectedRange = selectedText.start.line...(selectedText.end.line - 1)
        }
        
        return selectedRange
    }
    
    fileprivate func getSelectedLines(buffer: XCSourceTextBuffer, range: CountableClosedRange<Int>) -> Array<Any> {
        var array = [Any]()
        
        for (i, index) in range.enumerated() {
            array.insert(buffer.lines[index], at: i)
        }
        
        return array
    }
    
    fileprivate func insert(lines: Array<Any>, at index: Int, for buffer: XCSourceTextBuffer) {
        for (i, line) in lines.enumerated() {
            buffer.lines.insert(line, at: index + i)
        }
    }
}
