//
//  ViewController.m
//  RecipesApp
//
//  Created by Ariel Ortiz on 5/1/24.
//

#import "RecipesViewController.h"

@interface RecipesViewController ()

@property(strong, nonatomic) UITableView *recipeTableView;
@property(strong, nonatomic) RecipeListViewModel *viewModel;

@end

@implementation RecipesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Recipes";
    self.view.backgroundColor = UIColor.systemBackgroundColor;
    [self configureViewModel];
    [self configureTableView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_viewModel getRecipes];
}

- (void)configureViewModel{
    _viewModel = [[RecipeListViewModel alloc] initWithService:RecipeService.sharedService];
    _viewModel.delegate = self;
}

- (void)configureTableView{
    _recipeTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [_recipeTableView registerClass:RecipeUITableViewCell.class forCellReuseIdentifier:RecipeUITableViewCell.identifier];
    _recipeTableView.delegate = self;
    _recipeTableView.dataSource = self;
    [self.view addSubview:_recipeTableView];
    _recipeTableView.frame = self.view.bounds;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_viewModel numberOfRecipes];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RecipeUITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RecipeUITableViewCell.identifier forIndexPath:indexPath];
    if(cell == nil){
        return [[UITableViewCell alloc] init];
    }
    RecipeCellViewModel *cellViewModel = [_viewModel getByIndexViewModel:indexPath.row];
    if(cellViewModel == nil){
        return [[UITableViewCell alloc] init];
    }
    [cell configureCell:cellViewModel];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    RecipeDetailViewModel *detailVM = [_viewModel getByIndexDetailViewModel:indexPath.row];
    if(detailVM == nil){
        return;
    }
    RecipeDetailViewController *vc = [[RecipeDetailViewController alloc] initWithViewModel:detailVM];
    [self.navigationController pushViewController:vc animated:true];
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 170;
}

- (void)update{
    __typeof(self) __weak weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.recipeTableView reloadData];
    });
}


@end
