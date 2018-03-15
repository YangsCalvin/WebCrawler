# WebCrawler
[![](https://travis-ci.org/Alamofire/Alamofire.svg?branch=master)](http://www.yangziyao.top)
[![GitHub issue author](https://img.shields.io/github/issues/detail/u/badges/shields/979.svg)](https://weibo.com/5905837515/profile?topnav=1&wvr=6)
[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php) 
[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://github.com/CodyCalvin/WebCrawler)    


说明
------
* 铃声多多网站的爬虫脚本,用来抓取铃声多多官网的铃声数据并下载。

* [我的博客](http://www.yangziyao.top) 
-------



免责声明
------
* 本项目旨在学习macOS 项目的一点实践，不可使用于商业和个人其他意图。若使用不当，均由个人承担。
* 包含功能：爬取数据
* 若使用中遇到遇到问题， Issue me！

|Author|  CodyCalvin  |
| -----|:------------:|
|E-mail| CodyCalvin@163.com|
------
安装
------
1. 懒人安装 

*  打开 `实用工具-` >`Terminal(终端)`，执行以下命令即可。(需要git支持) `cd ~/Downloads && git https://github.com/CodyCalvin/WebCrawler.git`

2. 普通安装

*  点击`clone or download`下载项目并解压，打开`Terminal(终端)`，打开`WebCrawler.xcodeproj`然后`Command+R`运行工程。

3. 重编译安装

*  点击`clone or download`下载项目，`WebCrawler.xcodeproj`。然后运行工程，如果用户`Xcode`有打印内容，证明成功。

更换获取音乐类别
------

enum MusicType
{
    HottestRingtones = 1, // 最热铃声
    
    LatestRingtones = 0, // 最新铃声
    
    AppleHottestlist = 99,// 苹果最热榜
    
    Downloadatmost = 22, // 最多下载
    
    PopularSongs = 2, // 流行金曲
    
    TelevisionAds = 3, // 影视广告
    
    SMSNotification = 5, // 短信通知
    
    AnimeGames = 4,  // 动漫游戏
    
    FunnyAlternative = 7 // 另类搞笑
};

根据以上枚举替换下边方法的`HottestRingtones`即可
```java 
NSString *urlString = [NSString stringWithFormat:@"http://www.shoujiduoduo.com/home/detail_%d_%zd_30.html",HottestRingtones,i];
```
-------

依赖
------
* [Mac](https://www.apple.com/cn/mac "悬停显示")  [Xcode](https://developer.apple.com/xcode)

更新
------
* 此项目将持续更行，另会增加App版本更方便更快捷 

最后
------
* 使用愉快~

勾搭下
------
![](./WebCrawler/WechatIMG13.jpeg)
    
