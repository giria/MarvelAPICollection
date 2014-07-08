//
//  AllSuperHeroesViewController.m
//  MarvelAPIDemo
//
//  Created by Diego Freniche Brito on 07/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import "AllSuperHeroesViewController.h"
#import "SuperHeroViewController.h"
#import "SuperHeroParser.h"
#import "SuperHero.h"
#import "MarvelAPIHelper.h"
#import "SuperHeroCell.h"

@interface AllSuperHeroesViewController ()

@property (nonatomic, strong) NSArray *heroes;

@end

@implementation AllSuperHeroesViewController

- (IBAction)showHeroeSearch:(id)sender {
    SuperHeroViewController *vc = [[SuperHeroViewController alloc] init];
    
    [self presentViewController:vc animated:YES completion:nil];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MarvelAPIHelper *mah = [[MarvelAPIHelper alloc] init];
    
    [mah setPublicKey:@"bd8f8a972db1c721bb21aaf100f2e707"];
    [mah setSecretKey:@"8a73988fb7552d0013a1c3148739962c2e7c477e"];
    
    NSData *data = [mah dataForAllSuperheros];
    
    self.heroes = [[[SuperHeroParser alloc] init] parseAllSuperHeroes:data];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return [self.heroes count];
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SuperHeroCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    cell.hero = self.heroes[indexPath.row];

    
    return cell;
}
// 4
/*- (UICollectionReusableView *)collectionView:
 (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
 {
 return [[UICollectionReusableView alloc] init];
 }*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
