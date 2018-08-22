//
//  JSONParser.swift
//  TableTester
//
//  Created by Jonathan Kartun on 21.08.18.
//  Copyright © 2018 Jonathan Kartun. All rights reserved.
//

import UIKit

class JSONParser: NSObject {

    public static func parseJSON<T: Decodable>(typewhat: T.Type, strData: String, failed: @escaping (Error) -> Void = { _ in }) -> T? {
        let data = Data(strData.utf8)
        return parseJSON(typewhat: T.self, data: data, failed: failed)
    }

    public static func parseJSON<T: Decodable>(typewhat: T.Type, data: Data, failed: @escaping (Error) -> Void = { _ in }) -> T? {

        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(T.self, from: data)

            return result
        } catch let error {
            failed(error)
        }

        return nil
    }
}
