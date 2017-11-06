//
//  PlayerManager.h
//  SnakesandLadders
//
//  Created by Daniel Grosman on 2017-11-05.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"


@interface PlayerManager : NSObject

@property (nonatomic, strong) NSMutableArray *players;
@property (nonatomic, assign) NSInteger currentIndex;

- (void) createPlayers: (NSInteger) numberOfPlayers;
- (void) rollDice;
- (void) generateOutput;
- (Player *) currentPlayer;
- (BOOL) gameOver;

@end
