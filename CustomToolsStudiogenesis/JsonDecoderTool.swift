//
//  JsonDecoderTool.swift
//  CustomToolsStudiogenesis
//
//  Created by Jorge GA-studiogenesis on 28/04/2021.
//  Copyright © 2021 Jorge GA-studiogenesis. All rights reserved.
//


public class JsonDecoderTool {
    
    public init() {
        
    }
    
    public func getJsonDecoded<T: Codable>(_ data: Data) -> T? {
        DateTools().setGlobalStartDate(id: "JSONDecoder")
        let decoder = JSONDecoder()
        do {
            let genericData = try decoder.decode(T.self, from: data)
            DateTools().setGlobalEndDate()
            return genericData
        } catch {
            print(T.self)
            print("   >>> ERROR decoder.decode - (JsonDecoder/getJsonDecoded: \(error.localizedDescription)")
            DateTools().setGlobalEndDate()
            return nil
        }
    }
}
