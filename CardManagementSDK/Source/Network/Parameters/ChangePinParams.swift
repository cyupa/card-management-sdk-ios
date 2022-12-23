//
//  ChangePinParams.swift
//  NICardManagementSDK
//
//  Created by Gabriel Cernestean on 28.10.2022.
//

import Foundation

struct ChangePinParams: Codable {
    
    var cardIdentifierId: String
    var cardIdentifierType: String
//    var cardSequenceNumber: String?
//    var cardExpiryDate: String?
    var encryptedOldPin: String
    var encryptedNewPin: String
    var encryptionMethod: String
//    var encryptionAlgorithm: String
    
    func toJson() -> [String: Any] {
        let encoder = JSONEncoder()
        do {
            let json = try encoder.encode(self)
            let dict = try JSONSerialization.jsonObject(with: json, options: []) as! [String : Any]
            return dict
        } catch {
            return [:]
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case cardIdentifierId = "card_identifier_id"
        case cardIdentifierType = "card_identifier_type"
//        case cardSequenceNumber = "card_sequence_number"
//        case cardExpiryDate = "card_expiry_date"
        case encryptedOldPin = "encrypted_old_pin"
        case encryptedNewPin = "encrypted_new_pin"
        case encryptionMethod = "encryption_method"
//        case encryptionAlgorithm = "encryption_algorithm"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.cardIdentifierId, forKey: .cardIdentifierId)
        try container.encode(self.cardIdentifierType, forKey: .cardIdentifierType)
//        try container.encode(self.cardSequenceNumber, forKey: .cardSequenceNumber)
//        try container.encode(self.cardExpiryDate, forKey: .cardExpiryDate)
        try container.encode(self.encryptedOldPin, forKey: .encryptedOldPin)
        try container.encode(self.encryptedNewPin, forKey: .encryptedNewPin)
        try container.encode(self.encryptionMethod, forKey: .encryptionMethod)
//        try container.encode(self.encryptionAlgorithm, forKey: .encryptionAlgorithm)
    }
}
