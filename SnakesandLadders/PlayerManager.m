//
//  PlayerManager.m
//  SnakesandLadders
//
//  Created by Daniel Grosman on 2017-11-05.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "PlayerManager.h"

@implementation PlayerManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _players = [[NSMutableArray alloc] init];
        _currentIndex = 0;
    }
    return self;
}

- (void)createPlayers:(NSInteger)numberOfPlayers {
    for (int i=0; i<numberOfPlayers; i++) {
    Player *player = [[Player alloc] init];
    player.playerName = [NSString stringWithFormat:@"player %d",(i+1)];
    [self.players addObject:player];
    }
}

-(void)rollDice {
    Player *currentPlayer = [self currentPlayer];
    [currentPlayer rollDice];
    [self generateOutput];
    self.currentIndex++;
}

-(void)generateOutput{
    Player *currentPlayer = [self currentPlayer];
    NSLog(@"%@",currentPlayer.output);
    if (currentPlayer.currentSquare >= 100){
        NSLog(@"Game Over! %@ has won the game", currentPlayer.playerName);
        currentPlayer.gameOver = YES;
        [self gameOver];
    }
}

-(BOOL)gameOver{
    for (Player *player in self.players) {
        if (player.gameOver) {
            return YES;
        }
    }
    return NO;
}

-(Player *)currentPlayer {
    if ((self.currentIndex % [self.players count]) == 0) {
        self.currentIndex = 0;
    }
    return self.players [self.currentIndex];
    }


@end
