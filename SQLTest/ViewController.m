//
//  ViewController.m
//  SQLTest
//
//  Created by myios on 2017/4/17.
//  Copyright © 2017年 Ashimar. All rights reserved.
//

#import "ViewController.h"
#import "FMDB.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *filePath = [[NSBundle mainBundle ] pathForResource:@"app_database.sql" ofType:nil];
    NSError *error;
    
//    NSString *sql = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    
    NSString *textFileContents = [NSString stringWithContentsOfFile:filePath encoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000) error: & error];
    
    NSLog(@"%@",error);

    NSString *sqlPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"app_database.db"];
    
    NSArray *array = [textFileContents componentsSeparatedByString:@";"];
    
    NSLog(@"%@",array);
    
    NSLog(@"%@",sqlPath);
    
    
    
    FMDatabase *db = [FMDatabase databaseWithPath:sqlPath];
    
    if ([db open]) {
        
        for (NSString *str in array) {
            BOOL res = [db executeUpdate:str];
            
            if (!res) {
                NSLog(@"error when creating db table");
            } else {
                NSLog(@"成功了");
            }
        }
        
    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
