//
//  SelfConfiguringCell.swift
//  IChat
//
//  Created by Байсангур on 14.10.2022.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure(with value: MChat)
}
