//
//  Albums.swift
//  networkingPart3
//
//  Created by Evgenii Kutasov on 15.03.2023.
//

import Foundation
 

// MARK: - Album
struct Album: Codable { // создли структуру
    let userID, id: Int?  // константы имени и идентификатора
    let title: String? // заголовок

    enum CodingKeys: String, CodingKey { // перечисление с именем и ключем
        case userID = "userId"
        case id, title
    }
}

typealias Albums = [Album] // назначили имя другое


