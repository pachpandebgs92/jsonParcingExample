//
//  ViewController.h
//  JsonDemo
//
//  Created by Student P_07 on 29/12/17.
//  Copyright © 2017 Jivna Chaudhari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@end

