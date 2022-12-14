//
//  ActiveChatCell.swift
//  IChat
//
//  Created by Байсангур on 12.10.2022.
//

import UIKit

class ActiveChatCell: UICollectionViewCell, SelfConfiguringCell {
    func configure(with value: MChat) {
        friendImageView.image = UIImage(named: value.userImageString)
        freindName.text = value.username
        lastMessage.text = value.lastMessage
    }
    
    func configure<U>(with value: U) where U : Hashable {
        print("")
    }
    
    static var reuseId: String = "ActiveChatCell"
    
    let friendImageView = UIImageView()
    let freindName = UILabel(text: "User name", font: .laoSangamMN20())
    let lastMessage = UILabel(text: "How are you?", font: .laoSangamMN18())
    let gradientView = GradientView(from: .topTrailing, to: .bottomLeading, startColor: #colorLiteral(red: 0.8309441209, green: 0.7057330012, blue: 0.9536229968, alpha: 1), endColor: #colorLiteral(red: 0.4784313725, green: 0.6980392157, blue: 0.9215686275, alpha: 1))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupConstraints()
        
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Setup constraints

extension ActiveChatCell {
    private func setupConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        freindName.translatesAutoresizingMaskIntoConstraints = false
        lastMessage.translatesAutoresizingMaskIntoConstraints = false
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        friendImageView.backgroundColor = .orange
        gradientView.backgroundColor = .black
        
        addSubview(friendImageView)
        addSubview(freindName)
        addSubview(gradientView)
        addSubview(lastMessage)
        
        NSLayoutConstraint.activate([
            friendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            friendImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            friendImageView.heightAnchor.constraint(equalToConstant: 78),
            friendImageView.widthAnchor.constraint(equalToConstant: 78)
        ])
        
        NSLayoutConstraint.activate([
            gradientView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            gradientView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            gradientView.heightAnchor.constraint(equalToConstant: 78),
            gradientView.widthAnchor.constraint(equalToConstant: 8)
        ])
        
        NSLayoutConstraint.activate([
            freindName.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            freindName.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16),
            freindName.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            lastMessage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14),
            lastMessage.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16),
            lastMessage.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 16)
        ])
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

