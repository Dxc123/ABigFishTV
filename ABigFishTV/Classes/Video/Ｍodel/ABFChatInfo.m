//
//  ABFChatInfo.m
//  ABigFishTV
//
//  Created by 陈立宇 on 17/11/11.
//  Copyright © 2017年 陈立宇. All rights reserved.
//

#import "ABFChatInfo.h"

#import <MJExtension.h>
#import "ABFInfo.h"

@implementation ABFChatInfo

+ (NSDictionary *)mj_objectClassInArray{
    return @{ @"images" : @"ABFInfo",
              @"videos" : @"ABFInfo"
        };
}

-(CGFloat) contextHeight{
    
    if(!_contextHeight){
        CGFloat labelWidth = kScreenWidth-30-5;
        UILabel *content = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, 1)];
        content.text = [NSString stringWithFormat:@"      %@",_context];
        content.font = [UIFont systemFontOfSize:16];
        content.numberOfLines = 0;
        CGFloat height = [UILabel getHeightByWidth:labelWidth title:content.text font:content.font];
        NSInteger count = height / 13 ;
        _contextHeight = height + 6*(count+1) + 10;
    }
    return _contextHeight;
}

-(CGFloat) contextHeight2{
    
    if(!_contextHeight2){
        CGFloat labelWidth = kScreenWidth-20;
        UILabel *content = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, 1)];
        content.text = [NSString stringWithFormat:@"    %@",_context];
        content.font = [UIFont systemFontOfSize:18];
        content.numberOfLines = 0;
        CGFloat height = [UILabel getHeightByWidth:labelWidth title:content.text font:content.font];
        NSInteger count = height / 13 ;
        _contextHeight2 = height + 6*(count+1);
    }
    return _contextHeight2;
}

-(CGFloat) imagesHeight{

    CGFloat lineHeight= ((kScreenWidth-60)/3-10);
    if(!_imagesHeight){
        NSArray *images = [ABFInfo mj_keyValuesArrayWithObjectArray:_images];
        if(images.count>0){
            NSInteger count = [images count];
            if(count % 3 == 0){
                _imagesHeight = (count/3)*(lineHeight+10);
            }else{
                _imagesHeight = (count/3 + 1)*(lineHeight+10);
            }
        }else{
            _imagesHeight = 0;
        }
        
        _imagesHeight = _imagesHeight + 20;
        
        
        
    }
    return _imagesHeight;
}

@end
