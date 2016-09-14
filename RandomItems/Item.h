//
//  Item.h
//  RandomItems
//
//  Created by Austins Work on 9/13/16.
//  Copyright © 2016 AustinsIronYard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
@property(nonatomic,strong) Item *containedItem;
@property(nonatomic, weak) Item *container;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *serialNumber;
@property(nonatomic) int valueInDollars;
@property(nonatomic) NSDate *dateCreated;

+ (instancetype)randomItem;
-(instancetype)initWithName : (NSString *)name
              valueInDollars: (int) value
                serialNumber: (NSString *)sNumber NS_DESIGNATED_INITIALIZER;
-(instancetype)initWithName:(NSString *)name;

@end
