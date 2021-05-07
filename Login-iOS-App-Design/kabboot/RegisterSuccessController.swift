//
//  RegisterSuccessController.swift
//  kabboot
//
//  Created by Cindy Rong on 3/5/21.
//

import SwiftUI

import UIKit

class RegisterSuccessController: UIViewController {
    @IBOutlet var emailView: UIView!
    
    @IBOutlet var resetPassButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailView.layer.cornerRadius = 20
        resetPassButton.layer.cornerRadius = 10
    }

}
