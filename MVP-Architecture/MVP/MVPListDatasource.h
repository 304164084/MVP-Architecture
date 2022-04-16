//
//  MVPListDatasource.h
//  MVP-Architecture
//
//  Created by bang on 2022/4/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MVPListDatasourceDelegate <NSObject>

- (void)updateWithDataArray:(NSArray *)dataArray;

@end

@interface MVPListMoel : NSObject

@property (nonatomic, copy) NSString *name;
///
@property (nonatomic, assign) NSInteger age;

+ (instancetype)modelWithName:(NSString *)name age:(NSInteger)age;

@end

@interface MVPListDatasource : NSObject

/*
 这里可以采用block的方式代替delegate, 具体看个人或团队喜好.
 */
@property (nonatomic, weak) id<MVPListDatasourceDelegate> delegate;

- (void)requestDataWithCompletionHandler:(void (^)(NSArray<MVPListMoel *> *data))completionHandler;

@end

NS_ASSUME_NONNULL_END
