//
//  Models.swift
//  ApiAsyncAwait
//
//  Created by admin on 15/5/23.
//

import Foundation

struct Quote: Codable {
//    var quote_id: Int //We can't write like id, it is failed, couse Json problem from server
//    var quote: String
//    var author: String
//    var series: String
    
    var quote_id: Int
    var breed: String
    var country: String
    var origin: String
    var coat: String
    var pattern: String
}
