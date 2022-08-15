//
//  JSONParser.swift
//  AlbumListTests
//
//  Created by Ryan Ofori on 8/12/22.
//

import Foundation
class JSONParser: NSObject {
    
    class func parse<T:Codable>(_ fileName: String, model: T.Type) -> Result<T, Error> {
        guard let filePath = Bundle(for: self).path(forResource: fileName, ofType: "json") else { return .failure(JSONTestingError.fileNotFound)}
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: filePath)) else {
            return .failure(JSONTestingError.returnEmptyData)
        }
        
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            return .success(model)
        } catch {
            return .failure(error)
        }
        
    }
}

enum JSONTestingError: Error {
    
    case fileNotFound
    case returnEmptyData
    case invalidJSON
    case parsingFailture
    
}
