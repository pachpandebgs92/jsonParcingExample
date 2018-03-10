//
//  ViewController.m
//  JsonDemo
//
//  Created by Student P_07 on 29/12/17.
//  Copyright © 2017 Jivna Chaudhari. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
@interface ViewController ()
{
    NSArray *actorArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self fetchData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)fetchData {
    NSString *urlString = [NSString stringWithFormat:@"http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors"];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        if (error) {
            NSLog(@"%@",error.localizedDescription);
        } else {
            if (response) {
                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                if (httpResponse.statusCode == 200) {
                    
                    if (data) {
                        NSError *error;
                        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                        if (error) {
                            NSLog(@"%@",error.localizedDescription);
                        } else {
                            [self performSelectorOnMainThread:@selector(handleJsonDic:) withObject:jsonDictionary waitUntilDone:NO];
                        }
                    } else {
                        NSLog(@"Responce data error.");
                    }
                } else {
                    NSLog(@"Responce not done.");
                }
            }
        }
    }];
    [task resume];
}

-(void)handleJsonDic: (NSDictionary *)resultDict {
    actorArray = [resultDict valueForKey:@"actors"];
    NSLog(@"%@",actorArray);
    [self.myTableView reloadData];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return actorArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NSDictionary *dict = [actorArray objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = [dict valueForKey:@"name"];
    cell.detailLabel.text = [dict valueForKey:@"description"];
    NSURL *url = [NSURL URLWithString:[dict objectForKey:@"image"]];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
   
    [cell.imgView setImage:[UIImage imageWithData:data]];
    cell.imgView.layer.cornerRadius = 45;
    cell.imgView.layer.masksToBounds = YES;
    
    
    return cell;
}
@end
