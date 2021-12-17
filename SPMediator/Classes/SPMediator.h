//
//  SPMediator.h
//  SPMediator
//
//  Created by flowerflower on 2021/12/17.
//


#import <UIKit/UIKit.h>

extern NSString * const kSPMediatorParamsKeySwiftTargetModuleName;

@interface SPMediator : NSObject

/// 区分不同 APP
@property (nonatomic, strong) NSString *appCode;

/// 单例
+ (instancetype)shared;

/// 本地组件调用入口
/// @param targetName 目标
/// @param actionName 方法
/// @param params 参数
/// @param shouldCacheTarget 是否缓存目标
- (id)performTarget:(NSString *)targetName
             action:(NSString *)actionName
             params:(NSDictionary *)params
             shouldCacheTarget:(BOOL)shouldCacheTarget;

/// 释放缓存的目标
/// @param targetName 目标名称
- (void)releaseCachedTargetWithTargetName:(NSString *)targetName;

@end

