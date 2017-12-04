//
//  Card.swift
//  Gem Code
//
//  Created by Emre Özdil on 03/12/2017.
//  Copyright © 2017 Emre Özdil. All rights reserved.
//

import UIKit

struct ProgrammingLanguage: Decodable {
    
    var training: Episodes?
    var firstStep: Episodes?
    var controlStructures: Episodes?
}

struct Episodes: Decodable{
    let episodes: [Cards]?
}

struct Cards: Decodable {
    
    let cards: [Card]?
    
    static func fetchProgrammingLanguage(_ completionHandler: @escaping (ProgrammingLanguage) -> ()) {
        
        let urlString = "https://web.itu.edu.tr/ozdile/python.json"
        
        URLSession.shared.dataTask(with: URL(string: urlString)!, completionHandler: { (data, response, error) -> Void in
            
            guard let data = data else { return }
            
            if let error = error {
                print(error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let language = try decoder.decode(ProgrammingLanguage.self, from: data)
                print(language)
                
                DispatchQueue.main.async(execute: { () -> Void in
                    completionHandler(language)
                })
                
            } catch let err {
                print(err)
            }
            
        }) .resume()
        
    }
}

struct Card: Decodable {
    
    var description: String?
    var type: String?
    var text: String?
    var header: String?
    var code: String?
    var result: String?
    var answers: [String]?
    var correctAnswerIndex: Int?
}

