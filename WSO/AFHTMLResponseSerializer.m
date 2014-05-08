//
//  AFHTMLResponseSerializer.m
//  WSO
//
//  Created by Aaron Taylor on 5/8/14.
//  Copyright (c) 2014 Williams Students Online. All rights reserved.
//

#import "AFHTMLResponseSerializer.h"

@implementation AFHTMLResponseSerializer

/*

-(id)responseObjectForResponse:(NSURLResponse *)response
                          data:(NSData *)data
                         error:(NSError *__autoreleasing *)error
{
    //1
    OGDocument * document = [super responseObjectForResponse:response
                                                        data:data
                                                       error:error];
    
    //2
    NSArray * panels = [document select:@".panel"];
    
    NSMutableArray * articles = [NSMutableArray new];
    
    //3
    //The list of most read articles is in the second panel
    OGElement * list = (OGElement*)[panels[1] first:@"ol"];
    
    //4
    for (OGElement * listItem in [list select:@"li"])
    {
        //5
        OGElement * link = (OGElement*)[listItem first:@"a"];
        NSString * href = link.attributes[@"href"];
        //Whitespace and the span are the first two elements
        NSString * title = [link.children[2] text];
        //6
        Article * article = [Article new];
        article.title = title;
        article.link = [NSURL URLWithString:href];
        [articles addObject:article];
    }
    
    //7
    return articles;
}
 
 */

@end
