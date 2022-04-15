//
//  MVPListDatasource.m
//  MVP-Architecture
//
//  Created by bang on 2022/4/15.
//

#import "MVPListDatasource.h"

@implementation MVPListMoel

+ (instancetype)modelWithName:(NSString *)name age:(NSInteger)age
{
    MVPListMoel *model = [[MVPListMoel alloc] init];
    model.name = name;
    model.age = age;
    
    return model;
}

@end

@implementation MVPListDatasource

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataArray = @[
            [MVPListMoel modelWithName:@"erha" age:3],
            [MVPListMoel modelWithName:@"xiaohua" age:2],
        ];
    }
    return self;
}

- (void)requestDataWithCompletionHandler:(void (^)(NSArray<MVPListMoel *> * _Nonnull))completionHandler
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        !completionHandler ?: completionHandler(self.dataArray);
    });
}

@end
