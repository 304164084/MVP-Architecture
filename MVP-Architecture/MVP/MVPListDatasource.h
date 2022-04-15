//
//  MVPListDatasource.h
//  MVP-Architecture
//
//  Created by bang on 2022/4/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MVPListMoel : NSObject

@property (nonatomic, copy) NSString *name;
///
@property (nonatomic, assign) NSInteger age;

+ (instancetype)modelWithName:(NSString *)name age:(NSInteger)age;

@end

@interface MVPListDatasource : NSObject

@property (nonatomic, strong) NSArray *dataArray;

- (void)requestDataWithCompletionHandler:(void (^)(NSArray<MVPListMoel *> *data))completionHandler;

@end

NS_ASSUME_NONNULL_END
