//
//  Controls.swift
//  WeatherApp
//
//  Created by Tatenda Kabike on 2019/11/30.
//  Copyright © 2019 Tatenda Kabike. All rights reserved.


import Foundation
import UIKit

class Controls {
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CREATING A VIEW
    //----------------------------------------------------------------
    
    static func theView() -> UIView {
        
        let inputsContainerView: UIView = {
            
            let view = UIView()
            view.backgroundColor = UIColor.white
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = 0
            view.layer.masksToBounds = true
            
            return view
        }()
        
        return inputsContainerView
    }
   
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CREATING GENERAL BUTTON
    //----------------------------------------------------------------
    
    static func theButton(title: String) -> UIButton {
        
        let button = UIButton(type: .system)
        let loginRegisterButton: UIButton = {
            
            button.backgroundColor = UIColor.white
            button.setTitle(title, for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitleColor(UIColor.white, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            
            //          button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
            
            return button
        }()
        
        return loginRegisterButton
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CREATING A LABEL
    //----------------------------------------------------------------
    
    static func theTextField(placeholder: String) -> UITextField {
        
        let textField: UITextField = {
            
            let tf = UITextField()
            tf.placeholder = placeholder
            tf.translatesAutoresizingMaskIntoConstraints = false
            
            return tf
        }()
        
        return textField
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CREATING LABEL
    //----------------------------------------------------------------
    
    static func theLabel(title: String, fontSize: CGFloat, fontType: String, fontColor: UIColor) -> UILabel {
        
        let label: UILabel = {
            
            let lb = UILabel()
            lb.translatesAutoresizingMaskIntoConstraints = false
            lb.font = UIFont(name: Constants.montserrat_regular, size: fontSize)
            lb.textColor = fontColor
            lb.text = title
            
            return lb
        }()
        
        return label
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:-CREATE IMAGE VIEW
    //----------------------------------------------------------------
    
    static func theImageView(imageName: String) -> UIImageView {
        
        let profileImageView: UIImageView = {
            
            let imageView = UIImageView()
            imageView.image = UIImage(named: imageName)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleToFill
            imageView.isUserInteractionEnabled = true
            
            return imageView
        }()
        
        return profileImageView
    }
    
    //----------------------------------------------------------------
    
    
    
    
    
   
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CREATE STACK VIEW
    //----------------------------------------------------------------
    
    static func theHorizontalStackView(buttons: [AnyObject]) -> UIStackView{
        
        let stackView = UIStackView(arrangedSubviews: buttons as! [UIView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }
    
    
    //----------------------------------------------------------------\
    
    
}

