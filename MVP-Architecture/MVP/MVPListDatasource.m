//
//  MVPListDatasource.m
//  MVP-Architecture
//
//  Created by bang on 2022/4/15.
//

#import "MVPListDatasource.h"
#import <UIKit/UIKit.h>

@implementation MVPListMoel

+ (instancetype)modelWithName:(NSString *)name age:(NSInteger)age
{
    MVPListMoel *model = [[MVPListMoel alloc] init];
    model.name = name;
    model.age = age;
    
    return model;
}

@end

@interface MVPListDatasource ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation MVPListDatasource

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self registerNotifications];
        [self initializeData];
    }
    return self;
}

- (void)initializeData
{
    self.dataArray = @[
        [MVPListMoel modelWithName:@"erha" age:3],
        [MVPListMoel modelWithName:@"xiaohua" age:2],
    ];
}

- (void)registerNotifications
{
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(_updateDataNotification:) name:UIApplicationDidEnterBackgroundNotification object:nil];
}

#pragma mark - Data
- (void)requestDataWithCompletionHandler:(void (^)(NSArray<MVPListMoel *> * _Nonnull))completionHandler
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        !completionHandler ?: completionHandler(self.dataArray);
    });
}

/// auto update data
- (void)_updateDataNotification:(NSNotification *)notification
{
    NSMutableArray *dataArray = self.dataArray.mutableCopy;
    [dataArray addObject:[MVPListMoel modelWithName:@"改变3331" age:33]];
    self.dataArray = dataArray.copy;
    if ([self.delegate respondsToSelector:@selector(updateWithDataArray:)]) {
        [self.delegate updateWithDataArray:self.dataArray];
    }
}

@end
