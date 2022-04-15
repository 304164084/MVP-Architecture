//
//  MVPListPresenter.h
//  MVP-Architecture
//
//  Created by bang on 2022/4/15.
//

#import <Foundation/Foundation.h>
#import "MVPListDatasource.h"
#import "MVPListViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MVPListPresenterDelegate <NSObject>

- (void)updateDataWithCompletion:(void (^)(BOOL success))completion;

@end

@interface MVPListPresenter : NSObject <MVPListViewProtocol>

@property (nonatomic, strong, readonly) NSArray<MVPListMoel *> *dataArray;

@property (nonatomic, weak) id<MVPListPresenterDelegate> delegate;

// load data
- (void)fetchDataWithCompletion:(void (^)(BOOL success))completion;

@end

NS_ASSUME_NONNULL_END
