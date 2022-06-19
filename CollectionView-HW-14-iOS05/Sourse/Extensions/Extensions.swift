//
//  Extensions.swift
//  CollectionView-HW-14-iOS05
//
//  Created by Pavel Абрамов on 15.06.2022.
//

import UIKit

extension MainViewController {
    
    func configureSections() {
        
        models.append(Models(options: [
            
            .albumsCell(model: ItemOption(
                            name: "Недавние",
                            number: 67,
                            imageName: "image1"
            )),
            .albumsCell(model: ItemOption(
                            name: "Достопримечательности",
                            number: 3,
                            imageName: "image4"
            )),
            .albumsCell(model: ItemOption(
                            name: "Рассветы",
                            number: 4,
                            imageName: "image5"
            )),
            .albumsCell(model: ItemOption(
                            name: "Цветы",
                            number: 2,
                            imageName: "image6"
            )),
            .albumsCell(model: ItemOption(
                            name: "Растения",
                            number: 2,
                            imageName: "image7"
            ))
        ]))
        
       models.append(Models(options: [
            
            .albumsCell(model: ItemOption(
                            name: "Природа",
                            number: 0,
                            imageName: "image2"
            )),
            .albumsCell(model: ItemOption(
                            name: "Места",
                            number: 16,
                            imageName: "image3"
            ))
        ]))
        
    }
}

