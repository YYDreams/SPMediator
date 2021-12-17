//
//  SPNoTargetActionProcessor.m
//  SPMediator
//
//  Created by flowerflower on 2021/12/17.
//

#import "SPNoTargetActionProcessor.h"

extern NSString * const kSPMediatorParamsKeySwiftTargetModuleName;

@implementation SPNoTargetActionProcessor


/**
 统一响应无法查询的组件方法

 @param params 参数
 */
- (void)responseNoTargetAction:(NSDictionary *)params
{
    NSDictionary *originParams = [params objectForKey:@"originParams"];
    NSString *noticeName = [params objectForKey:@"targetString"];
    if (originParams && [originParams isKindOfClass:[NSDictionary class]]) {
        NSString *moduleName = originParams[kSPMediatorParamsKeySwiftTargetModuleName];
        if (moduleName.length > 0) {
            noticeName = moduleName;
            if ([noticeName hasSuffix:@"_swift"]) {
                noticeName = [noticeName stringByReplacingOccurrencesOfString:@"_swift" withString:@""];
            }
            
            NSString *moduleInfoPath = [[NSBundle mainBundle]pathForResource:@"ModuleInfo" ofType:@"plist"];
            NSDictionary *moduleInfoDic = [NSDictionary dictionaryWithContentsOfFile:moduleInfoPath];
            if ([moduleInfoDic isKindOfClass:[NSDictionary class]]) {
                NSDictionary *noticeNameDic = [moduleInfoDic objectForKey:noticeName];
                if ([noticeNameDic isKindOfClass:[NSDictionary class]] && [noticeNameDic objectForKey:@"name"]) {
                    noticeName = [noticeNameDic objectForKey:@"name"];
                }
            }
        }
        
    }
    //弹警告提示
    dispatch_async(dispatch_get_main_queue(), ^{
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"不支持类型【%@】",noticeName] preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        
        UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
        [window.rootViewController presentViewController:alertController animated:YES completion:nil];
    });
}


@end
