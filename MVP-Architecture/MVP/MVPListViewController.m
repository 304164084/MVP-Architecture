//
//  MVPListViewController.m
//  MVP-Architecture
//
//  Created by bang on 2022/4/15.
//

#import "MVPListViewController.h"
#import "MVPListViewController+Private.h"
#import "MVPListViewController+TableView.h"

@interface MVPListViewController () <MVPListPresenterDelegate>

/// UI
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MVPListViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.listPresenter = [[MVPListPresenter alloc] init];
        self.listPresenter.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // setup UI
    [self setupTableView];
    [self setupNavigationBar];
    // data
    [self loadData];
}

- (void)setupTableView
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.frame = self.view.bounds;
    self.tableView.backgroundColor = UIColor.redColor;
    [self.view addSubview:self.tableView];
    
//#define RegisterCell(_cls) \
//    [self.tableView registerClass:_cls.class forCellReuseIdentifier:NSStringFromClass(_cls.class)];
//
//    RegisterCell(UITableViewCell);
//#undef RegisterCell
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:MVPTableViewCellID];
}

- (void)setupNavigationBar
{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(_backAction)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"增加" style:UIBarButtonItemStyleDone target:self action:@selector(_addData)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

#pragma mark - Presenter
- (void)loadData
{
    [self.listPresenter fetchDataWithCompletion:^(BOOL success) {
        if (success) {
            // do something
            [self.tableView reloadData];
        } else {
            // ...
        }
    }];
}

- (void)updateDataWithCompletion:(void (^)(BOOL))completion
{
    [self.tableView reloadData];
    // handle status if presenter need it. here only a easy example.
    !completion ?: completion(YES);
}

#pragma mark - Actions
#pragma mark UI
- (void)_backAction
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark Bussiness
- (void)_addData
{
    [self.listPresenter handleInsertDataAction];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
#pragma mark UI
    // ui action
    /*
     仅测试, 不考虑reload 时复用出现的问题.
     */
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1];
#pragma mark Bussiness
    // data action
    [self.listPresenter handleClickActionAtIndex:indexPath.row];
}

#pragma mark - Getter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return _tableView;
}

@end
