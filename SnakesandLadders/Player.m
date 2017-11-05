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
    // creates an int called diceValue that holds a random value between 1 and 6
    int diceValue = arc4random_uniform(6)+1;
    NSLog(@"You rolled a %d", diceValue);
    // adds the diceValue to the currentSquare to get the new currentSquare value
    self.currentSquare += diceValue;
    // converts the currentSquare NSInteger to an NSNumber object, so it can be compared to the values in the NSDictionary
    NSNumber *convertedCurrentSquare = [NSNumber numberWithInteger:self.currentSquare];
    // checks to see if the there is an object associated with the key that matches the convertedCurrentSquare in the gameLogic dictionary. If so, a new NSInteger is created that holds the new square, which is equal to the value of the object for the key that matches the convertedCurrentSquare value. The currentSquare then becomes equal to the newCurrentSquare.
    if ([self.gameLogic objectForKey:convertedCurrentSquare]) {
        NSInteger newCurrentSquare = [self.gameLogic[convertedCurrentSquare] integerValue];
        self.currentSquare = newCurrentSquare;
    }
    // if the convertedCurrentSquare (holds the square value before it becomes the newCurrentSquare) is less than the new currentSquare value, this means the player has stepped on a ladder, and it prints out the output
    if ([convertedCurrentSquare integerValue] < self.currentSquare) {
        self.output = [NSString stringWithFormat:@"Stairway to Heaven! You jumped from square %@ to square %ld",convertedCurrentSquare, self.currentSquare];
        NSLog(@"%@",self.output);
    }
     // if the convertedCurrentSquare (holds the square value before it becomes the newCurrentSquare) is greater than the new currentSquare value, this means the player has stepped on a snake, and it prints out the output
    else if ([convertedCurrentSquare integerValue] > self.currentSquare) {
        self.output = [NSString stringWithFormat:@"You stepped on a snake! You fell from square %@ to square %ld", convertedCurrentSquare, self.currentSquare];
        NSLog(@"%@",self.output);
    }
    // if the player reaches 100, the gameOver BOOL is changed to yes and it tells the user the game is over
    if (self.currentSquare >= 100) {
        self.gameOver = YES;
        NSLog(@"Game Over! Congratulations you have won the game!");
    }
    // if the game is not over, print the square that the player is on after every roll
    else {
    NSLog(@"You are now on square %ld", self.currentSquare);
    }
}


@end
