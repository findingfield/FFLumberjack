//
//  FFLumberjackFileManager.swift
//  FFLumberjack
//
//  Created by findingfield on 2023/5/20.
//

import Foundation
import CocoaLumberjack

class FFLumberjackFileManager: DDLogFileManagerDefault {
    
    private var bundleName: String {
        let key = "CFBundleName"
        let object = Bundle.main.object(forInfoDictionaryKey: key)
        return object as? String ?? "LogFile"
    }
    
    override var newLogFileName: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy.MM.dd-HH.mm.ss"
            let time = dateFormatter.string(from: Date())
            return "\(bundleName)-\(time).log"
        }
        set { }
    }
    
    override func isLogFile(withName fileName: String) -> Bool {
        fileName.hasPrefix(bundleName) && fileName.hasSuffix(".log")
    }
}
