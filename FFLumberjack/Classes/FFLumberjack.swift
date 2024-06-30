//
//  FFLumberjack.swift
//  FFLumberjack
//
//  Created by findingfield on 2023/5/20.
//

import Foundation
#if canImport(CocoaLumberjackSwift)
import CocoaLumberjackSwift
#else
import CocoaLumberjack
#endif

public enum FFLumberjack {
    
    // MARK: - Defaults
    
    private static let ddlog: DDLog = {
        let ddlog = DDLog.sharedInstance
        let logFormatter = FFLumberjackFormatter()
        
        let osLogger = DDOSLogger.sharedInstance
        osLogger.logFormatter = logFormatter
        
        let fileManager = FFLumberjackFileManager()
        let fileLogger = DDFileLogger(logFileManager: fileManager)
        fileLogger.rollingFrequency = 60 * 60 * 24 // 24Hours
        fileLogger.maximumFileSize = 1024 * 1024 * 2 // 2M
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7
        fileLogger.logFormatter = logFormatter
        
        ddlog.add(osLogger)
        ddlog.add(fileLogger)
        
        #if DEBUG
        DDLogVerbose(
            "Log File Path:\n\(fileLogger.logFileManager.logsDirectory)",
            ddlog: ddlog
        )
        Self.logLevel = .all
        #else
        Self.logLevel = .debug
        #endif
        
        return ddlog
    }()
    
    // MARK: - Settings
    
    /// The log level that can dynamically limit log messages
    public static var logLevel: DDLogLevel {
        get { dynamicLogLevel }
        set { dynamicLogLevel = newValue }
    }
    
    /// If `true`, all logs (except errors) are logged asynchronously by default.
    public static var asyncLog: Bool {
        get { asyncLoggingEnabled }
        set { asyncLoggingEnabled  = newValue }
    }
    
    /// Get DDFileLogger to set rollingFrequency, maximumFileSize...
    public static var fileLogger: DDFileLogger? {
        ddlog.allLoggers.first { logger in
            logger is DDFileLogger
        } as? DDFileLogger
    }
    
    // MARK: - Logging
    
    /// Log something verbose. Log level  1
    public static func verbose(_ message: Any,
                               file: StaticString = #file,
                               function: StaticString = #function,
                               line: UInt = #line) {
        DDLogVerbose("\(message)",
                     file: file,
                     function: function,
                     line: line,
                     ddlog: ddlog)
    }
    
    /// Log something for  debugging. Log level  2
    public static func debug(_ message: Any,
                             file: StaticString = #file,
                             function: StaticString = #function,
                             line: UInt = #line) {
        DDLogDebug("\(message)",
                   file: file,
                   function: function,
                   line: line,
                   ddlog: ddlog)
    }
    
    /// Log some infomation. Log level  3
    public static func info(_ message: Any,
                            file: StaticString = #file,
                            function: StaticString = #function,
                            line: UInt = #line) {
        DDLogInfo("\(message)",
                  file: file,
                  function: function,
                  line: line,
                  ddlog: ddlog)
    }
    
    /// Log some warings. Log level  4
    public static func warn(_ message: Any,
                            file: StaticString = #file,
                            function: StaticString = #function,
                            line: UInt = #line) {
        DDLogWarn("\(message)",
                  file: file,
                  function: function,
                  line: line,
                  ddlog: ddlog)
    }
    
    /// Log some errors. Log level  5
    public static func error(_ message: Any,
                             file: StaticString = #file,
                             function: StaticString = #function,
                             line: UInt = #line) {
        DDLogError("\(message)",
                   file: file,
                   function: function,
                   line: line,
                   ddlog: ddlog)
    }
}
