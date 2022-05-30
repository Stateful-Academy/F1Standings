//
//  StandingsList.swift
//  F1Standings
//
//  Created by RYAN GREENBURG on 5/30/22.
//

import Foundation

struct TopLevelDictionary: Decodable {
    enum CodingKeys: String, CodingKey {
        case mrdata = "MRData"
    }
    let mrdata: ResponseDetails
}

struct ResponseDetails: Decodable {
    enum CodingKeys: String, CodingKey {
        case standings = "StandingTable"
    }
    let standings: Standings
}

struct Standings: Decodable {
    enum CodingKeys: String, CodingKey {
        case list = "StandingsLists"
    }
    let list: [DriverStandings]
}

struct DriverStandings: Decodable {
    enum CodingKeys: String, CodingKey {
        case season
        case round
        case drivers = "DriverStandings"
    }
    let season: String
    let round: String
    let drivers: [Driver]
}

struct Driver: Decodable {
    enum CodingKeys: String, CodingKey {
        case position
        case points
        case driverDetails = "Driver"
        case constructors = "Constructors"
    }
    let position: String
    let points: String
    let driverDetails: DriverDetails
    let constructors: [Constructor]
}

struct DriverDetails: Decodable {
    let givenName: String
    let familyName: String
    let nationality: String
}

struct Constructor: Decodable {
    let name: String
}
