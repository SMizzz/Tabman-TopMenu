//
//  ViewController.swift
//  TopMenu
//
//  Created by 신미지 on 2021/07/19.
//

import UIKit
import Tabman
import Pageboy

class ViewController: TabmanViewController {
  
  private var viewControllers: Array<UIViewController> = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewSetup()
    // Do any additional setup after loading the view.
  }
  
  func viewSetup() {
    let redVC = self.storyboard?.instantiateViewController(withIdentifier: "RedVC")
    let greenVC = self.storyboard?.instantiateViewController(withIdentifier: "GreenVC")
    let blueVC = self.storyboard?.instantiateViewController(withIdentifier: "BlueVC")
    let yellowVC = self.storyboard?.instantiateViewController(withIdentifier: "YellowVC")
    
    viewControllers.append(redVC!)
    viewControllers.append(greenVC!)
    viewControllers.append(blueVC!)
    viewControllers.append(yellowVC!)
    
    self.dataSource = self
    let bar = TMBar.ButtonBar()
    bar.backgroundView.style = .blur(style: .light)
    bar.backgroundColor = .white
    bar.layout.contentInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
    bar.layout.interButtonSpacing = 40
    bar.layout.transitionStyle = .snap
    bar.layout.contentMode = .intrinsic
    bar.indicator.weight = .light
    bar.indicator.tintColor = .lightGray
    bar.buttons.customize { (button) in
      button.tintColor = .gray
      button.selectedTintColor = .lightGray
    }
    addBar(bar, dataSource: self, at: .top)
  }
  
}

extension ViewController: PageboyViewControllerDataSource, TMBarDataSource {
  func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
    scrollToPage(.at(index: 1), animated: true)
    let  item = TMBarItem(title: "")
    if (index == 0) {
      item.title = "test1"
    } else if (index == 1) {
      item.title = "test2"
    } else if (index == 2) {
      item.title = "test3"
    } else {
      item.title = "test4"
    }
    return item
  }
  
  func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
    return viewControllers.count
  }
  
  func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
    // 어떤 뷰
    return viewControllers[index]
  }
  
  func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
    return nil
  }
}
