//
//  Player.m
//  SnakesandLadders
//
//  Created by Daniel Grosman on 2017-11-03.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentSquare = 0;
        _gameLogic = @{@4:@14,@9:@31,@20:@38,@29:@84,@40:@59,@51:@67,@63:@81,@17:@7,@64:@60,@89:@26,@95:@75,@99:@78};
        _gameOver = NO;
    }
        return self;
}

- (void) rollDice {
    
    int diceValue = arc4random_uniform(6)+1;
    NSLog(@"%@ rolled a %d", self.playerName, diceValue);

    self.currentSquare += diceValue;

    NSLog(@"%@ landed on square %ld", self.playerName,self.currentSquare);

    NSNumber *convertedCurrentSquare = [NSNumber numberWithInteger:self.currentSquare];

    if ([self.gameLogic objectForKey:convertedCurrentSquare]) {
        NSInteger newCurrentSquare = [self.gameLogic[convertedCurrentSquare] integerValue];
        self.currentSquare = newCurrentSquare;
    
    
    if([convertedCurrentSquare integerValue] < [self.gameLogic[convertedCurrentSquare] integerValue]) {
        self.output = [NSString stringWithFormat:@"Stairway to Heaven! %@ jumped from square %@ to square %ld",self.playerName,convertedCurrentSquare, self.currentSquare];
    }
    else if ([convertedCurrentSquare integerValue] > [self.gameLogic[convertedCurrentSquare] integerValue]){
        self.output = [NSString stringWithFormat:@"%@ stepped on a snake and fell from square %@ to square %ld", self.playerName, convertedCurrentSquare, self.currentSquare];
    }

}
    else self.output = @"";
}



@end
