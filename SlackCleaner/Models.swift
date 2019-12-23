//
//  Models.swift
//  SlackCleaner
//
//  Created by Oscar Echeverri on 2019-12-20.
//

import Foundation


func GetValue<T>(from dict:[String: Any], with key: String)-> T? {
    guard let returnValue = dict[key] as? T else {
        print("Couldn't retrieve value of type \(T.self) with key: \(key)")
        return nil
    }
    return returnValue
}

struct User {
    var username: String
    var userId: String
    var teamName: String
    var teamId: String
    var token: String
    
    init?(jsonBlob: [String : Any], token: String) {
        guard let username: String = GetValue(from: jsonBlob, with: "user") else {
            return nil
        }
        
        guard let userId: String = GetValue(from: jsonBlob, with: "user_id") else {
            return nil
        }
        
        guard let teamName: String = GetValue(from: jsonBlob, with: "team") else {
            return nil
        }
        
        guard let teamId: String = GetValue(from: jsonBlob, with: "team_id") else {
            return nil
        }
        
        self.token = token
        self.username = username
        self.userId = userId
        self.teamName = teamName
        self.teamId = teamId
    }
}

struct File {
    let id: String
    let createdTime: TimeInterval
    let filename: String
    let title: String
    let mimeType: String
    let fileType: String
    
    let userId: String
    let size: Int
    
    let privateUrl: URL
    let privateDownloadUrl: URL
    let permalink: URL
    let publicPermalink: URL
    
    let channelIds: [String]
    let groupChatIds: [String]
    let dmChatIds: [String]
    
    init?(jsonBlob: [String : Any]) {
        guard let id: String = GetValue(from: jsonBlob, with: "id") else {
            return nil
        }
        
        guard let createdTime: String = GetValue(from:jsonBlob, with: "key") else {
            return nil
        }
        
        guard let filename: String = GetValue(from: jsonBlob, with:"name") else {
            return nil
        }
        
        guard let title: String = GetValue(from: jsonBlob, with:"title") else {
            return nil
        }
        
        guard let mimeType: String = GetValue(from: jsonBlob, with: "mimetype") else {
            return nil
        }
        
        guard let fileType: String = GetValue(from: jsonBlob, with:"filetype") else {
            return nil
        }
        
        guard let userId: String = GetValue(from: jsonBlob, with: "user") else {
            return nil
        }
        
        guard let size: Int = GetValue(from: jsonBlob, with: "size") else {
            return nil
        }
        
        guard let privateUrlString: String = GetValue(from: jsonBlob, with: "url_private") else {
            return nil
        }
        
        guard let privateDownloadUrlString: String = GetValue(from: jsonBlob, with: "url_private_download") else {
            return nil
        }
        
        guard let permalink: String = GetValue(from: jsonBlob, with: "permalink") else {
            return nil
        }
        
        guard let publicPermalink: String = GetValue(from: jsonBlob, with: "permalink_public") else {
            return nil
        }
        
        guard let channelIds: [String] = GetValue(from: jsonBlob, with: "channels") else {
            return nil
        }
        
        guard let groupChatIds: [String] = GetValue(from: jsonBlob, with: "groups") else {
            return nil
        }
        
        guard let dmChatIds: [String] = GetValue(from: jsonBlob, with: "ims") else {
            return nil
        }
        
        self.id = id
        self.createdTime = TimeInterval(createdTime)!
        self.filename = filename
        self.title = title
        self.mimeType = mimeType
        self.fileType = fileType
        self.userId = userId
        self.size = size
        self.privateUrl = URL(string: privateUrlString)!
        self.privateDownloadUrl = URL(string: privateDownloadUrlString)!
        self.permalink = URL(string: permalink)!
        self.publicPermalink = URL(string: publicPermalink)!
        self.channelIds = channelIds
        self.groupChatIds = groupChatIds
        self.dmChatIds = dmChatIds
    }
        
        
        
}

struct Message {
    
    let channelID: String
    let timestamp: TimeInterval
    let text: String
    
    init?(jsonBlob: [String : Any]) {
        
        guard let timestamp:String = GetValue(from: jsonBlob, with: "ts") else {
            return nil
        }
        guard let text:String = GetValue(from: jsonBlob, with: "text") else {
            return nil
        }
        guard let channelData: [String:Any] = GetValue(from: jsonBlob, with: "channel") else {
            return nil
        }
        
        guard let channelID: String = GetValue(from: channelData, with: "id") else {
            return nil
        }
        
        self.timestamp = TimeInterval(timestamp)!
        self.text = text
        self.channelID = channelID
    }

}

