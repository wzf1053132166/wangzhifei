//
//  ViewController.m
//  AFNDelegate
//
//  Created by apple on 2017/1/12.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "NetWorkRequest.h"

#define GetLoginKey @"GetLoginKey"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self accessToServerForGetGetLogin];
}

#pragma mark -- 网络请求
-(void)accessToServerForGetGetLogin
{

    NSString *requestName = GetLoginKey;
    NSString *url = @"http://apis.haoservice.com/lifeservice/cook/query?";
  
    NSMutableDictionary *postInfo = [NSMutableDictionary dictionary];
    
    postInfo[@"menu"] = @"土豆";
    postInfo[@"pn"] = @1;
    postInfo[@"rn"] = @"10";
    postInfo[@"key"] = @"2ba215a3f83b4b898d0f6fdca4e16c7c";
    [NetWorkRequest netWorkRequestByPostMode:url parameters:postInfo requestName:requestName delegate:self];
    
}


-(void)netWorkRequestSuccess:(id)data userInfo:(NSDictionary *)userInfo parameters:(NSDictionary *)getparameters
{
    //服务器连接成功
    NSString *requestUsername = [userInfo objectForKey:@"username"];
    
    if ([requestUsername isEqualToString:GetLoginKey]) {
        
        NSDictionary *dicR = (NSDictionary *)data;
        NSLog(@"%@",dicR);
        
    }
    
}
-(void)netWorkRequestFailed:(NSError*)error userInfo:(NSDictionary *)userInfo parameters:(NSDictionary *)getparameters
{
    //服务器连接失败请重试
    NSLog(@"%@",error);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
