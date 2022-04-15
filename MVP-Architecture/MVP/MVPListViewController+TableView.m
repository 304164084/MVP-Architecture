//
//  MVPListViewController+TableView.m
//  MVP-Architecture
//
//  Created by bang on 2022/4/15.
//

#import "MVPListViewController+TableView.h"
#import "MVPListViewController+Private.h"

@implementation MVPListViewController (TableView)

#pragma mark - TableView Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listPresenter.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MVPTableViewCellID];
    
    [self _configurateCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void)_configurateCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    MVPListMoel *data = self.listPresenter.dataArray[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@--%ld", data.name, data.age];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

@end
