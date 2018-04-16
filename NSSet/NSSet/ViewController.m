//
//  ViewController.m
//  NSSet
//
//  Created by paul on 4/14/18.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "ViewController.h"
typedef     void(^ContainedInCollectionBlock)(void);
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self doNSSetTaskOne];
    [self doNSSetTaskTwo];
}

-(void) doNSSetTaskOne{
    
    //        Create NSArray, containing 30 objects.
    
    NSMutableArray *mutableTemp = [NSMutableArray array];
    for (int i=0; i<30; i++) {
        [mutableTemp addObject:@(i)];
    }
    
    //NSArray *arrayForNSSetTask =  [NSArray arrayWithArray:mutableTemp]; if nesessary uncomment
    
    //Add duplicates to array.
    [mutableTemp addObjectsFromArray:mutableTemp ];
    
    //      Use NSSet to exclude duplicates from array.
    
    NSSet* setForTask = [NSSet setWithArray:mutableTemp];
}

-(void) doNSSetTaskTwo{
    
    // Create an array of 100 numbers.
    
    
    NSMutableArray  *mutableTemp = [NSMutableArray arrayWithCapacity:100];
    for (int i = 0; i < 100; i++) {
        [mutableTemp addObject:@(i)];
    }
    
    NSNumber *numberToFind = @(74);
    
    // Check whether number 74 is contained inside an array.
    
    NSDate *testDateArray= [NSDate date];
    __block BOOL containedInCollection = [mutableTemp containsObject:numberToFind];
    NSTimeInterval timeIntervalOfArray = [[NSDate date] timeIntervalSinceDate:testDateArray];
    
    ContainedInCollectionBlock ifContained = ^{
        if (containedInCollection) {
            NSLog(@"%@ is in the collection", numberToFind);
        } else {
            NSLog(@"%@ is not in the collection", numberToFind);
        }
    };
    
    
    ifContained();
    
    //Transform array into NSSet and check whether number 74 is contained insided NSSet.
    NSSet *setForTask = [NSSet setWithArray:mutableTemp];
    
    NSDate *testDateSet = [NSDate date];
    containedInCollection = [setForTask containsObject:numberToFind];
    NSTimeInterval timeIntervalOfSet = [[NSDate date] timeIntervalSinceDate:testDateSet];
    
    ifContained();
    
    
    //Check what is faster:
    
    if ([testDateArray compare: testDateSet]) {
        NSLog(@"Set is faster %.10f < %.10f in %.2f times", timeIntervalOfSet,
              timeIntervalOfArray, timeIntervalOfArray/timeIntervalOfSet);
    } else {
        NSLog(@"Array is faster %.10f < %.10f in %.2f times", timeIntervalOfArray,
              timeIntervalOfSet, timeIntervalOfSet/timeIntervalOfArray);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}


@end
