#import "MGContainerView.h"
#define min(a,b) ((a<b)?a:b)

@implementation MGContainerView

static UIColor *backgroundColor;

+ (UIBlurEffectStyle)blurStyle {
	return UIBlurEffectStyleLight;
}

+ (void)initialize {
	if (self == [MGContainerView class]) {
		backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.25];
	}
}

- (instancetype)initWithFrame:(CGRect)frame {
	if ((self = [super initWithFrame:frame])) {
		self.layer.masksToBounds = YES;
		self.backgroundColor = backgroundColor;
		_visualEffect = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:self.class.blurStyle]];
		if (!_visualEffect) return nil;
		_contentView = [UIView new];
		if (!_contentView) return nil;
		[self addSubview:_visualEffect];
		[self addSubview:_contentView];
	}
	return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	self.layer.cornerRadius = 0.1 * min(self.frame.size.width, self.frame.size.height);
	CGRect rect = CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height);
	_visualEffect.frame = rect;
	rect.origin.x += 2.5;
	rect.origin.y += 2.5;
	rect.size.width -= 5.0;
	rect.size.height -= 5.0;
	_contentView.frame = rect;
}

- (instancetype)init {
	return [self initWithFrame:CGRectZero];
}

@end