//
//  DMNPokemon.m
//  PokedexHybrid
//
//  Created by Bradley GIlmore on 5/4/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import "DMNPokemon.h"

@implementation DMNPokemon

// Must override initializer becasue in objective-c you can call it's base init to create a nil object. In swift you cannot.
- (instancetype)init
{
    return [self initWithName:@"" identifier:0 abilities:@[]];
}

- (instancetype)initWithName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities
{
    self = [super init];
    if (self){
        _name = [name copy];
        _identifier = identifier;
        _abilities = [abilities copy];
    }
    return self;
}

@end

#pragma mark - JSONConvertible

@implementation DMNPokemon (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[@"name"];
    NSInteger identifier = [dictionary[@"id"] integerValue];
    NSArray *abilityDictionaries = dictionary[@"abilities"];
    
    if (![name isKindOfClass:[NSString class]]
        || ![abilityDictionaries isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
          NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
          for (NSDictionary *dictionary in abilityDictionaries) {
              NSString *abilityName = dictionary[@"ability"][@"name"];
              if (!abilityName) { continue; }
              [abilities addObject:abilityName];
          }
    return [self initWithName:name identifier:identifier abilities:abilities];
}

@end























