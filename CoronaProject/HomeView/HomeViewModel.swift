//
//  HomeViewModel.swift
//  CoronaProject
//  Created by Jaffar on 03/12/20.
//  Copyright © 2020 Jaffar. All rights reserved.
//

import UIKit

class HomeViewModel: NSObject {
    /// Getting response data from url
    /// - Parameters:
    ///     - urlString: url is stored as a String
    ///     - oncompletion: Escaping closure for completing the Decoding in Root
    ///     - onerror: Escaping closure executes if error occurs in parsing the url
    func getResponse(urlString: String,
                     oncompletion:@escaping (Root) -> Void,
                     onerror:@escaping (Error) -> Void) {
        
        guard let url = URL(string: urlString) else {return}
        let task = URLSession.shared.dataTask(with: url){(data, resonse, error)in
            guard error == nil else {return}
            guard let dat = data else {return}
            do {
                let content = try JSONDecoder().decode(Root.self, from: dat)
                oncompletion(content)
            } catch {
                onerror(error)
                print(error)
            }
        }
        task.resume()
        
    }
    
}
