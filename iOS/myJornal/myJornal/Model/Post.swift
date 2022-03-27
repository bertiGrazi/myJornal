//
//  Post.swift
//  myJornal
//
//  Created by Grazielli Berti on 26/03/22.
//

import Foundation

struct Post: Decodable {
    let id: Int
    let title: String
    let body: String
}
