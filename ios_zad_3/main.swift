//
//  main.swift
//  ios_zad_3
//
//  Created by Karol Chojnacki on 21/01/2019.
//  Copyright © 2019 Karol Chojnacki. All rights reserved.
//

import Foundation
typealias Codable = Decodable & Encodable

struct BankAccount: Codable {
    let name: String
    let id: String
    let accountNumber: String
    enum CodingKeys: String, CodingKey{
        case id = "bankId"
        case name = "bankName"
        case accountNumber
    }
}

struct UserData: Codable {
    let userName: String
    let userId: Int
    let bankAccount: BankAccount
    enum CodingKeys: String, CodingKey{
        case bankAccount
        case userName
        case userId
    }
}

struct Account: Codable{
    let userData: UserData
    enum CodingKeys: String, CodingKey{
        case userData
    }
}

let obj = Account(userData: UserData(userName: "NameExample", userId: 12341234, bankAccount: BankAccount(name: "ExampleName", id: "ExampleId", accountNumber: "12341234")))

let jsonData = try! JSONEncoder().encode(obj)
let jsonString = String(data: jsonData, encoding: .utf8)!
let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
do {
    let jsonData = try encoder.encode(obj)
    if let jsonString = String(data: jsonData, encoding: .utf8) {
        print(jsonString)
    }
} catch {
    print(error.localizedDescription)
}
