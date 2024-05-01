//
//  SceneDelegate.swift
//  group5Assignment4
//
//  Created by user215207 on 11/10/22.
//

import UIKit
class SceneDelegate: UIResponder, UIWindowSceneDelegate{
    var window: UIWindow?
    let itemStore = ItemStore()

    func scene( _ scene: UIScene,willConnectTo session: UISceneSession, options connectionOptions : UIScene.ConnectionOptions)
    {
        guard let _ = (scene as? UIWindowScene)
        else
        {
            return
        }
        let navController = window!.rootViewController as! UINavigationController
        let listController = navController.topViewController as! ListViewController
        listController.itemStore = itemStore
    }
    func sceneDidEnterBackground(_ scene: UIScene){
        let pass = itemStore.saveChanges()
        if pass{
            print("Data stored sucessfully ")
        }
        }


    }
    



