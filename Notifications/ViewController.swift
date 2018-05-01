//
//  ViewController.swift
//  Notifications
//
//  Created by Matt on 01.05.18.
//  Copyright © 2018 Matt. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    //MARK: Properties
    let launchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Launch Me", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.361648667, green: 0.7734983405, blue: 0.9776014686, alpha: 1)
        button.addTarget(self, action: #selector(launchNotification), for: .touchUpInside)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        return button
    }()
    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(launchButton)
        setup()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert])
        { (success, error) in
            if success {
                print("Permission Granted")
                self.launchButton.isUserInteractionEnabled = true
            } else {
                print("There was a problem!")
                self.launchButton.isUserInteractionEnabled = false
            }
        }
    }

    @objc func launchNotification() {
        let notification = UNMutableNotificationContent()
        notification.title = "Achieve your daily goal"
//        notification.subtitle = "Are you setteled for more action?"
        notification.body = "Do 15 push-ups!"
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false) //go back to homescreen to see the notification
        let request = UNNotificationRequest(identifier: "notification1", content: notification, trigger: notificationTrigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    private func setup() {
        launchButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        launchButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        launchButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        launchButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    


}

