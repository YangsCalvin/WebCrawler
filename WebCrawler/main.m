//
//  main.m
//  WebCrawler
//
//  Created by apple on 2018/3/9.
//  Copyright © 2018年 WebCrawler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Substring.h"
#import <FMDB/FMDB.h>
/**

 铃声多多官网地址：http://www.shoujiduoduo.com/home/detail_1_1_30.html
 
*/
enum MusicType
{
    HottestRingtones = 1, // 最热铃声
    
    LatestRingtones = 0, // 最新铃声
    
    AppleHottestlist = 99,//苹果最热榜
    
    Downloadatmost = 22, // 最多下载
    
    PopularSongs = 2, // 流行金曲
    
    TelevisionAds = 3, // 影视广告
    
    SMSNotification = 5, // 短信通知
    
    AnimeGames = 4,  // 动漫游戏
    
    FunnyAlternative = 7 // 另类搞笑
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"Hello, World!");
    
        FMDatabase *db = [[FMDatabase alloc] initWithPath:@"/Users/apple/Desktop/peoms.sqlite"];
        
        [db open];
        
        int index = 1;
        
        for (int i = 10000; i<600000; i++) {
            
            // 如果想要获取别的类目请把 "HottestRingtones" 替换别的类目就可以了
            NSString *urlString = [NSString stringWithFormat:@"http://www.shoujiduoduo.com/home/detail_%d_%zd_30.html",HottestRingtones,i];

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
            
            NSData *htmlData = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]] returningResponse:nil error:nil];
            
#pragma clang diagnostic pop

             NSString *html = [[NSString alloc] initWithData:htmlData encoding:NSUTF8StringEncoding];
            
            for (int l = index; l<=i * 30; l++) {
                
                NSString *strs = [NSString string];
                
                NSString *leftString = [NSString string];
                if(index < 4){
                    
                strs = [NSString stringWithFormat:@"<em class=\"numm\">%zd</em><a href='JavaScript:jPlaySongWithRid(",index];
                leftString = [NSString stringWithFormat:@"<em class=\"numm\">%zd</em><a href='JavaScript:jPlaySongWithRid",index];
                }else{
                    strs = [NSString stringWithFormat:@"<em class=\"numb\">%zd</em><a href='JavaScript:jPlaySongWithRid(",index];
                    leftString = [NSString stringWithFormat:@"<em class=\"numb\">%zd</em><a href='JavaScript:jPlaySongWithRid",index];
                }
                
                NSString *Rid = [html substringWithinBoundsLeft:strs right:@","];
                
                // 如果RID为空的话就代表此类目全部数据已经获取完了直接退出程序
                if(Rid==nil) exit(0);
                
                NSString *string = [NSString stringWithFormat:@"<a href='JavaScript:jPlaySongWithRid(%@, \"play\");' class=\"listTex2\">",Rid];
                
                NSString *musicname = [html substringWithinBoundsLeft:string right:@"</a>"];
               
                NSString *rangeStr = [html substringWithinBoundsLeft:leftString right:@"听过</span>"];
            
                NSString *authorName = [rangeStr substringWithinBoundsLeft:@"</a><span class=\"listArtist\">" right:@"</span><span class=\"listTime\""];
                
                NSString *musicTime = [rangeStr substringWithinBoundsLeft:@"</span><span class=\"listTime\">" right:@"</span><span class=\"listMen\">"];
                
                NSString *palyCount = [rangeStr substringWithinBoundsLeft:@"</span><span class=\"listMen\">" right:@"人"];
                
                NSLog(@"\n歌曲标识:%@\n歌曲名字:%@\n作者名字:%@\n歌曲时长:%@\n播放数量:%@\n",Rid,musicname,authorName,musicTime,palyCount);
                
                
                //想用数据库储存的话可以打开下面这句话
                
                /**
                 NSString *sql = @"INSERT INTO peoms(Rid,musicname,rangeStr,musicTime,palyCount) VALUES(?,?,?,?)";
                 
                 [db executeUpdate:sql,title,dynasty,author,content];
                 
                 */
                
                index++;
            }

        }
        
        [db close];
        
    }
    return 0;
}
