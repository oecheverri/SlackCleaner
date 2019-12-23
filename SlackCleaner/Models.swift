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
    
    let channelIds = [String]()
    let groupChatIds = [String]()
    let dmChatIds = [String]()
    
    init?(jsonBlob: [String : Any]) {
        guard let id: String = GetValue(from: jsonBlob, with: "id") else {
            return nil
        }
        
        guard let createdTime: String = GetValue(from:jsonBlob, with: "key") else {
            return nil
        }
        
        guard let filename: String = jsonBlob["name"] as? String else {
            return nil
        }
        
        guard let title: String = jsonBlob["title"] as? String else {
            return nil
        }
        
        guard let mimeType: String = jsonBlob["mimetype"] as? String else {
            return nil
        }
        
        guard let fileType: String = jsonBlob["filetype"] as? String else {
            
        }
        
    }
}

struct Message {
    
    let channelID: String
    let timestamp: TimeInterval
    let text: String
    
    init?(jsonBlob: [String : Any]) {
        
        guard let timestamp = TimeInterval(jsonBlob["ts"] as! String) else {
            return nil
        }
        guard let text = jsonBlob["text"] as? String else {
            return nil
        }
        guard let channelData: [String:Any] = jsonBlob["channel"] as? [String:Any] else {
            return nil
        }
        self.timestamp = timestamp
        self.text = text
        channelID = channelData["id"] as! String
    }

}

