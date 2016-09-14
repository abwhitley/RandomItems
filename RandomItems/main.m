//
//  main.m
//  RandomItems
//
//  Created by Austins Work on 9/13/16.
//  Copyright © 2016 AustinsIronYard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *items = [[NSMutableArray alloc]init];
        
        
        Item *backpack = [[Item alloc] initWithName:@"Backpack"];
        [items addObject:backpack];
        Item *calculator = [[Item alloc] initWithName:@"Calculator"];
        [items addObject:calculator];
        backpack.containedItem = calculator;
        backpack = nil;
        calculator = nil;
        
        id lastObj = [items lastObject];
        [lastObj count];
        
        for(Item *item in items){
            NSLog(@"%@", item);
        }
        //Destroy array object
        NSLog(@"Setting Items to nil...");
        items = nil;
    }
    return 0;
}
