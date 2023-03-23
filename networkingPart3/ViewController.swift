//
//  ViewController.swift
//  networkingPart3
//
//  Created by Evgenii Kutasov on 15.03.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiManager.shared.getPosts { posts in
        }
        ApiManager.shared.getUsers { users in
            
        }
        ApiManager.shared.getAlbums {albums in
            print(albums)
        }

    }


}

