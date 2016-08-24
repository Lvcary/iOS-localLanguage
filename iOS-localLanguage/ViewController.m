//
//  ViewController.m
//  iOS-localLanguage
//
//  Created by 刘康蕤 on 16/8/24.
//  Copyright © 2016年 刘康蕤. All rights reserved.
//

#import "ViewController.h"
#import "LKHeader.h"


@interface ViewController ()

@property (nonatomic, strong) UIButton * changeLanguageBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    NSLog(@"name = %@,language = %@",Localized(@"name"),Localized(@"language"));
    
    self.changeLanguageBtn = ({
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(20, 80, 150, 30);
        [btn setTitle:Localized(@"changeLanguage") forState:0];
        [btn addTarget:self action:@selector(changeLanguageAtnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    
    [self.view addSubview:self.changeLanguageBtn];
}

- (void)changeLanguageAtnAction:(UIButton *)sender {
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:Localized(@"chooseLanguage") message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction * englishAction = [UIAlertAction actionWithTitle:@"english" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSString * language = [[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"];
        if (![language isEqualToString:@"en"]) {
            [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:@"appLanguage"];
            
            [[NSUserDefaults standardUserDefaults] synchronize];
            [[NSNotificationCenter defaultCenter] postNotificationName:CHANGELANGUAGE object:nil];
        }
        
    }];
    UIAlertAction * chineseAction = [UIAlertAction actionWithTitle:@"中文" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSString * language = [[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"];
        if (![language isEqualToString:@"zh-Hans"]) {
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:@"appLanguage"];
            
            [[NSUserDefaults standardUserDefaults] synchronize];
            [[NSNotificationCenter defaultCenter] postNotificationName:CHANGELANGUAGE object:nil];
        }
        
    }];
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:Localized(@"cancel") style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:englishAction];
    [alert addAction:chineseAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
