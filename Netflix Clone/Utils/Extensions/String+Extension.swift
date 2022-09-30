//
//  String+Extension.swift
//  Netflix Clone
//
//  Created by Haydar Demir on 30.09.2022.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
