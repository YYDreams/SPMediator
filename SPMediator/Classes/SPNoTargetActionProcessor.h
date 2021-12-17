//
//  SPNoTargetActionProcessor.h
//  SPMediator
//
//  Created by flowerflower on 2021/12/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPNoTargetActionProcessor : NSObject

/**
 统一响应无法查询的组件方法
 
 @param params 参数
 */
- (void)responseNoTargetAction:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
