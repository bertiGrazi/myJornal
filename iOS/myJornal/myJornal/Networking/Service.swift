//
//  Service.swift
//  myJornal
//
//  Created by Grazielli Berti on 26/03/22.
//

import Foundation
import UIKit

class Service: NSObject {
    static let shared = Service()
    
    func fetchPost(completion: @escaping (Result<[Post], Error>) -> ()) {
        guard let url = URL(string: "http://localhost:1337/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { data, resp, err in
            DispatchQueue.main.async {
                if let err = err {
                    print("Failed to fetch posts: ", err)
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    completion(.success(posts))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    func createPost(title: String, body: String, completion: @escaping (Error?) -> ()) {
        guard let url = URL(string: "http://localhost:1337/post") else { return }
        
        var urlRequeste = URLRequest(url: url)
        urlRequeste.httpMethod = "POST"
        
        
        let param = ["title": title, "postBody": body]
        do {
            let data = try JSONSerialization.data(withJSONObject: param, options: .init())
            
            urlRequeste.httpBody = data
            urlRequeste.setValue("application/json", forHTTPHeaderField: "content-type")
            
            
            URLSession.shared.dataTask(with: urlRequeste) { data, resp, err in
                guard let data = data else { return }
                completion(nil)
                
            }.resume()
        } catch {
            completion(error)
        }
    }
}
