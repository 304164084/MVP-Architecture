//
//  MVPListPresenter.m
//  MVP-Architecture
//
//  Created by bang on 2022/4/15.
//

#import "MVPListPresenter.h"

@interface MVPListPresenter () <MVPListDatasourceDelegate>

///
@property (nonatomic, strong) MVPListDatasource *datasource;
///
@property (nonatomic, strong) NSArray<MVPListMoel *> *dataArray;

@end

@implementation MVPListPresenter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.datasource = [[MVPListDatasource alloc] init];
        self.datasource.delegate = self;
    }
    return self;
}

/// active pull data
- (void)fetchDataWithCompletion:(void (^)(BOOL success))completion
{
    __weak typeof(self)weakSelf = self;
    [self.datasource requestDataWithCompletionHandler:^(NSArray<MVPListMoel *> * _Nonnull data) {
        // ...
        __strong typeof(weakSelf)strongSelf = weakSelf;
        if (!data) {
            strongSelf.dataArray = nil;
            !completion ?: completion(NO);
            return;
        }
        
        strongSelf.dataArray = data;
        !completion ?: completion(YES);
    }];
}

- (void)update
{
    if ([self.delegate respondsToSelector:@selector(updateDataWithCompletion:)]) {
        [self.delegate updateDataWithCompletion:^(BOOL finished) {
            if (finished) {
                // do something
            } else {
                
            }
        }];
    }
}

#pragma mark - Handle Action
- (void)handleClickActionAtIndex:(NSInteger)index
{
    MVPListMoel *model = self.dataArray[index];
    model.name = [NSString stringWithFormat:@"%u-changed", arc4random() % 9];
    // model -> ui
    [self update];
}

- (void)handleInsertDataAction
{
    NSMutableArray *dataArray = self.dataArray.mutableCopy;
    [dataArray addObject:[MVPListMoel modelWithName:@"新增01" age:33]];
    self.dataArray = dataArray.copy;
    
    [self update];
}

#pragma mark - DatasourceDelegate
- (void)updateWithDataArray:(NSArray *)dataArray
{
    self.dataArray = dataArray.copy;
    [self update];
}

@end
