//
//  ViewController.swift
//  autolayoutTest
//
//  Created by kimrh on 2018. 8. 2..
//  Copyright © 2018년 kimrh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    weak var imgView: UIImageView!
    
    var imgSrc: UIImage?
    
    var imgViewFrame: CGRect    {
        let midX = self.view.bounds.midX
        let midY = self.view.bounds.midY
        let size:CGFloat = 64
        
        return CGRect(x: midX-size/2, y: midY-size/2, width: size, height: size)
    }
    
    override func loadView() {
        super.loadView()
        
        let imgView = UIImageView()
        self.view.addSubview(imgView)
        //제약조건을 프로그래밍으로 할때는 뷰 자체적으로 수행하는 오토리사이징을 꺼야 함(이유 : 사용자가 지정한 오토레이아웃 조건과 충돌하여 제약조건 문제를 일으킴)
        imgView.translatesAutoresizingMaskIntoConstraints = false
   /*
        let views: [String:Any] = ["view":self.view, "subview":imgView]
        let vertical = NSLayoutConstraint.constraints(withVisualFormat: "V:[view]-(<=1)-[subview(==64)]",
                                                      options: .alignAllCenterX,
                                                      metrics: nil,
                                                      views: views)
        
        let horizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:[view]-(<=1)-[subview(==64)]",
                                                        options: .alignAllCenterY,
                                                        metrics: nil,
                                                        views: views)
        self.view.addConstraints(vertical)
        self.view.addConstraints(horizontal)
     */
        
        NSLayoutConstraint.activate([
            imgView.widthAnchor.constraint(equalToConstant: self.view.bounds.width),
            imgView.heightAnchor.constraint(equalToConstant: self.view.bounds.height),
    //        imgView.topAnchor.constraint(equalTo: self.view.topAnchor),
            imgView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imgView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            ])
        self.imgView = imgView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.imgView.backgroundColor = .yellow
        
        imgSrc = UIImage(named: "siba.jpeg")
        imgView.contentMode = .scaleAspectFit
        self.imgView.image = imgSrc
        
    }
    
    /*
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.imgView.frame = self.imgViewFrame
    }
     */
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override var shouldAutorotate: Bool  {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.portrait, .landscape]
    }
    
 /*   override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation   {
        return .portrait
    }
    
   */

}

