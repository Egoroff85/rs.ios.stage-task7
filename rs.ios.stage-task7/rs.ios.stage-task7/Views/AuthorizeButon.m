//
//  AuthorizeButon.m
//  rs.ios.stage-task7
//
//  Created by WiCKed on 04.07.2021.
//

#import "AuthorizeButon.h"

@implementation AuthorizeButon

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.layer setBorderWidth:2];
    [self.layer setCornerRadius:10];
    [self.layer setBorderColor:[UIColor colorNamed:@"Little Boy Blue"].CGColor];
    
    [self setImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"personFill"] forState:UIControlStateHighlighted];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];


}

- (void)setHighlighted:(BOOL)isHighlighted {
    [super setHighlighted:isHighlighted];

    if (isHighlighted) {
        self.backgroundColor = [[UIColor colorNamed:@"Little Boy Blue"] colorWithAlphaComponent:0.2];
    } else {
        self.backgroundColor = [UIColor whiteColor];
    }

}

@end
