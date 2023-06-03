//
//  ToastEnums.swift
//  TestTraderProject
//
//  Created by admin on 20/5/23.
//

import Foundation
import SwiftUI

enum ToastEnumStyle {
    case error
    case warning
    case success
    case info
}

extension ToastEnumStyle {
    var themeColor: Color {
        switch self {
        case .error: return Color.red
        case .warning: return Color.orange
        case .info: return Color.blue
        case .success: return Color.green
        }
    }
    
    var iconFileName: String {
        switch self {
        case .info: return "info.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .success: return "checkmark.circle.fill"
        case .error: return "xmark.circle.fill"
        }
    }
}

struct ToastModel: Equatable {
    var type: ToastEnumStyle
    var title: String
    var message: String
    var duration: Double = 3
}
