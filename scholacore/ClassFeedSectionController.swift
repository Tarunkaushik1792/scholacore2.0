//
//  ClassFeedSectionController.swift
//  scholacore
//
//  Created by Tarun kaushik on 29/05/17.
//  Copyright © 2017 Tarun kaushik. All rights reserved.
//

import UIKit
import IGListKit
import Reusable

class ClassFeedSectionController: IGListSectionController {
    var post:Post?
    var firstFeed : UIViewController?
    override init() {
        super.init()
    }
}

extension ClassFeedSectionController:IGListSectionType{
    
    func numberOfItems() -> Int {
        return 1
    }
    
    
    func sizeForItem(at index: Int) -> CGSize {
        if post?.postType != nil{
            return CGSize(width:(self.viewController?.view.frame.width)!,height:150)
        }
        return CGSize(width:(self.viewController?.view.frame.size.width)! , height:550)
    }
    
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        if post?.postType == nil {
            return postCollectionCell(index)
        }else{
            return fileCollectionCell(index)
            
        }
    }
    
    
    func postCollectionCell(_ index:Int)-> UICollectionViewCell{
        let cell = collectionContext?.dequeueReusableCell(withNibName: PostCollectionCell.reuseIdentifier, bundle: Bundle.main, for: self, at: index) as! PostCollectionCell
        if let post = self.post{
            cell.setup(postInfo: post)
        }
        if let first = firstFeed as? FirstViewController{
            cell.delegate = first
        }else{
            cell.delegate = firstFeed as! ClassFeedViewController
        }
        cell.currentView = firstFeed
        return cell
    }
    
    
    func fileCollectionCell(_ index:Int) -> UICollectionViewCell{
        let cell = collectionContext?.dequeueReusableCell(withNibName: FileCollectionViewCell.reuseIdentifier , bundle: Bundle.main, for: self, at: index) as! FileCollectionViewCell
        if let post = self.post{
            cell.setUp(post:post)
        }
        return cell
    }
    
    
    func didSelectItem(at index: Int) {
        if post?.postType != nil{
            let url = "https://firebasestorage.googleapis.com/v0/b/myfirstfirebaseapp-3f8ac.appspot.com/o/files%2FJD.pdf?alt=media&token=f4c43974-5716-48f1-a150-e203c4fd71fe"
            let webview = UIWebView(frame: (self.viewController?.view.frame)!)
            webview.scalesPageToFit = true
            let urlRequest = URLRequest(url: NSURL(string: url)! as URL)
            webview.loadRequest(urlRequest as URLRequest)
            webview.isUserInteractionEnabled = true
            let docView = UIViewController()
            docView.view.addSubview(webview)
            docView.title = "Notice"
            firstFeed?.navigationController?.pushViewController(docView, animated: true)
        }
        
    }
    
    func didUpdate(to object: Any) {
        post = object as? Post
    }
    
}
