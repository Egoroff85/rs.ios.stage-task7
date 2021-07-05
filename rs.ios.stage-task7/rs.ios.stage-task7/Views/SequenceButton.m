//
//  SequenceButton.m
//  rs.ios.stage-task7
//
//  Created by WiCKed on 04.07.2021.
//

#import "SequenceButton.h"

@implementation SequenceButton

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.layer setBorderWidth:1.5];
    [self.layer setBorderColor:[UIColor colorNamed:@"Little Boy Blue"].CGColor];
    [self.layer setCornerRadius:25];   
}

@end
