//
//  TableViewCell.h
//  JsonDemo
//
//  Created by Student P_07 on 29/12/17.
//  Copyright © 2017 Jivna Chaudhari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
