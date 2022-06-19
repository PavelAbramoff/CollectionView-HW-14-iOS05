//
//  Model.swift
//  CollectionView-HW-14-iOS05
//
//  Created by Pavel Абрамов on 15.06.2022.
//

import UIKit

struct Models {
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case albumsCell(model: ItemOption)
}

struct ItemOption {
    let name: String
    let number: Int
    let imageName: String
}
