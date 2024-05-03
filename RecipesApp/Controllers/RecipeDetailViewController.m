//
//  RecipeDetailViewController.m
//  RecipesApp
//
//  Created by Ariel Ortiz on 5/1/24.
//

#import "RecipeDetailViewController.h"

@interface RecipeDetailViewController ()

@property(strong, nonatomic) UITableView *detailTableView;
@property(strong, nonatomic) RecipeDetailHeaderUIView *header;
@property(strong, nonatomic) RecipeDetailViewModel *detailViewModel;


@end

@implementation RecipeDetailViewController

- (nonnull instancetype)initWithViewModel:(nonnull RecipeDetailViewModel *)viewModel {
    if(self = [super initWithNibName:nil bundle:nil]){
        [self configureUI];
        [self configureViewModel:viewModel];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.systemBackgroundColor;
}


- (void)configureUI{
    
    _detailTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [_detailTableView registerClass:RecipeIngredientsTableViewCell.class
             forCellReuseIdentifier:RecipeIngredientsTableViewCell.identifier];
    _header = [[RecipeDetailHeaderUIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 500)];
    _detailTableView.tableHeaderView = _header;
    _detailTableView.delegate = self;
    _detailTableView.dataSource = self;
    [self.view addSubview:_detailTableView];
}

- (void)configureViewModel:(RecipeDetailViewModel *)viewModel{
    _detailViewModel = viewModel;
    [_header configureViewModel:[viewModel headerViewModel]];
    [viewModel setupSections:viewModel.instructions ingredients:viewModel.ingredients];
}


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    _detailTableView.frame = self.view.bounds;
    
    [NSLayoutConstraint activateConstraints:@[
    

    ]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_detailViewModel numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_detailViewModel numberOfRows:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        UITableViewCell * cell = [[UITableViewCell alloc] init];
        cell.textLabel.text = [_detailViewModel infoRow:indexPath];
        cell.textLabel.numberOfLines = 0;
        return cell;
    }else{
        UITableViewCell * cell = [[UITableViewCell alloc] init];
        cell.textLabel.text = [_detailViewModel infoRow:indexPath];
        cell.textLabel.numberOfLines = 0;
        return cell;
    }
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [_detailViewModel titleSection:section];
}

@end
