//
//  NetworkService.swift
//  F1Standings
//
//  Created by RYAN GREENBURG on 5/30/22.
//

import Foundation

class F1NetworkService {
    private let baseURL = "http://ergast.com/api/f1"
    
    /// CRUD
    func fetchDriversStandings(completion: @escaping (DriverStandings?) -> Void) {
        guard var url = URL(string: baseURL) else {
            return
        }
        url.appendPathComponent("2022")
        url.appendPathComponent("driverStandings")
        url.appendPathExtension("json")
        print(url.absoluteString)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            
            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let topLevel = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                let driverStandings = topLevel.mrdata.standings.list.first
                completion(driverStandings)
            } catch {
                print(error)
                completion(nil)
            }
        }.resume()
    }
}
