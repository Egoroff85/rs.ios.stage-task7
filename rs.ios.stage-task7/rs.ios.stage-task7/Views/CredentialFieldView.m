//
//  CredentialFieldView.m
//  rs.ios.stage-task7
//
//  Created by WiCKed on 04.07.2021.
//

#import "CredentialFieldView.h"

@implementation CredentialFieldView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.layer setBorderWidth:1.5];
    [self.layer setCornerRadius:5];
    
    [self setAlpha:1];
    [self setEnabled:YES];
    
    [self setState:@"ready"];
}

- (void)setState:(NSString *)newState {
    if ([newState isEqualToString:@"success"]) {
        [self.layer setBorderColor:[UIColor colorNamed:@"Turquoise Green"].CGColor];
    } else if ([newState isEqualToString:@"ready"]) {
        [self.layer setBorderColor:[UIColor colorNamed:@"Black Coral"].CGColor];
    } else if ([newState isEqualToString:@"error"]) {
        [self.layer setBorderColor:[UIColor colorNamed:@"Venetian Red"].CGColor];
    }
    
    self.stateType = newState;
}

@end
