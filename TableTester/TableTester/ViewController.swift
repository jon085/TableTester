//
//  ViewController.swift
//  TableTester
//
//  Created by Jonathan Kartun on 21.08.18.
//  Copyright © 2018 Jonathan Kartun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var netMan: NetworkManager!
    override func viewDidLoad() {
        super.viewDidLoad()

        netMan = NetworkManager(url: "http://www.google.com")

        completionHandlerDownloadTest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func completionHandlerDownloadTest() {
        netMan.downloadJSON(typewhat: ClientMainMappable.self, action: { [weak self] (decodableResult) in
            guard let strongSelf = self, let decodableResult = decodableResult else { return }
            strongSelf.populateClientData(clientData: decodableResult)
        }) { (err) in
            print("WE GOT AN ERROR>>> \(err)")
        }
    }

    func jsonParseTest() {
        let result = "{\"id\":123, \"name\":\"JONO\"}"
        if let x = JSONParser.parseJSON(typewhat: ClientMainMappable.self, strData: result) {
            print(x)
        }
    }

    //MARK: - Population Helpers
    func populateClientData(clientData: ClientMainMappable) {
        print("ID: \(String(describing: clientData.id))")
        print("NAME: \(String(describing: clientData.name))")
    }
}
