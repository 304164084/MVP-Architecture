//
//  MVPListViewController+Private.h
//  MVP-Architecture
//
//  Created by bang on 2022/4/15.
//

#import "MVPListViewController.h"
#import "MVPListPresenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface MVPListViewController (/* Private */)

/// presenter
@property (nonatomic, strong) MVPListPresenter *listPresenter;

@end

NS_ASSUME_NONNULL_END
