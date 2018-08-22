//
//  ClientMainMappable.swift
//  TableTester
//
//  Created by Jonathan Kartun on 21.08.18.
//  Copyright © 2018 Jonathan Kartun. All rights reserved.
//

import UIKit

    struct ClientMainMappable: Decodable {
        var id: Int?
        var name: String?

        init(id: Int, name: String) {
            self.id = id
            self.name = name
        }
        
        public init() {}
    }

