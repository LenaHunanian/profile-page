//
//  ViewController.swift
//  profile-page
//
//  Created by Lena Hunanian on 21.06.25.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - UI Components
    
    //header section components
    let profileImageView = UIImageView()
    let nameLabel = UILabel()
    let followButton = UIButton()
    var isFollowing = false
    
    //bio section
    let bioLabel = UILabel()
    
    //statistics section
    let postsCountLabel = UILabel()
    let followerCountLabel = UILabel()
    let followingCountLabel = UILabel()
    
    //tagged posts section
    let taggedPostsButton = UIButton()
    let taggedPostsLabel = UILabel()
    
    
    let mainStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStackView()
        setupUI()
        configureStacks()
        
        
        
    }
    
    //MARK: - main stack view configuration
    func configureStackView() {
        mainStackView.axis = .vertical
        mainStackView.spacing = 24
        mainStackView.distribution = .fill
        mainStackView.alignment = .fill
        mainStackView.backgroundColor = .systemBackground
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    //MARK: - UI Components setup
    func setupUI() {
        //MARK:  profile header section elements
        //profile image view
        profileImageView.image = UIImage(named: "profilePhoto")
        profileImageView.layer.cornerRadius = 40
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        //name label
        nameLabel.text = "Lena Hunanian"
        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        nameLabel.textColor = .black
        
        //follow button
        followButton.setTitle("Follow", for: .normal)
        followButton.setTitleColor(.white, for: .normal)
        followButton.backgroundColor = .systemBlue
        followButton.layer.cornerRadius = 12
        followButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        followButton.translatesAutoresizingMaskIntoConstraints = false
        followButton.widthAnchor.constraint(equalToConstant: 110).isActive = true
        followButton.addTarget(self, action: #selector(followButtonTapped), for: .touchUpInside)
        
        
        
        
        //MARK: remember to add an action
        
        
        //MARK: bio section elements
        //bio label
        bioLabel.textColor = .black
        bioLabel.font = .systemFont(ofSize: 16, weight: .regular)
        bioLabel.text = "iOS Developer, coffee lover☕️"
        
        
        //MARK: Statistics elements
        postsCountLabel.textColor = .black
        postsCountLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        postsCountLabel.textAlignment = .center
        postsCountLabel.text = "35\nposts"
        postsCountLabel.numberOfLines = 2
        
        
        
        followerCountLabel.textColor = .black
        followerCountLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        followerCountLabel.textAlignment = .center
        followerCountLabel.text = "189\nfollowers"
        followerCountLabel.numberOfLines = 2
        
        followingCountLabel.textColor = .black
        followingCountLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        followingCountLabel.textAlignment = .center
        followingCountLabel.text = "122\nfollowing"
        followingCountLabel.numberOfLines = 2
        
        
        //MARK: tagged posts section elements
        
        //tagged posts button
        taggedPostsButton.setTitleColor(.white, for: .normal)
        taggedPostsButton.backgroundColor = .systemBlue
        taggedPostsButton.setTitle( "Show Tagged Posts", for: .normal)
        taggedPostsButton.clipsToBounds = true
        taggedPostsButton.layer.cornerRadius = 12
        taggedPostsButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        taggedPostsButton.translatesAutoresizingMaskIntoConstraints = false
        taggedPostsButton.widthAnchor.constraint(equalToConstant: 260).isActive = true
        taggedPostsButton.addTarget(self, action: #selector(taggedPostButtonTapped), for: .touchUpInside)
        
        //tagged Posts label
        taggedPostsLabel.textColor = .black
        taggedPostsLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        taggedPostsLabel.textAlignment = .center
        taggedPostsLabel.text = "Tagged posts"
        taggedPostsLabel.numberOfLines = 0
        taggedPostsLabel.isHidden = true
        
        
        
    }
    
    //MARK: - configuring and adding stacks to main stack view
    
    func configureStacks() {
        //MARK: profile header section stack
        //additional stack for profile name and follow button
        let additionalVerticalStack = UIStackView(arrangedSubviews: [nameLabel, followButton])
        additionalVerticalStack.axis = .vertical
        additionalVerticalStack.spacing = 10
        additionalVerticalStack.distribution = .fillEqually
        additionalVerticalStack.alignment = .leading
        
        //profile section (profile image + additionalVerticalStack form above)
        let profileHeaderStackView = UIStackView(arrangedSubviews: [profileImageView, additionalVerticalStack])
        profileHeaderStackView.axis = .horizontal
        profileHeaderStackView.alignment = .center
        profileHeaderStackView.spacing = 16
        profileHeaderStackView.distribution = .fill
        
        mainStackView.addArrangedSubview(profileHeaderStackView)
        
        //MARK: Bio section stack
        let bioStackView = UIStackView(arrangedSubviews: [bioLabel])
        bioStackView.axis = .vertical
        bioStackView.spacing = 10
        bioStackView.distribution = .fill
        bioStackView.alignment = .leading
        
        mainStackView.addArrangedSubview(bioStackView)
        
        
        //MARK: Statistics section stacks in one general stack view
        
        //posts count stack
        let postsStackView = UIStackView(arrangedSubviews: [postsCountLabel])
        postsStackView.axis = .vertical
        postsStackView.alignment = .center
        postsStackView.spacing = 10
        postsStackView.distribution = .fill
        
        //follower count stack
        let followerCountStack = UIStackView(arrangedSubviews: [followerCountLabel])
        followerCountStack.axis = .vertical
        followerCountStack.alignment = .center
        followerCountStack.spacing = 10
        followerCountStack.distribution = .fill
        
        //following count stack
        let followingCountStack = UIStackView(arrangedSubviews: [followingCountLabel])
        followingCountStack.axis = .vertical
        followingCountStack.alignment = .center
        followingCountStack.spacing = 10
        followingCountStack.distribution = .fill
        
        
        //general stack for statistic section stacks
        let statisticsStackView = UIStackView(arrangedSubviews: [postsStackView, followerCountStack, followingCountStack])
        statisticsStackView.axis = .horizontal
        statisticsStackView.spacing = 18
        statisticsStackView.distribution = .fillEqually
        statisticsStackView.alignment = .center
        
        mainStackView.addArrangedSubview(statisticsStackView)
        
        
        
        //MARK: Tagged post section stack
        let taggedPostsStackView = UIStackView(arrangedSubviews: [taggedPostsButton, taggedPostsLabel])
        taggedPostsStackView.axis = .vertical
        taggedPostsStackView.spacing = 12
        taggedPostsStackView.distribution = .fillEqually
        taggedPostsStackView.alignment = .center
        
        mainStackView.addArrangedSubview(taggedPostsStackView)
        
        
        
    }
    
    
    //MARK: - action for follow button
    
    @objc func followButtonTapped() {
        isFollowing.toggle()
        let newTitle = isFollowing ? "Following" : "Follow"
        let textColor = isFollowing ? UIColor.black: UIColor.white
        let newColor = isFollowing ? UIColor.systemGray3 : UIColor.systemBlue
        followButton.backgroundColor = newColor
        followButton.setTitle(newTitle, for: .normal)
        followButton.setTitleColor(textColor, for: .normal)
        
    }
    
    //MARK: - action for tagged post button
    
    @objc func taggedPostButtonTapped() {
        UIView.animate(withDuration: 0.3) {
            self.taggedPostsLabel.isHidden.toggle()
            self.view.layoutIfNeeded()
        }
        
        let newTitle = taggedPostsLabel.isHidden ? "Show Tagged Posts" :  "Hide Tagged Posts"
        taggedPostsButton.backgroundColor = taggedPostsLabel.isHidden ? UIColor.systemBlue: UIColor.systemGray3
        let textColor = taggedPostsLabel.isHidden ? UIColor.white : UIColor.black
        taggedPostsButton.setTitle(newTitle, for: .normal)
        taggedPostsButton.setTitleColor(textColor, for: .normal)
        
        
        
    }
    
}


#Preview {
    ViewController()
}
