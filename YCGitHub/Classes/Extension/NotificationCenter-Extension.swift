//
//  NotificationCenter-Extension.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/2.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation

extension NSNotification.Name {
    public struct UserNotification {
        public static let DidCancel = Notification.Name(rawValue: "org.youukastation.notification.name.task.didCancel")
    }
}

extension Notification {
    /// Used as a namespace for all `Notification` user info dictionary keys.
    public struct Key {
        /// User info dictionary key representing the `URLSessionTask` associated with the notification.
        public static let Task = "org.youukastation.notification.key.task"
    }
}
