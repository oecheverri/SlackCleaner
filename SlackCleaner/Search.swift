//
//  Search.swift
//  SlackCleaner
//
//  Created by Oscar Echeverri on 2019-12-20.
//

import Foundation

class Search {
    
    let user: User
    
    init(for user: User) {
        self.user = user
    }

    func FindMyMessages(onOrBefore date: Date, callback: @escaping ([Message]) -> Void) -> Void {
        let messageSearch = SearchMessages(user: user)
    
        var messages = [Message]()
        messageSearch.EnqueueRequest(page: nil) { (response: Response) in
            
        }
        
    }
    
    
}

fileprivate class SearchMessages : SlackEndpoint {
    
    let user: User
    var url: URL {
        return URL(string: "https://slack.com/api/search.messages?token=\(user.token)&query=from:@\(user.userId)&sort=timestamp&sort_dir=asc")!
    }
    
    init(user: User) {
        self.user = user
    }
    
    
}
