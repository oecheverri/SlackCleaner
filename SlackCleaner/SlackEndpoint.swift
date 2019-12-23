//
//  SlackEndpoint.swift
//  SlackCleaner
//
//  Created by Oscar Echeverri on 2019-12-20.
//

import Foundation
enum Response {
    case Success([String:Any])
    case Error(String)
}
protocol SlackEndpoint {
    var url: URL {get}
}

extension SlackEndpoint {
    func EnqueueRequest(page: Int?, callback: @escaping (_ response: Response) -> Void) {
        
        var comps = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        if let page = page {
            comps!.queryItems?.append(URLQueryItem(name: "page", value: String(page)))
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            do {
                let jsonData = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                callback(Response.Success(jsonData))
            } catch {
                callback(Response.Error("Error serializing response"))
            }
        }
        
        dataTask.resume();
    }
}
