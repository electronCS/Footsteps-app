import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var userNameView: UIView!
    @IBOutlet var phoneNumberView: UIView!
    @IBOutlet var emailView: UIView!
    @IBOutlet var passwordView: UIView!
    @IBOutlet var confirmPasswordView: UIView!
    @IBOutlet var register: UIButton!
    @IBOutlet var registerView: UIView!
    @IBOutlet var loginView: UIView!
    
    @IBOutlet var loginPhoneNum: UIView!
    @IBOutlet var loginPass: UIView!
    @IBOutlet var loginButt: UIButton!
    
    @IBOutlet var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupView()
        let rowsViews = [userNameView, phoneNumberView, emailView, passwordView, confirmPasswordView, register, loginPhoneNum, loginPass, loginButt]
           
        for view in rowsViews {
            view?.layer.cornerRadius = 20
        }
    }
    
    
    
    //private func setupView() {
     //   let path = URL(fileURLWithPath: Bundle.main.path(forResource: "test_1", ofType: "mov")!)
     //   let player = AVPlayer(url: path)
     //   let newLayer = AVPlayerLayer(player: player)
     //   newLayer.frame = self.videoView.frame
     //   self.videoView.layer.addSublayer(newLayer)
     //   newLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
     //   player.play()
    //    player.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        
    //    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.videoDidPlayToEnd(notification:)), name: NSNotification.Name(rawValue: "AVPlayerItemDidPlayToEndTimeNotification"), object: player.currentItem)
  //  }
    

    @IBAction func playVideo(_ sender: Any) {
            // Create an AVPlayer, passing it the HTTP Live Streaming URL.
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "alan_test", ofType: "mov")!))
        
        let layer = AVPlayerLayer(player: player)
        layer.frame = CGRect(x: 125, y: 230, width: 255, height: 177)
        
        let player2 = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "alan_test", ofType: "mov")!))
        
        let layer2 = AVPlayerLayer(player: player2)
        layer.frame = CGRect(x: 125, y: 230, width: 255, height: 177)
        layer2.frame = CGRect(x: 125, y: 451, width: 255, height: 177)


        //view.layer.addSublayer(layer)
        view.layer.addSublayer(layer2)
        //player.play()
        player2.play()
    }
    
    @objc func videoDidPlayToEnd(notification: Notification)
    {
        let player: AVPlayerItem = notification.object as! AVPlayerItem
        player.seek(to: CMTime.zero)
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        registerButton.isSelected = true
        loginButton.isSelected = false

        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]

        UIView.transition(with: loginView, duration: 1.0, options: transitionOptions, animations: {
            self.loginView.isHidden = true
        })
        
        UIView.transition(with: registerView, duration: 1.0, options: transitionOptions, animations: {
            self.registerView.isHidden = false
        })
    }
    @IBAction func loginClicked(_ sender: Any) {
        registerButton.isSelected = false
        loginButton.isSelected = true
        
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        
        UIView.transition(with: registerView, duration: 1.0, options: transitionOptions, animations: {
            self.registerView.isHidden = true
        })
        
        UIView.transition(with: loginView, duration: 1.0, options: transitionOptions, animations: {
            self.loginView.isHidden = false
        })
    }
    
    @IBAction func register(_ sender: Any) {
    }
    
    func showCard() {
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        
        UIView.transition(with: registerView, duration: 1.0, options: transitionOptions, animations: {
            self.registerView.isHidden = true
        })
        
        UIView.transition(with: loginView, duration: 1.0, options: transitionOptions, animations: {
            self.loginView.isHidden = false
        })
    }
    
    @IBAction func forgotPasswordClicked(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(identifier: "forgotPass") as? ForgotPassViewController {
            present(vc, animated: true)
        }
    }
}

extension UIColor {
    convenience init(rgb: Int, alpha: CGFloat) {
        self.init(
            red: CGFloat((rgb >> 16) & 0xFF),
            green: CGFloat((rgb >> 8) & 0xFF),
            blue: CGFloat(rgb & 0xFF),
            alpha: alpha
        )
    }
}
