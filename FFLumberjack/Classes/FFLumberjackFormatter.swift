//
//  FFLumberjackFormatter.swift
//  FFLumberjack
//
//  Created by findingfield on 2023/5/20.
//

import Foundation
import CocoaLumberjack

class FFLumberjackFormatter: NSObject, DDLogFormatter {
    
    func format(message logMessage: DDLogMessage) -> String? {
        let date = dateFormatter.string(from: logMessage.timestamp)
        let name = logMessage.file.components(separatedBy: "/")
            .last?.components(separatedBy: ".").first ?? ""
        let file = name.isEmpty ? "" : " \(name)"
        let line = logMessage.line > 0 ? " \(logMessage.line)" : ""
        let text = "\(date)\(file)\(line): \(logMessage.message)"
        return text
    }
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd-HH:mm:ss:SSS"
        return dateFormatter
    }()
}
