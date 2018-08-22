//
//  NetworkManager.swift
//  TableTester
//
//  Created by Jonathan Kartun on 21.08.18.
//  Copyright © 2018 Jonathan Kartun. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {

    let url: String!

    public init(url: String) {
        self.url = url
    }

    func downloadJSON<T: Decodable>(typewhat: T.Type, action: @escaping (T?) -> Void, failed: @escaping (Error) -> Void = { _ in }) {
        guard let url = URL(string: self.url) else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                guard let result = JSONParser.parseJSON(typewhat: typewhat, data: data, failed: { (err) in
                    failed(err)
                }) else { return }

                action(result)
            } else {
                if let error = error {
                    failed(error)
                } else {
                    failed(NSError(domain: "Other Error", code: 101, userInfo: nil) as Error)
                }
            }
        }
        task.resume()
    }
}
