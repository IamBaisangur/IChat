//
//  ActiveChatCell.swift
//  IChat
//
//  Created by Байсангур on 12.10.2022.
//

import UIKit

protocol SelfConfiguringCell {
    static var reuseId: String {get}
    func configure(with value: MChat)
}

class ActiveChatCell: UICollectionViewCell, SelfConfiguringCell {
    static var reuseId: String = "ActiveChatCell"
    
    let freindImageView = UIImageView()
    let freindName = UILabel(text: "User name", font: .laoSangamMN20())
    let lastMessage = UILabel(text: "How are you?", font: .laoSangamMN18())
    let gradientView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    private func setupConstraints() {
        freindImageView.translatesAutoresizingMaskIntoConstraints = false
        freindName.translatesAutoresizingMaskIntoConstraints = false
        lastMessage.translatesAutoresizingMaskIntoConstraints = false
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        freindImageView.backgroundColor = .blue
        
        addSubview(freindImageView)
        
        NSLayoutConstraint.activate([
            freindImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            freindImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            freindImageView.heightAnchor.constraint(equalToConstant: 78),
            freindImageView.widthAnchor.constraint(equalToConstant: 78)
        ])
        
    }
    
    func configure(with value: MChat) {
        print("123")
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - SwiftUI

import SwiftUI

struct ActiveChatProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let activeChatController = MainTabBarController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return activeChatController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}

