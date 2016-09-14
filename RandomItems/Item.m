//
//  Item.m
//  RandomItems
//
//  Created by Austins Work on 9/13/16.
//  Copyright © 2016 AustinsIronYard. All rights reserved.
//

#import "Item.h"

@implementation Item

-(void) dealloc{
    NSLog(@"Destroyed: %@", self);
}

-(instancetype)initWithName:(NSString *)name
             valueInDollars:(int)value
               serialNumber:(NSString *)sNumber{
    //call the superclass designated initializer
    self = [super init];
    
    //Did the superclasses designated initializer succeed?
    if(self){
        //give the instance varibles initial values
        _name = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        //set _dateCreated to current date and time
        _dateCreated = [[NSDate alloc] init];
    }
    //return the address of the newly initialized object
    return self;
}
-(instancetype)initWithName:(NSString *)name{
    return [self initWithName:name
                valueInDollars: 0
                 serialNumber:@""];
}
-(instancetype) init{
    return [self initWithName: @"Item"];
}


-(NSString *)description {
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, reorded on %@", self.name, self.serialNumber, self.valueInDollars, self.dateCreated];
    return descriptionString;
}

+ (instancetype)randomItem{
    // Create an immutable array of three adjectives
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    // Create an immutable array of three nouns
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    // Get the index of a random adjective/noun from the lists
    unsigned int adjectiveIndex =
    arc4random_uniform((unsigned int)[randomAdjectiveList count]);
    unsigned int nounIndex =
    arc4random_uniform((unsigned int)[randomNounList count]);
    // Note that NSInteger is not an object, but a type definition for "long"
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            randomAdjectiveList [adjectiveIndex],randomNounList[nounIndex]];
    // Generate the random value in dollars, 0-99
    int randomValue = arc4random_uniform(100);
    // Use NSUUID to generate a random 5-letter string for the serial number
    NSString *randomSerialNumber = [[[NSUUID UUID] UUIDString] substringToIndex:5];
    // Instantiate the new item with the random values
    Item *newItem = [[self alloc] initWithName:randomName
                                valueInDollars:randomValue
                                  serialNumber:randomSerialNumber];
    return newItem;
}

- (void)setContainedItem:(Item *)containedItem{
    _containedItem = containedItem;
    self.containedItem.container = self;
}

@end
