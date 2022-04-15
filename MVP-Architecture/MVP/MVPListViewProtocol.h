//
//  MVPListViewProtocol.h
//  MVP-Architecture
//
//  Created by bang on 2022/4/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MVPListViewProtocol <NSObject>

- (void)handleClickActionAtIndex:(NSInteger)index;
- (void)handleInsertDataAction;

@end

NS_ASSUME_NONNULL_END
