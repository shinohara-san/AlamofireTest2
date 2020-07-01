//
//  Country.swift
//  AlamofireTest2
//
//  Created by Yuki Shinohara on 2020/07/01.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import Foundation

struct Country: Decodable {
    var name: String?
    var capital: String?
    var countryCode: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case capital = "capital"
        case countryCode = "alpha3Code" //case structでの名前 = データのvalue名
    }
}
