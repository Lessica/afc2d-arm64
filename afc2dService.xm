/* GNU General Public License, Version 3 {{{ */
/*
 * Cydia is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published
 * by the Free Software Foundation, either version 3 of the License,
 * or (at your option) any later version.
 *
 * Cydia is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Cydia.  If not, see <http://www.gnu.org/licenses/>.
**/
/* }}} */

#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>

%hookf(CFPropertyListRef, CFPropertyListCreateWithData, CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
    NSDictionary *origDict = (NSDictionary *)CFBridgingRelease(%orig);
    
    if ([origDict isKindOfClass:[NSDictionary class]] && origDict[@"com.apple.afc"])
    {
        NSMutableDictionary *mDict = [origDict mutableCopy];
        mDict[@"com.apple.afc2"] = @{
            @"AllowUnactivatedService": @true,
            @"Label": @"com.apple.afc2",
            @"ProgramArguments": @[
                (access(JB_PREFIX"/usr/libexec/afc2d", X_OK) != -1) ? @JB_PREFIX"/usr/libexec/afc2d" : @"/usr/libexec/afc2d", @"-S", @"-L", @"-d", @"/"],
        };
        return CFBridgingRetain(mDict);
    }
    
    return (CFPropertyListRef)CFBridgingRetain(origDict);
}