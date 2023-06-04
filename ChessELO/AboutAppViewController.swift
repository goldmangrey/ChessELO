//
//  AboutAppViewController.swift
//  ChessELO
//
//  Created by Yeskendir on 03.06.2023.
//

import UIKit

class AboutAppViewController: UIViewController {

    @IBOutlet weak var ig: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewSetUpUI()
        igSetUpUI()
        tgSetUpUI()
    }
    
    private func textViewSetUpUI(){
        textView.backgroundColor = .clear
    }
    private func igSetUpUI(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageIGTapped(tapGestureRecognizer:)))
        ig.isUserInteractionEnabled = true
        ig.addGestureRecognizer(tapGestureRecognizer)
    }
    private func tgSetUpUI(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTGTapped(tapGestureRecognizer:)))
        tg.isUserInteractionEnabled = true
        tg.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageIGTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
//        let tappedImage = tapGestureRecognizer.view as! UIImageView

        let Username =  "goldmangrey" // Your Instagram Username here
        let appURL = URL(string: "instagram://user?username=\(Username)")!
        let application = UIApplication.shared

        if application.canOpenURL(appURL) {
            application.open(appURL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            let webURL = URL(string: "https://instagram.com/\(Username)")!
            application.open(webURL)
        }
        
    }
    
    @objc func imageTGTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let Username =  "goldmangrey" // Your Instagram Username here
        let application = UIApplication.shared
//        let tappedImage = tapGestureRecognizer.view as! UIImageView
        let chatURL = URL.init(string: "tg://resolve?domain=goldmangrey")

        if UIApplication.shared.canOpenURL(chatURL!) {
            UIApplication.shared.openURL(chatURL!)
        } else {
          // Telegram is not installed.
            let webURL = URL(string: "https://t.me/\(Username)")!
            application.open(webURL)
        }    }
}
