//
//  ViewController.m
//  NSSet
//
//  Created by paul on 4/14/18.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark NSSet
    NSAutoreleasePool *pool2 = [[NSAutoreleasePool alloc] init];
    //        Please, find your tasks on NSSet and NSMutableSet bellow:
    //        Create NSArray, containing 30 objects. Add duplicates to array.
    
    
    NSMutableArray *mutableTemp = [NSMutableArray arrayWithCapacity:30];
    for (int i=0; i<30; i++) {
        [mutableTemp addObject:[NSNumber numberWithInt:i]];
    }
    
    
    
    [mutableTemp addObjectsFromArray:mutableTemp ];
   // NSArray *arrayForNSSetTask =  [NSArray arrayWithArray:mutableTemp];
    
    
    
    //      Use NSSet to exclude duplicates from array.
    
    NSSet* setForTask = [NSSet setWithArray:mutableTemp];
    
    //      Check what is faster: Create an array of 100 numbers. Check whether number 74 is contained
    //      inside an array. Transform array into NSSet and check whether number 74 is contained inside
    //NSSet.
    [mutableTemp removeAllObjects];
    mutableTemp = [NSMutableArray arrayWithCapacity:100];
    for (int i=0; i<100; i++) {
        [mutableTemp addObject:[NSNumber numberWithInt:i]];
    }
    
    
    NSDate *testDateArray= [NSDate date];
    [mutableTemp containsObject:[NSNumber numberWithInt:74]];
    NSTimeInterval timeIntervalOfArray= [[NSDate date] timeIntervalSinceDate:testDateArray];
    
    
    
    mutableTemp = [NSSet setWithArray:mutableTemp];
    
    NSDate *testDateSet= [NSDate date];
    [(NSSet*)mutableTemp containsObject:[NSNumber numberWithInt:74]];
    NSTimeInterval timeIntervalOfSet= [[NSDate date] timeIntervalSinceDate:testDateSet];
    
    if ([testDateArray compare: testDateSet]) {
        
        NSLog(@"Set is faster %.10f, < %.10f in %.2f times", timeIntervalOfSet,
              timeIntervalOfArray, timeIntervalOfArray/timeIntervalOfSet);
    } else {NSLog(@"Array is faster %.10f, < %.10f in %.2f times", timeIntervalOfArray ,
                  timeIntervalOfSet, timeIntervalOfSet/timeIntervalOfArray);
        
    }
    
    [pool2 release];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}


@end
