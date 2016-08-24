//
//  LKHeader.h
//  iOS-localLanguage
//
//  Created by 刘康蕤 on 16/8/24.
//  Copyright © 2016年 刘康蕤. All rights reserved.
//

#ifndef LKHeader_h
#define LKHeader_h

#define Localized(key)  [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:@"Language"]


#define CHANGELANGUAGE @"changeLanguageNoti"

#endif /* LKHeader_h */
