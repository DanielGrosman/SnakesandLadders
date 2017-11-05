//
//  Player.h
//  SnakesandLadders
//
//  Created by Daniel Grosman on 2017-11-03.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, assign) NSInteger currentSquare;
@property (nonatomic, strong) NSDictionary *gameLogic;
@property (nonatomic, strong) NSString *output;
@property (nonatomic, assign) BOOL gameOver;

- (void) rollDice;

@end
