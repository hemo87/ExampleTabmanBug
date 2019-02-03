//
//  ViewController.swift
//  Example
//
//  Created by Marc Heminsley on 03/02/2019.
//  Copyright © 2019 MarcHeminsley. All rights reserved.
//

import UIKit
import Pageboy
import Tabman

class ViewController: TabmanViewController {

    lazy var viewControllers: [UIViewController] = {
        var viewControllers = [TableViewController]()
        for _ in 0 ..< 5 {
            viewControllers.append(makeChildViewController(at: 0))
        }
        return viewControllers
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bar = TMBar.ButtonBar()
        bar.layout.interButtonSpacing = view.frame.width/4
        bar.indicator.cornerStyle = .square
        bar.indicator.tintColor = .white
        bar.indicator.weight = .light
        bar.indicator.backgroundColor = .white
        bar.backgroundView.isUserInteractionEnabled = false
        bar.backgroundColor = .black
        bar.fadesContentEdges = true
        bar.layout.transitionStyle = .snap
        bar.isUserInteractionEnabled = false
        bar.buttons.customize { (button) in
            button.tintColor = .gray
            button.selectedTintColor = .white
            
        }
        
        bar.backgroundView.style = .blur(style: .dark)
        addBar(bar, dataSource: self, at: .top)
        
        dataSource = self
    }


    
    func makeChildViewController(at index: Int?) -> TableViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: "TableView") as! TableViewController
    }
    
    // Comment out this function and it works as expected
    override func pageboyViewController(_ pageboyViewController: PageboyViewController, willScrollToPageAt index: TabmanViewController.PageIndex, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        print(index)
    }
    
}

extension ViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {

        let title = String(index)
        
        return TMBarItem(title: title)
    }
    
}




