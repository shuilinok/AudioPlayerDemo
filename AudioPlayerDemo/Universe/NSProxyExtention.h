//
//  NSProxyExtention.h
//
//  Created by 税 on 4/21/17.


#import <Foundation/Foundation.h>

@protocol NSProxyExtention <NSObject>

- (void)addObserver:(nullable NSObject *)observer forKeyPath:(nullable NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;
- (void)removeObserver:(nullable NSObject *)observer forKeyPath:(nullable NSString *)keyPath context:(nullable void *)context NS_AVAILABLE(10_7, 5_0);
- (void)removeObserver:(nullable NSObject *)observer forKeyPath:(nullable NSString *)keyPath;

@end
