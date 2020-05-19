//
//  NewsListRouter.swift
//  Clean_news_app
//
//  Created by daniel on 18/05/20.
//  Copyright (c) 2020 Daniel. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol NewsListRoutingLogic
{
    func routeToWebView(segue: UIStoryboardSegue?)
}

protocol NewsListDataPassing
{
    var dataStore: NewsListDataStore? { get }
}

class NewsListRouter: NSObject, NewsListRoutingLogic, NewsListDataPassing
{
    weak var viewController: NewsListViewController?
    var dataStore: NewsListDataStore?
    
    // MARK: Routing
    
    func routeToWebView(segue: UIStoryboardSegue?)
    {
        if let segue = segue {
            let destinationVC = segue.destination as! WebViewViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToWebView(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "WebViewViewController") as! WebViewViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToWebView(source: dataStore!, destination: &destinationDS)
            navigateToWebView(source: viewController!, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    
    func navigateToWebView(source: NewsListViewController, destination: WebViewViewController)
    {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToWebView(source: NewsListDataStore, destination: inout WebViewDataStore)
    {
        destination.url = source.selectedArticle?.url ?? ("")
    }
}