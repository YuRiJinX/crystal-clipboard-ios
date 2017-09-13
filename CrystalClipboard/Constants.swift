//
//  Constants.swift
//  CrystalClipboard
//
//  Created by Justin Mazzocchi on 8/23/17.
//  Copyright © 2017 Justin Mazzocchi. All rights reserved.
//

import Foundation
import Keys

enum Environment: String {
    
    // MARK: Cases
    
    case staging, production
}

extension Environment {
    
    // MARK: Internal computed properties
    
    var host: String {
        switch self {
        case .staging: return "staging.crystalclipboard.com"
        case .production: return "crystalclipboard.com"
        }
    }
    
    var baseURL: URL {
        return URL(string: "https://\(host)")!
    }
    
    var apiURL: URL {
        return baseURL.appendingPathComponent("/api/v1")
    }
    
    var cableURL: URL {
        return URL(string: "wss://\(host)/cable")!
    }
    
    var adminToken: String {
        switch self {
        case .staging: return Environment.keys.crystalClipboardStagingAdminAuthToken
        case .production: return Environment.keys.crystalClipboardProductionAdminAuthToken
        }
    }
}

private extension Environment {
    
    // MARK: Private constants
    
    private static let keys = CrystalClipboardKeys()
}

struct Constants {
    
    // MARK: Internal constants
    
    static let environment = Environment(rawValue: Bundle.main.infoDictionary!["com.jzzocc.crystal-clipboard.environment"] as! String)!
    static let keychainService = "com.jzzocc.crystal-clipboard"
    static let iso8601DateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // Apple's ISO8601DateFormatter can only do milliseconds on iOS 11
    static let clipboardChannelIdentifier = "{\"channel\":\"ClipboardChannel\"}"
}
