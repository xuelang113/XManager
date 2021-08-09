port: 7890
socks-port: 7891
redir-port: 7892
allow-lan: true
mode: Rule
log-level: info
external-controller: 0.0.0.0:9191
secret: '123456'

experimental:
  ignore-resolve-fail: true

#authentication:
# - "user1:pass1"

# hosts:
#   '*.clash.dev': 127.0.0.1
#   'alpha.clash.dev': '::1'
 
dns:
 enable: true
 listen: 0.0.0.0:5300
 enhanced-mode: redir-host
 #fake-ip-range: 198.18.0.1/24
 nameserver: 
  - 119.29.29.29 
  - 114.114.114.114    
  - tls://dns.rubyfish.cn:853
  - https://dns.google/dns-query
  - https://1.1.1.1/dns-query
fallback:
 - tcp://1.1.1.1
 - tcp://8.8.8.8
fallback-filter:
  geoip: true
  ipcidr:
    - 240.0.0.0/4 


proxies:
{foreach $confs as $conf}
- {json_encode($conf,320)}
{/foreach}

proxy-groups:
- { name: "🔑Proxy", type: select, proxies: {json_encode($proxies,320)} }
- { name: "❌AdBlock", type: select, proxies: ["REJECT","DIRECT"]}
- { name: "📺GlobalTV", type: select, proxies: ["🔑Proxy","DIRECT"]}
- { name: "🖥️AsianTV", type: select, proxies: ["DIRECT","🔑Proxy"]}




rules:
- DOMAIN-SUFFIX,netflix.com,📺GlobalTV
- DOMAIN-SUFFIX,netflix.net,📺GlobalTV
- DOMAIN-SUFFIX,nflxext.com,📺GlobalTV
- DOMAIN-SUFFIX,nflximg.com,📺GlobalTV
- DOMAIN-SUFFIX,nflximg.net,📺GlobalTV
- DOMAIN-SUFFIX,nflxso.net,📺GlobalTV
- DOMAIN-SUFFIX,nflxvideo.net,📺GlobalTV
- DOMAIN-SUFFIX,whatsapp.com,🔑Proxy
- DOMAIN-SUFFIX,whatsapp.net,🔑Proxy
- DOMAIN-KEYWORD,whatsapp,🔑Proxy
# (GlobalTV)
# > ABC
- DOMAIN-SUFFIX,edgedatg.com,📺GlobalTV
- DOMAIN-SUFFIX,go.com,📺GlobalTV

# > AbemaTV
- DOMAIN,linear-abematv.akamaized.net,📺GlobalTV
- DOMAIN-SUFFIX,abema.io,📺GlobalTV
- DOMAIN-SUFFIX,abema.tv,📺GlobalTV
- DOMAIN-SUFFIX,akamaized.net,📺GlobalTV
- DOMAIN-SUFFIX,ameba.jp,📺GlobalTV
- DOMAIN-SUFFIX,hayabusa.io,📺GlobalTV

# > Amazon Prime Video
- DOMAIN-SUFFIX,aiv-cdn.net,📺GlobalTV
- DOMAIN-SUFFIX,amazonaws.com,📺GlobalTV
- DOMAIN-SUFFIX,amazonvideo.com,📺GlobalTV
- DOMAIN-SUFFIX,llnwd.net,📺GlobalTV

# > Bahamut
- DOMAIN-SUFFIX,bahamut.com.tw,📺GlobalTV
- DOMAIN-SUFFIX,gamer.com.tw,📺GlobalTV
- DOMAIN-SUFFIX,hinet.net,📺GlobalTV

# > BBC
- DOMAIN-KEYWORD,bbcfmt,📺GlobalTV
- DOMAIN-KEYWORD,co.uk,📺GlobalTV
- DOMAIN-KEYWORD,uk-live,📺GlobalTV
- DOMAIN-SUFFIX,bbc.co,📺GlobalTV
- DOMAIN-SUFFIX,bbc.co.uk,📺GlobalTV
- DOMAIN-SUFFIX,bbc.com,📺GlobalTV
- DOMAIN-SUFFIX,bbci.co,📺GlobalTV
- DOMAIN-SUFFIX,bbci.co.uk,📺GlobalTV

# > CHOCO TV
- DOMAIN-SUFFIX,chocotv.com.tw,📺GlobalTV

# > Epicgames
- DOMAIN-KEYWORD,epicgames,📺GlobalTV
- DOMAIN-SUFFIX,helpshift.com,📺GlobalTV

# > Fox+
- DOMAIN-KEYWORD,foxplus,📺GlobalTV
- DOMAIN-SUFFIX,config.fox.com,📺GlobalTV
- DOMAIN-SUFFIX,emome.net,📺GlobalTV
- DOMAIN-SUFFIX,fox.com,📺GlobalTV
- DOMAIN-SUFFIX,foxdcg.com,📺GlobalTV
- DOMAIN-SUFFIX,foxnow.com,📺GlobalTV
- DOMAIN-SUFFIX,foxplus.com,📺GlobalTV
- DOMAIN-SUFFIX,foxplay.com,📺GlobalTV
- DOMAIN-SUFFIX,ipinfo.io,📺GlobalTV
- DOMAIN-SUFFIX,mstage.io,📺GlobalTV
- DOMAIN-SUFFIX,now.com,📺GlobalTV
- DOMAIN-SUFFIX,theplatform.com,📺GlobalTV
- DOMAIN-SUFFIX,urlload.net,📺GlobalTV

# > HBO && HBO Go
- DOMAIN-SUFFIX,execute-api.ap-southeast-1.amazonaws.com,📺GlobalTV
- DOMAIN-SUFFIX,hbo.com,📺GlobalTV
- DOMAIN-SUFFIX,hboasia.com,📺GlobalTV
- DOMAIN-SUFFIX,hbogo.com,📺GlobalTV
- DOMAIN-SUFFIX,hbogoasia.hk,📺GlobalTV

# > Hulu
- DOMAIN-SUFFIX,happyon.jp,📺GlobalTV
- DOMAIN-SUFFIX,hulu.com,📺GlobalTV
- DOMAIN-SUFFIX,huluim.com,📺GlobalTV
- DOMAIN-SUFFIX,hulustream.com,📺GlobalTV

# > Imkan
- DOMAIN-SUFFIX,imkan.tv,📺GlobalTV

# > JOOX
- DOMAIN-SUFFIX,joox.com,📺GlobalTV

# > MytvSUPER
- DOMAIN-KEYWORD,nowtv100,📺GlobalTV
- DOMAIN-KEYWORD,rthklive,📺GlobalTV
- DOMAIN-SUFFIX,mytvsuper.com,📺GlobalTV
- DOMAIN-SUFFIX,tvb.com,📺GlobalTV


# > Pandora
- DOMAIN-SUFFIX,pandora.com,📺GlobalTV

# > Sky GO
- DOMAIN-SUFFIX,sky.com,📺GlobalTV
- DOMAIN-SUFFIX,skygo.co.nz,📺GlobalTV

# > Spotify
- DOMAIN-KEYWORD,spotify,📺GlobalTV
- DOMAIN-SUFFIX,scdn.co,📺GlobalTV
- DOMAIN-SUFFIX,spoti.fi,📺GlobalTV

# > viuTV
- DOMAIN-SUFFIX,viu.tv,📺GlobalTV

# > Youtube
- DOMAIN-KEYWORD,youtube,📺GlobalTV
- DOMAIN-SUFFIX,googlevideo.com,📺GlobalTV
- DOMAIN-SUFFIX,gvt2.com,📺GlobalTV
- DOMAIN-SUFFIX,youtu.be,📺GlobalTV

# (🖥️AsianTV)
# > Bilibili
- DOMAIN-KEYWORD,bilibili,🖥️AsianTV
- DOMAIN-SUFFIX,acg.tv,🖥️AsianTV
- DOMAIN-SUFFIX,acgvideo.com,🖥️AsianTV
- DOMAIN-SUFFIX,b23.tv,🖥️AsianTV
- DOMAIN-SUFFIX,biliapi.com,🖥️AsianTV
- DOMAIN-SUFFIX,biliapi.net,🖥️AsianTV
- DOMAIN-SUFFIX,bilibili.com,🖥️AsianTV
- DOMAIN-SUFFIX,biligame.com,🖥️AsianTV
- DOMAIN-SUFFIX,biligame.net,🖥️AsianTV
- DOMAIN-SUFFIX,hdslb.com,🖥️AsianTV
- DOMAIN-SUFFIX,im9.com,🖥️AsianTV

# > IQIYI
- DOMAIN-KEYWORD,qiyi,🖥️AsianTV
- DOMAIN-SUFFIX,qy.net,🖥️AsianTV

# > letv
- DOMAIN-SUFFIX,api.mob.app.letv.com,🖥️AsianTV

# > NeteaseMusic
- DOMAIN-SUFFIX,163yun.com,🖥️AsianTV
- DOMAIN-SUFFIX,music.126.net,🖥️AsianTV
- DOMAIN-SUFFIX,music.163.com,🖥️AsianTV

# > Tencent Video
- DOMAIN-SUFFIX,vv.video.qq.com,🖥️AsianTV

# ❌AdBlock Block
# > Exclusions
- DOMAIN,analytics.google.com,🔑Proxy
- DOMAIN,analyticsinsights-pa.googleapis.com,🔑Proxy
- DOMAIN,analyticsreporting.googleapis.com,🔑Proxy
- DOMAIN-SUFFIX,vd.l.qq.com,🖥️AsianTV
# > General
- DOMAIN-KEYWORD,adservice,❌AdBlock
- DOMAIN-KEYWORD,analytics,❌AdBlock
- DOMAIN-KEYWORD,analysis,❌AdBlock

- DOMAIN-SUFFIX,3lift.com,❌AdBlock
- DOMAIN-SUFFIX,4006825178.com,❌AdBlock
- DOMAIN-SUFFIX,51.la,❌AdBlock
- DOMAIN-SUFFIX,550tg.com,❌AdBlock
- DOMAIN-SUFFIX,56txs4.com,❌AdBlock
- DOMAIN-SUFFIX,ad373.com,❌AdBlock
- DOMAIN-SUFFIX,ad4screen.com,❌AdBlock
- DOMAIN-SUFFIX,ad-brix.com,❌AdBlock
- DOMAIN-SUFFIX,adcolony.com,❌AdBlock
- DOMAIN-SUFFIX,adform.net,❌AdBlock
- DOMAIN-SUFFIX,adinall.com,❌AdBlock
- DOMAIN-SUFFIX,adinfuse.com,❌AdBlock
- DOMAIN-SUFFIX,adjust.com,❌AdBlock
- DOMAIN-SUFFIX,adjust.io,❌AdBlock
- DOMAIN-SUFFIX,adkmob.com,❌AdBlock
- DOMAIN-SUFFIX,adlefee.com,❌AdBlock
- DOMAIN-SUFFIX,admantx.com,❌AdBlock
- DOMAIN-SUFFIX,admarketplace.net,❌AdBlock
- DOMAIN-SUFFIX,admarvel.com,❌AdBlock
- DOMAIN-SUFFIX,admaster.com.cn,❌AdBlock
- DOMAIN-SUFFIX,admob.com,❌AdBlock
- DOMAIN-SUFFIX,adnow.com,❌AdBlock
- DOMAIN-SUFFIX,adnxs.com,❌AdBlock
- DOMAIN-SUFFIX,adsafeprotected.com,❌AdBlock
- DOMAIN-SUFFIX,adsota.com,❌AdBlock
- DOMAIN-SUFFIX,ads-pixiv.net,❌AdBlock
- DOMAIN-SUFFIX,adsrvr.org,❌AdBlock
- DOMAIN-SUFFIX,ads-twitter.com,❌AdBlock
- DOMAIN-SUFFIX,adswizz.com,❌AdBlock
- DOMAIN-SUFFIX,adsymptotic.com,❌AdBlock
- DOMAIN-SUFFIX,adtechus.com,❌AdBlock
- DOMAIN-SUFFIX,adtilt.com,❌AdBlock
- DOMAIN-SUFFIX,adtrue.com,❌AdBlock
- DOMAIN-SUFFIX,❌AdBlock.com,❌AdBlock
- DOMAIN-SUFFIX,advertnative.com,❌AdBlock
- DOMAIN-SUFFIX,adview.cn,❌AdBlock
- DOMAIN-SUFFIX,adxpansion.com,❌AdBlock
- DOMAIN-SUFFIX,adxvip.com,❌AdBlock
- DOMAIN-SUFFIX,aerserv.com,❌AdBlock
- DOMAIN-SUFFIX,agkn.com,❌AdBlock
- DOMAIN-SUFFIX,alipaylog.com,❌AdBlock
- DOMAIN-SUFFIX,amazon-adsystem.com,❌AdBlock
- DOMAIN-SUFFIX,analysys.cn,❌AdBlock
- DOMAIN-SUFFIX,app-adforce.jp,❌AdBlock
- DOMAIN-SUFFIX,appads.com,❌AdBlock
- DOMAIN-SUFFIX,appboy.com,❌AdBlock
- DOMAIN-SUFFIX,appier.net,❌AdBlock
- DOMAIN-SUFFIX,applift.com,❌AdBlock
- DOMAIN-SUFFIX,applovin.com,❌AdBlock
- DOMAIN-SUFFIX,appnext.com,❌AdBlock
- DOMAIN-SUFFIX,appodealx.com,❌AdBlock
- DOMAIN-SUFFIX,appsee.com,❌AdBlock
- DOMAIN-SUFFIX,appsflyer.com,❌AdBlock
- DOMAIN-SUFFIX,apptentive.com,❌AdBlock
- DOMAIN-SUFFIX,apptornado.com,❌AdBlock
- DOMAIN-SUFFIX,atdmt.com,❌AdBlock
- DOMAIN-SUFFIX,atwola.com,❌AdBlock
- DOMAIN-SUFFIX,betrad.com,❌AdBlock
- DOMAIN-SUFFIX,bidswitch.com,❌AdBlock
- DOMAIN-SUFFIX,bjytgw.com,❌AdBlock
- DOMAIN-SUFFIX,bttrack.com,❌AdBlock
- DOMAIN-SUFFIX,bxmns.com,❌AdBlock
- DOMAIN-SUFFIX,cappumedia.com,❌AdBlock
- DOMAIN-SUFFIX,celtra.com,❌AdBlock
- DOMAIN-SUFFIX,cferw.com,❌AdBlock
- DOMAIN-SUFFIX,chartbeat.net,❌AdBlock
- DOMAIN-SUFFIX,chartboost.com,❌AdBlock
- DOMAIN-SUFFIX,chitika.com,❌AdBlock
- DOMAIN-SUFFIX,clickhubs.com,❌AdBlock
- DOMAIN-SUFFIX,clickintext.com,❌AdBlock
- DOMAIN-SUFFIX,clickintext.net,❌AdBlock
- DOMAIN-SUFFIX,cloudmobi.net,❌AdBlock
- DOMAIN-SUFFIX,cnadnet.com,❌AdBlock
- DOMAIN-SUFFIX,cnzz.com,❌AdBlock
- DOMAIN-SUFFIX,cocounion.com,❌AdBlock
- DOMAIN-SUFFIX,conversantmedia.com,❌AdBlock
- DOMAIN-SUFFIX,conviva.com,❌AdBlock
- DOMAIN-SUFFIX,criteo.com,❌AdBlock
- DOMAIN-SUFFIX,crwdcntrl.net,❌AdBlock
- DOMAIN-SUFFIX,ctrmi.com,❌AdBlock
- DOMAIN-SUFFIX,demdex.net,❌AdBlock
- DOMAIN-SUFFIX,dianomi.com,❌AdBlock
- DOMAIN-SUFFIX,digitru.st,❌AdBlock
- DOMAIN-SUFFIX,dtscout.com,❌AdBlock
- DOMAIN-SUFFIX,duapps.com,❌AdBlock
- DOMAIN-SUFFIX,effectivemeasure.net,❌AdBlock
- DOMAIN-SUFFIX,endpo.in,❌AdBlock
- DOMAIN-SUFFIX,eum-appdynamics.com,❌AdBlock
- DOMAIN-SUFFIX,exoclick.com,❌AdBlock
- DOMAIN-SUFFIX,exosrv.com,❌AdBlock
- DOMAIN-SUFFIX,exponential.com,❌AdBlock
- DOMAIN-SUFFIX,exposebox.com,❌AdBlock
- DOMAIN-SUFFIX,eyeota.net,❌AdBlock
- DOMAIN-SUFFIX,eyeviewads.com,❌AdBlock
- DOMAIN-SUFFIX,flurry.com,❌AdBlock
- DOMAIN-SUFFIX,fwmrm.net,❌AdBlock
- DOMAIN-SUFFIX,getrockerbox.com,❌AdBlock
- DOMAIN-SUFFIX,go2cloud.org,❌AdBlock
- DOMAIN-SUFFIX,go-mpulse.net,❌AdBlock
- DOMAIN-SUFFIX,gowadogo.com,❌AdBlock
- DOMAIN-SUFFIX,growingio.com,❌AdBlock
- DOMAIN-SUFFIX,gwallet.com,❌AdBlock
- DOMAIN-SUFFIX,i2000.xyz,❌AdBlock
- DOMAIN-SUFFIX,igexin.com,❌AdBlock
- DOMAIN-SUFFIX,i-mobile.co.jp,❌AdBlock
- DOMAIN-SUFFIX,imrworldwide.com,❌AdBlock
- DOMAIN-SUFFIX,indexww.com,❌AdBlock
- DOMAIN-SUFFIX,inmobi.cn,❌AdBlock
- DOMAIN-SUFFIX,inmobi.com,❌AdBlock
- DOMAIN-SUFFIX,instabug.com,❌AdBlock
- DOMAIN-SUFFIX,irs01.com,❌AdBlock
- DOMAIN-SUFFIX,juicyads.com,❌AdBlock
- DOMAIN-SUFFIX,kejet.net,❌AdBlock
- DOMAIN-SUFFIX,knlob.com,❌AdBlock
- DOMAIN-SUFFIX,kochava.com,❌AdBlock
- DOMAIN-SUFFIX,koolmediaoffers.com,❌AdBlock
- DOMAIN-SUFFIX,krxd.net,❌AdBlock
- DOMAIN-SUFFIX,leadzu.com,❌AdBlock
- DOMAIN-SUFFIX,leanplum.com,❌AdBlock
- DOMAIN-SUFFIX,lenzmx.com,❌AdBlock
- DOMAIN-SUFFIX,lifestreet.com,❌AdBlock
- DOMAIN-SUFFIX,lifestreetmedia.com,❌AdBlock
- DOMAIN-SUFFIX,ligatus.com,❌AdBlock
- DOMAIN-SUFFIX,lnk0.com,❌AdBlock
- DOMAIN-SUFFIX,luomi.com,❌AdBlock
- DOMAIN-SUFFIX,madserving.com,❌AdBlock
- DOMAIN-SUFFIX,mathtag.com,❌AdBlock
- DOMAIN-SUFFIX,media.net,❌AdBlock
- DOMAIN-SUFFIX,medialytics.com,❌AdBlock
- DOMAIN-SUFFIX,metalex.io,❌AdBlock
- DOMAIN-SUFFIX,mfadsrvr.com,❌AdBlock
- DOMAIN-SUFFIX,mgid.com,❌AdBlock
- DOMAIN-SUFFIX,miaozhen.com,❌AdBlock
- DOMAIN-SUFFIX,moatads.com,❌AdBlock
- DOMAIN-SUFFIX,mobileapptracking.com,❌AdBlock
- DOMAIN-SUFFIX,mobiw.com,❌AdBlock
- DOMAIN-SUFFIX,mojiva.com,❌AdBlock
- DOMAIN-SUFFIX,mopub.com,❌AdBlock
- DOMAIN-SUFFIX,mparticle.com,❌AdBlock
- DOMAIN-SUFFIX,mxpnl.com,❌AdBlock
- DOMAIN-SUFFIX,mybest.app,❌AdBlock
- DOMAIN-SUFFIX,mydas.mobi,❌AdBlock
- DOMAIN-SUFFIX,nexage.com,❌AdBlock
- DOMAIN-SUFFIX,nr-data.net,❌AdBlock
- DOMAIN-SUFFIX,offerstrack.net,❌AdBlock
- DOMAIN-SUFFIX,omtrdc.net,❌AdBlock
- DOMAIN-SUFFIX,outbrain.com,❌AdBlock
- DOMAIN-SUFFIX,parsely.com,❌AdBlock
- DOMAIN-SUFFIX,peak-adx.com,❌AdBlock
- DOMAIN-SUFFIX,personaly.click,❌AdBlock
- DOMAIN-SUFFIX,popads.com,❌AdBlock
- DOMAIN-SUFFIX,popads.net,❌AdBlock
- DOMAIN-SUFFIX,propellerads.com,❌AdBlock
- DOMAIN-SUFFIX,pubnative.net,❌AdBlock
- DOMAIN-SUFFIX,qchannel01.cn,❌AdBlock
- DOMAIN-SUFFIX,qualtrics.com,❌AdBlock
- DOMAIN-SUFFIX,quantserve.com,❌AdBlock
- DOMAIN-SUFFIX,quixdtrk.com,❌AdBlock
- DOMAIN-SUFFIX,rayjump.com,❌AdBlock
- DOMAIN-SUFFIX,rubiconproject.com,❌AdBlock
- DOMAIN-SUFFIX,scorecardresearch.com,❌AdBlock
- DOMAIN-SUFFIX,serving-sys.com,❌AdBlock
- DOMAIN-SUFFIX,simplepath.com,❌AdBlock
- DOMAIN-SUFFIX,skimresources.com,❌AdBlock
- DOMAIN-SUFFIX,smardroid.com,❌AdBlock
- DOMAIN-SUFFIX,smartadserver.com,❌AdBlock
- DOMAIN-SUFFIX,snnd.co,❌AdBlock
- DOMAIN-SUFFIX,sonobi.com,❌AdBlock
- DOMAIN-SUFFIX,starmobs.com,❌AdBlock
- DOMAIN-SUFFIX,startappexchange.com,❌AdBlock
- DOMAIN-SUFFIX,startappservice.com,❌AdBlock
- DOMAIN-SUFFIX,storygize.net,❌AdBlock
- DOMAIN-SUFFIX,summerhamster.com,❌AdBlock
- DOMAIN-SUFFIX,supersonicads.com,❌AdBlock
- DOMAIN-SUFFIX,taboola.com,❌AdBlock
- DOMAIN-SUFFIX,tagtic.cn,❌AdBlock
- DOMAIN-SUFFIX,talkingdata.com,❌AdBlock
- DOMAIN-SUFFIX,tango-deg.com,❌AdBlock
- DOMAIN-SUFFIX,tanv.com,❌AdBlock
- DOMAIN-SUFFIX,tanx.com,❌AdBlock
- DOMAIN-SUFFIX,tapad.com,❌AdBlock
- DOMAIN-SUFFIX,taplytics.com,❌AdBlock
- DOMAIN-SUFFIX,taptica.com,❌AdBlock
- DOMAIN-SUFFIX,testplus.cn,❌AdBlock
- DOMAIN-SUFFIX,trackclickers.com,❌AdBlock
- DOMAIN-SUFFIX,trafficjunky.net,❌AdBlock
- DOMAIN-SUFFIX,trustx.org,❌AdBlock
- DOMAIN-SUFFIX,tuanxue360.net,❌AdBlock
- DOMAIN-SUFFIX,turn.com,❌AdBlock
- DOMAIN-SUFFIX,uberads.com,❌AdBlock
- DOMAIN-SUFFIX,udrig.com,❌AdBlock
- DOMAIN-SUFFIX,upcpi.com,❌AdBlock
- DOMAIN-SUFFIX,urbanairship.com,❌AdBlock
- DOMAIN-SUFFIX,usebutton.com,❌AdBlock
- DOMAIN-SUFFIX,voiceads.cn,❌AdBlock
- DOMAIN-SUFFIX,vrtcal.com,❌AdBlock
- DOMAIN-SUFFIX,vserv.mobi,❌AdBlock
- DOMAIN-SUFFIX,vungle.com,❌AdBlock
- DOMAIN-SUFFIX,webspectator.com,❌AdBlock
- DOMAIN-SUFFIX,xadchina.cn,❌AdBlock
- DOMAIN-SUFFIX,xdrig.com,❌AdBlock
- DOMAIN-SUFFIX,yldbt.com,❌AdBlock
- DOMAIN-SUFFIX,yllix.com,❌AdBlock
- DOMAIN-SUFFIX,ymtracking.com,❌AdBlock

- DOMAIN-SUFFIX,ad.daum.net,❌AdBlock
- DOMAIN-SUFFIX,track.xiachufang.com,❌AdBlock
- DOMAIN,log.umsns.com,❌AdBlock
- DOMAIN,log.snssdk.com,❌AdBlock
- DOMAIN,toblog.snssdk.com,❌AdBlock
- DOMAIN,wgo.mmstat.com,❌AdBlock
- DOMAIN,report.jpush.cn,❌AdBlock
- DOMAIN,static.jpush.cn,❌AdBlock
- DOMAIN,stats.jpush.cn,❌AdBlock
- DOMAIN,stats.umsns.com,❌AdBlock
- DOMAIN,s0.2mdn.net,❌AdBlock
- DOMAIN,appnext.hs.llnwd.net,❌AdBlock
- DOMAIN,appnext-a.akamaihd.net,❌AdBlock

- DOMAIN,abema-adx.ameba.jp,❌AdBlock
- DOMAIN,ad.12306.cn,❌AdBlock
- DOMAIN,ad.caiyunapp.com,❌AdBlock
- DOMAIN,ad.huajiao.com,❌AdBlock
- DOMAIN,ad.hzyoka.com,❌AdBlock
- DOMAIN,ad.jiemian.com,❌AdBlock
- DOMAIN,ad.qingting.fm,❌AdBlock
- DOMAIN,ad-cn.jovcloud.com,❌AdBlock
- DOMAIN,adsapi.manhuaren.com,❌AdBlock
- DOMAIN,adsdk.dmzj.com,❌AdBlock
- DOMAIN,ads.daydaycook.com.cn,❌AdBlock
- DOMAIN,adui.tg.meitu.com,❌AdBlock
- DOMAIN,adx.hupu.com,❌AdBlock
- DOMAIN,adxserver.ad.cmvideo.cn,❌AdBlock
- DOMAIN,app-ad.variflight.com,❌AdBlock
- DOMAIN,applog.mobike.com,❌AdBlock
- DOMAIN,ggs.myzaker.com,❌AdBlock
- DOMAIN,ja.chushou.tv,❌AdBlock
- DOMAIN,log.b612kaji.com,❌AdBlock
- DOMAIN,log.star.ele.me,❌AdBlock
- DOMAIN,log.voicecloud.cn,❌AdBlock
- DOMAIN,log.ys7.com,❌AdBlock
- DOMAIN,logs.chelaile.net.cn,❌AdBlock
- DOMAIN,mopnativeadv.037201.com,❌AdBlock
- DOMAIN,nativeadv.dftoutiao.com,❌AdBlock
- DOMAIN,optimus-ads.amap.com,❌AdBlock
- DOMAIN,static.vuevideo.net,❌AdBlock
- DOMAIN,sugar.zhihu.com,❌AdBlock
- DOMAIN,track.tiara.daum.net,❌AdBlock
- DOMAIN,track.tiara.kakao.com,❌AdBlock
- DOMAIN,trackapp.guahao.cn,❌AdBlock
- DOMAIN,traffic.mogujie.com,❌AdBlock
- DOMAIN,wmlog.meituan.com,❌AdBlock

# (0~9)
# > 58
- DOMAIN,adshow.58.com,❌AdBlock
- DOMAIN,track.58.com,❌AdBlock
- DOMAIN,tracklog.58.com,❌AdBlock
# (A)
# > Apple
- DOMAIN-SUFFIX,iadsdk.apple.com,❌AdBlock
- DOMAIN-SUFFIX,ads.internal.unity3d.com,❌AdBlock
- DOMAIN-SUFFIX,ads.prd.ie.internal.unity3d.com,❌AdBlock
- DOMAIN-SUFFIX,unityads.unity3d.com,❌AdBlock
# > Alibaba
- DOMAIN,acs4baichuan.m.taobao.com,❌AdBlock
- DOMAIN,adash.m.taobao.com,❌AdBlock
- DOMAIN,adash.man.aliyuncs.com,❌AdBlock
- DOMAIN,adashbc.ut.taobao.com,❌AdBlock
- DOMAIN,adash-c.ut.taobao.com,❌AdBlock
- DOMAIN,adashxgc.ut.taobao.com,❌AdBlock
- DOMAIN,adashx4yt.m.taobao.com,❌AdBlock
- DOMAIN,amdc.m.taobao.com,❌AdBlock
- DOMAIN,apoll.m.taobao.com,❌AdBlock
- DOMAIN,nbsdk-baichuan.alicdn.com,❌AdBlock
- DOMAIN,tunion-api.m.taobao.com,❌AdBlock
# > AutoHome
- DOMAIN,adProxy.autohome.com.cn,❌AdBlock
- DOMAIN,rd.autohome.com.cn,❌AdBlock
- DOMAIN,al.autohome.com.cn,❌AdBlock
- DOMAIN,applogapi.autohome.com.cn,❌AdBlock
# (B)
# > Baidu
- DOMAIN-SUFFIX,baidustatic.com,❌AdBlock
- DOMAIN,afd.baidu.com,❌AdBlock
- DOMAIN,duclick.baidu.com,❌AdBlock
- DOMAIN,hm.baidu.com,❌AdBlock
- DOMAIN,hmma.baidu.com,❌AdBlock
- DOMAIN,mobads.baidu.com,❌AdBlock
- DOMAIN,mobads-logs.baidu.com,❌AdBlock
- DOMAIN,nsclick.baidu.com,❌AdBlock
- DOMAIN,wn.pos.baidu.com,❌AdBlock
# > ByteDance
- DOMAIN,applog.musical.ly,❌AdBlock
- DOMAIN,track.toutiao.com,❌AdBlock
- DOMAIN,xlog.snssdk.com,❌AdBlock
- DOMAIN,xlog-va.byteoversea.com,❌AdBlock
# > BitAuto
- DOMAIN,adx.yiche.com,❌AdBlock
- DOMAIN,log.ycapp.yiche.com,❌AdBlock
# > Baicizhan
- DOMAIN,advertise.baicizhan.org,❌AdBlock
- DOMAIN,advertise.baicizhan.com,❌AdBlock
# (C)
# > CNTV
- DOMAIN,galaxy.bjcathay.com,❌AdBlock
- DOMAIN,mdrecv.app.cntvwb.cn,❌AdBlock
- DOMAIN,sdapprecv.app.cntvwb.cn,❌AdBlock
- DOMAIN,vdapprecv.app.cntvwb.cn,❌AdBlock
# > ChinaNet
- DOMAIN,admarket.21cn.com,❌AdBlock
- DOMAIN,adshows.21cn.com,❌AdBlock
# (G)
# > Google
- DOMAIN-SUFFIX,doubleclick.net,❌AdBlock
- DOMAIN-SUFFIX,googleadservices.com,❌AdBlock
- DOMAIN-SUFFIX,googleadsserving.cn,❌AdBlock
- DOMAIN-SUFFIX,googlesyndication.com,❌AdBlock
- DOMAIN-SUFFIX,googletagmanager.com,❌AdBlock
- DOMAIN-SUFFIX,googletagservices.com,❌AdBlock
- DOMAIN-SUFFIX,google-analytics.com,❌AdBlock
# (H)
# > HunanTV
- DOMAIN-SUFFIX,da.mgtv.com,❌AdBlock
- DOMAIN-SUFFIX,da.hunantv.com,❌AdBlock
- DOMAIN-SUFFIX,log.hunantv.com,❌AdBlock
- DOMAIN,log.v2.hunantv.com,❌AdBlock
- DOMAIN,v2.log.hunantv.com,❌AdBlock
# (I)
# > iQiyi
- DOMAIN,ifacelog.iqiyi.com,❌AdBlock
- DOMAIN,mbdlog.iqiyi.com,❌AdBlock
- DOMAIN,msg.71.am,❌AdBlock
- DOMAIN,msg.qy.net,❌AdBlock
- DOMAIN,t7z.cupid.iqiyi.com,❌AdBlock

# (K)
# > KuGou and Kuwo
- DOMAIN,adserviceretry.kugou.com,❌AdBlock
- DOMAIN,ads.service.kugou.com,❌AdBlock
- DOMAIN,adsfile.bssdlbig.kugou.com,❌AdBlock
- DOMAIN,log.stat.kugou.com,❌AdBlock
- DOMAIN,log.web.kugou.com,❌AdBlock
- DOMAIN,kgmobilestat.kugou.com,❌AdBlock
- DOMAIN,kgmobilestatbak.kugou.com,❌AdBlock
- DOMAIN,mobilelog.kugou.com,❌AdBlock
- DOMAIN,mobilead.kuwo.cn,❌AdBlock
- DOMAIN,rich.kuwo.cn,❌AdBlock
# > Kingsoft
- DOMAIN,ad-stat.ksosoft.com,❌AdBlock
- DOMAIN,img.auction-ads.wpscdn.cn,❌AdBlock
# (L)
# > Le
- DOMAIN-SUFFIX,webp2p.letv.com,❌AdBlock
- DOMAIN,ark.letv.com,❌AdBlock
- DOMAIN,emma-414870e223.huodonghezi.com,❌AdBlock
- DOMAIN,g3.letv.com,❌AdBlock
- DOMAIN,n.mark.letv.com,❌AdBlock
# (M)
# > MI
- DOMAIN-SUFFIX,ad.xiaomi.com,❌AdBlock
- DOMAIN-SUFFIX,admob.xiaomi.com,❌AdBlock
- DOMAIN-SUFFIX,ad.intl.xiaomi.com,❌AdBlock
- DOMAIN-SUFFIX,data.mistat.xiaomi.com,❌AdBlock
- DOMAIN-SUFFIX,tracking.miui.com,❌AdBlock
- DOMAIN,adv.sec.miui.com,❌AdBlock
- DOMAIN,adv.sec.intl.miui.com,❌AdBlock
- DOMAIN,o2o.api.xiaomi.com,❌AdBlock
# > Moji
- DOMAIN,ad.api.moji.com,❌AdBlock
- DOMAIN,adlaunch.moji.com,❌AdBlock
- DOMAIN,ads.mojicdn.com,❌AdBlock
- DOMAIN,v1.log.moji.com,❌AdBlock
- DOMAIN,minfo.wps.cn,❌AdBlock
# (N)
# > NetEase
- DOMAIN,ad.bn.netease.com,❌AdBlock
- DOMAIN,ad.yixin.im,❌AdBlock
- DOMAIN,admusicpic.music.126.net,❌AdBlock
- DOMAIN,iadmat.nosdn.127.net,❌AdBlock
- DOMAIN,iadmusicmat.music.126.net,❌AdBlock
- DOMAIN,iadmusicmatvideo.music.126.net,❌AdBlock
- DOMAIN,impservice.dictapp.youdao.com,❌AdBlock
- DOMAIN,impservice.youdao.com,❌AdBlock
- DOMAIN,log.yex.youdao.com,❌AdBlock
- DOMAIN,log-yex.youdao.com,❌AdBlock
- DOMAIN,n.3g.163.com,❌AdBlock
- DOMAIN,nex.163.com,❌AdBlock
- DOMAIN,yt-adp.nosdn.127.net,❌AdBlock
# (P)
# > PPTV
- DOMAIN,ads.aplus.pptv.com,❌AdBlock
- DOMAIN,asimgs.pplive.cn,❌AdBlock
- DOMAIN,de.as.pptv.com,❌AdBlock
# > Photoable
- DOMAIN,regist.fotoable.com,❌AdBlock
- DOMAIN,cdn.adapi.fotoable.com,❌AdBlock
# > PeanutWiFiMpass
- DOMAIN,adnew.wifi8.com,❌AdBlock
- DOMAIN,adfile.wifi8.com,❌AdBlock
# (S)
# > Sina
- DOMAIN,u1.img.mobile.sina.cn,❌AdBlock
- DOMAIN,sax.sina.com.cn,❌AdBlock
- DOMAIN,saxs.sina.com.cn,❌AdBlock
- DOMAIN,saxn.sina.com.cn,❌AdBlock
# > Sohu
- DOMAIN-SUFFIX,ads.sohu.com,❌AdBlock
- DOMAIN-SUFFIX,aty.sohu.com,❌AdBlock
- DOMAIN,imp.optaim.com,❌AdBlock
- DOMAIN,v2.reachmax.cn,❌AdBlock
- DOMAIN,track.sohu.com,❌AdBlock
- DOMAIN,hui.sohu.com,❌AdBlock
# (T)
# > Tencent
- DOMAIN-SUFFIX,e.qq.com,❌AdBlock
- DOMAIN-SUFFIX,gdt.qq.com,❌AdBlock
- DOMAIN-SUFFIX,rqd.qq.com,❌AdBlock
- DOMAIN,btrace.qq.com,❌AdBlock
- DOMAIN,mtrace.qq.com,❌AdBlock
- DOMAIN,oth.eve.mdt.qq.com,❌AdBlock
- DOMAIN,pingma.qq.com,❌AdBlock
- DOMAIN,pingtcss.qq.com,❌AdBlock
- DOMAIN,splashqqlive.gtimg.com,❌AdBlock
- DOMAIN,tajs.qq.com,❌AdBlock
# > The Paper
- DOMAIN,imgadpai.thepaper.cn,❌AdBlock
- DOMAIN,admonitor.thepaper.cn,❌AdBlock
# > Thunder
#- DOMAIN,adsp.xunlei.com,❌AdBlock
#- DOMAIN,etl.xlmc.sandai.net,❌AdBlock
# > Tonghuashun
- DOMAIN,adm.10jqka.com.cn,❌AdBlock
- DOMAIN,stat.10jqka.com.cn,❌AdBlock
# > Taipingyang
- DOMAIN,ad-analysis.pconline.com.cn,❌AdBlock
- DOMAIN,iad0ssl.pcauto.com.cn,❌AdBlock
- DOMAIN,iad0ssl.pconline.com.cn,❌AdBlock
- DOMAIN,imgad0.pcauto.com.cn,❌AdBlock
- DOMAIN,imgad0.pconline.com.cn,❌AdBlock
- DOMAIN,ivy.pchouse.com.cn,❌AdBlock
# (U)
# > UC
- DOMAIN,adtrack.ucweb.com,❌AdBlock
- DOMAIN,applogios.uc.cn,❌AdBlock
- DOMAIN,track.uc.cn,❌AdBlock
# (W)
# > WiFi Key
- DOMAIN,a.wkanx.com,❌AdBlock
- DOMAIN,cwx.lianwangtech.com,❌AdBlock
- DOMAIN,c1wx.lianwangtech.com,❌AdBlock
# (X)
# > Ximalaya
- DOMAIN,ad.ximalaya.com,❌AdBlock
- DOMAIN,adse.ximalaya.com,❌AdBlock
# > Xiaohongshu
- DOMAIN,t-ads.xiaohongshu.com,❌AdBlock
- DOMAIN,apm-track.xiaohongshu.com,❌AdBlock
# (Y)
# > Youku
- DOMAIN-SUFFIX,atm.youku.com,❌AdBlock
- DOMAIN,ad.mobile.youku.com,❌AdBlock
- DOMAIN,iyes.youku.com,❌AdBlock
# (Z)
# > ZOL
- DOMAIN,apppv.zol.com.cn,❌AdBlock
- DOMAIN,pvnapp.zol.com.cn,❌AdBlock

# Internet Service Provider ❌AdBlock Protection
- DOMAIN-SUFFIX,17gouwuba.com,❌AdBlock
- DOMAIN-SUFFIX,189zj.cn,❌AdBlock
- DOMAIN-SUFFIX,285680.com,❌AdBlock
- DOMAIN-SUFFIX,3721zh.com,❌AdBlock
- DOMAIN-SUFFIX,4336wang.cn,❌AdBlock
- DOMAIN-SUFFIX,51chumoping.com,❌AdBlock
- DOMAIN-SUFFIX,58mingri.cn,❌AdBlock
- DOMAIN-SUFFIX,58mingtian.cn,❌AdBlock
- DOMAIN-SUFFIX,6d63d3.com,❌AdBlock
- DOMAIN-SUFFIX,91veg.com,❌AdBlock
- DOMAIN-SUFFIX,9s6q.cn,❌AdBlock
- DOMAIN-SUFFIX,adsame.com,❌AdBlock
- DOMAIN-SUFFIX,aiclk.com,❌AdBlock
- DOMAIN-SUFFIX,akuai.top,❌AdBlock
- DOMAIN-SUFFIX,atplay.cn,❌AdBlock
- DOMAIN-SUFFIX,baiwanchuangyi.com,❌AdBlock
- DOMAIN-SUFFIX,bayimob.com,❌AdBlock
- DOMAIN-SUFFIX,beerto.cn,❌AdBlock
- DOMAIN-SUFFIX,beilamusi.com,❌AdBlock
- DOMAIN-SUFFIX,benshiw.net,❌AdBlock
- DOMAIN-SUFFIX,bianxianmao.com,❌AdBlock
- DOMAIN-SUFFIX,bryonypie.com,❌AdBlock
- DOMAIN-SUFFIX,cishantao.com,❌AdBlock
- DOMAIN-SUFFIX,cszlks.com,❌AdBlock
- DOMAIN-SUFFIX,cudaojia.com,❌AdBlock
- DOMAIN-SUFFIX,dafapromo.com,❌AdBlock
- DOMAIN-SUFFIX,daitdai.com,❌AdBlock
- DOMAIN-SUFFIX,dsaeerf.com,❌AdBlock
- DOMAIN-SUFFIX,dugesheying.com,❌AdBlock
- DOMAIN-SUFFIX,dv8c1t.cn,❌AdBlock
- DOMAIN-SUFFIX,erdoscs.com,❌AdBlock
- DOMAIN-SUFFIX,fan-yong.com,❌AdBlock
- DOMAIN-SUFFIX,feih.com.cn,❌AdBlock
- DOMAIN-SUFFIX,fjlqqc.com,❌AdBlock
- DOMAIN-SUFFIX,fkku194.com,❌AdBlock
- DOMAIN-SUFFIX,freedrive.cn,❌AdBlock
- DOMAIN-SUFFIX,gclick.cn,❌AdBlock
- DOMAIN-SUFFIX,goufanli100.com,❌AdBlock
- DOMAIN-SUFFIX,gouwubang.com,❌AdBlock
- DOMAIN-SUFFIX,haoshengtoys.com,❌AdBlock
- DOMAIN-SUFFIX,ichaosheng.com,❌AdBlock
- DOMAIN-SUFFIX,ishop789.com,❌AdBlock
- DOMAIN-SUFFIX,jdkic.com,❌AdBlock
- DOMAIN-SUFFIX,jiubuhua.com,❌AdBlock
- DOMAIN-SUFFIX,jwg365.cn,❌AdBlock
- DOMAIN-SUFFIX,kumihua.com,❌AdBlock
- DOMAIN-SUFFIX,linktech.cn,❌AdBlock
- DOMAIN-SUFFIX,ltheanine.cn,❌AdBlock
- DOMAIN-SUFFIX,maipinshangmao.com,❌AdBlock
- DOMAIN-SUFFIX,minisplat.cn,❌AdBlock
- DOMAIN-SUFFIX,mkitgfs.com,❌AdBlock
- DOMAIN-SUFFIX,mlnbike.com,❌AdBlock
- DOMAIN-SUFFIX,newapi.com,❌AdBlock
- DOMAIN-SUFFIX,pinzhitmall.com,❌AdBlock
- DOMAIN-SUFFIX,poppyta.com,❌AdBlock
- DOMAIN-SUFFIX,qichexin.com,❌AdBlock
- DOMAIN-SUFFIX,qinchugudao.com,❌AdBlock
- DOMAIN-SUFFIX,quanliyouxi.cn,❌AdBlock
- DOMAIN-SUFFIX,qutaobi.com,❌AdBlock
- DOMAIN-SUFFIX,ry51w.cn,❌AdBlock
- DOMAIN-SUFFIX,sg536.cn,❌AdBlock
- DOMAIN-SUFFIX,sifubo.cn,❌AdBlock
- DOMAIN-SUFFIX,sifuce.cn,❌AdBlock
- DOMAIN-SUFFIX,sifuda.cn,❌AdBlock
- DOMAIN-SUFFIX,sifufu.cn,❌AdBlock
- DOMAIN-SUFFIX,sifuge.cn,❌AdBlock
- DOMAIN-SUFFIX,sifugu.cn,❌AdBlock
- DOMAIN-SUFFIX,sifuhe.cn,❌AdBlock
- DOMAIN-SUFFIX,sifuhu.cn,❌AdBlock
- DOMAIN-SUFFIX,sifuji.cn,❌AdBlock
- DOMAIN-SUFFIX,sifuka.cn,❌AdBlock
- DOMAIN-SUFFIX,smgru.net,❌AdBlock
- DOMAIN-SUFFIX,taoggou.com,❌AdBlock
- DOMAIN-SUFFIX,tcxshop.com,❌AdBlock
- DOMAIN-SUFFIX,tjqonline.cn,❌AdBlock
- DOMAIN-SUFFIX,topitme.com,❌AdBlock
- DOMAIN-SUFFIX,tuia.cn,❌AdBlock
- DOMAIN-SUFFIX,tuipenguin.com,❌AdBlock
- DOMAIN-SUFFIX,tuitiger.com,❌AdBlock
- DOMAIN-SUFFIX,wx16999.com,❌AdBlock
- DOMAIN-SUFFIX,xiaohuau.xyz,❌AdBlock
- DOMAIN-SUFFIX,yinmong.com,❌AdBlock
- DOMAIN-SUFFIX,yiqifa.com,❌AdBlock
- DOMAIN-SUFFIX,yitaopt.com,❌AdBlock
- DOMAIN-SUFFIX,yukhj.com,❌AdBlock
- DOMAIN-SUFFIX,zhaozecheng.cn,❌AdBlock
- DOMAIN-SUFFIX,zhenxinet.com,❌AdBlock
- DOMAIN-SUFFIX,zunmi.cn,❌AdBlock
- DOMAIN-SUFFIX,zzd6.com,❌AdBlock

# Blocklist
- DOMAIN-SUFFIX,kuaizip.com,❌AdBlock
- DOMAIN-SUFFIX,mackeeper.com,❌AdBlock
# > CJ Marketing
- DOMAIN-SUFFIX,4009997658.com,❌AdBlock
- DOMAIN-SUFFIX,abbyychina.com,❌AdBlock
- DOMAIN-SUFFIX,bartender.cc,❌AdBlock
- DOMAIN-SUFFIX,betterzip.net,❌AdBlock
- DOMAIN-SUFFIX,beyondcompare.cc,❌AdBlock
- DOMAIN-SUFFIX,bingdianhuanyuan.cn,❌AdBlock
- DOMAIN-SUFFIX,chemdraw.com.cn,❌AdBlock
- DOMAIN-SUFFIX,cjmakeding.com,❌AdBlock
- DOMAIN-SUFFIX,cjmkt.com,❌AdBlock
- DOMAIN-SUFFIX,codesoftchina.com,❌AdBlock
- DOMAIN-SUFFIX,coreldrawchina.com,❌AdBlock
- DOMAIN-SUFFIX,crossoverchina.com,❌AdBlock
- DOMAIN-SUFFIX,easyrecoverychina.com,❌AdBlock
- DOMAIN-SUFFIX,ediuschina.com,❌AdBlock
- DOMAIN-SUFFIX,flstudiochina.com,❌AdBlock
- DOMAIN-SUFFIX,formysql.com,❌AdBlock
- DOMAIN-SUFFIX,guitarpro.cc,❌AdBlock
- DOMAIN-SUFFIX,huishenghuiying.com.cn,❌AdBlock
- DOMAIN-SUFFIX,hypersnap.net,❌AdBlock
- DOMAIN-SUFFIX,iconworkshop.cn,❌AdBlock
- DOMAIN-SUFFIX,imindmap.cc,❌AdBlock
- DOMAIN-SUFFIX,jihehuaban.com.cn,❌AdBlock
- DOMAIN-SUFFIX,keyshot.cc,❌AdBlock
- DOMAIN-SUFFIX,kingdeecn.cn,❌AdBlock
- DOMAIN-SUFFIX,logoshejishi.com,❌AdBlock
- DOMAIN-SUFFIX,mairuan.cn,❌AdBlock
- DOMAIN-SUFFIX,mairuan.com,❌AdBlock
- DOMAIN-SUFFIX,mairuan.com.cn,❌AdBlock
- DOMAIN-SUFFIX,mairuan.net,❌AdBlock
- DOMAIN-SUFFIX,mairuanwang.com,❌AdBlock
- DOMAIN-SUFFIX,makeding.com,❌AdBlock
- DOMAIN-SUFFIX,mathtype.cn,❌AdBlock
- DOMAIN-SUFFIX,mindmanager.cc,❌AdBlock
- DOMAIN-SUFFIX,mindmapper.cc,❌AdBlock
- DOMAIN-SUFFIX,mycleanmymac.com,❌AdBlock
- DOMAIN-SUFFIX,nicelabel.cc,❌AdBlock
- DOMAIN-SUFFIX,ntfsformac.cc,❌AdBlock
- DOMAIN-SUFFIX,ntfsformac.cn,❌AdBlock
- DOMAIN-SUFFIX,overturechina.com,❌AdBlock
- DOMAIN-SUFFIX,passwordrecovery.cn,❌AdBlock
- DOMAIN-SUFFIX,pdfexpert.cc,❌AdBlock
- DOMAIN-SUFFIX,shankejingling.com,❌AdBlock
- DOMAIN-SUFFIX,ultraiso.net,❌AdBlock
- DOMAIN-SUFFIX,vegaschina.cn,❌AdBlock
- DOMAIN-SUFFIX,xmindchina.net,❌AdBlock
- DOMAIN-SUFFIX,xshellcn.com,❌AdBlock
- DOMAIN-SUFFIX,yihuifu.cn,❌AdBlock
- DOMAIN-SUFFIX,yuanchengxiezuo.com,❌AdBlock
- DOMAIN-SUFFIX,zbrushcn.com,❌AdBlock
- DOMAIN-SUFFIX,zhzzx.com,❌AdBlock
- DOMAIN-KEYWORD,apple,🔑Proxy
- DOMAIN-SUFFIX,search.itunes.apple.com,🔑Proxy
# China Area Network
# > App Store Download || iBooks Sample
- DOMAIN-SUFFIX,itunes.apple.com,🔑Proxy
# > Apple Music
- DOMAIN,aod.itunes.apple.com,🔑Proxy
- DOMAIN,audio.itunes.apple.com,🔑Proxy
- DOMAIN,audio-ssl.itunes.apple.com,🔑Proxy
- DOMAIN,streamingaudio.itunes.apple.com,🔑Proxy
# > Apple TV
- DOMAIN,ocvideo.apple.com,🔑Proxy
# > Apple News and Apple Map TOMTOM Version
- DOMAIN,gspe1-ssl.ls.apple.com,🔑Proxy
#PROCESS-NAME,News,🔑Proxy
#USER-AGENT,AppleNews*,🔑Proxy
# > Apple
- DOMAIN-SUFFIX,aaplimg.com,🔑Proxy
- DOMAIN-SUFFIX,apple.co,🔑Proxy
- DOMAIN-SUFFIX,apple.com,🔑Proxy
- DOMAIN-SUFFIX,appstore.com,🔑Proxy
- DOMAIN-SUFFIX,cdn-apple.com,🔑Proxy
- DOMAIN-SUFFIX,crashlytics.com,🔑Proxy
- DOMAIN-SUFFIX,icloud.com,🔑Proxy
- DOMAIN-SUFFIX,icloud-content.com,🔑Proxy
- DOMAIN-SUFFIX,me.com,🔑Proxy
- DOMAIN-SUFFIX,mzstatic.com,🔑Proxy
# > Microsoft
- DOMAIN-SUFFIX,microsoft.com,🖥️AsianTV
- DOMAIN-SUFFIX,windows.net,🖥️AsianTV
- DOMAIN-SUFFIX,sfx.ms,🖥️AsianTV
- DOMAIN-SUFFIX,sharepoint.com,🖥️AsianTV
- DOMAIN-KEYWORD,officecdn,🖥️AsianTV
# > Blizzard
- DOMAIN-SUFFIX,blizzard.com,🖥️AsianTV
- DOMAIN-SUFFIX,battle.net,🖥️AsianTV
- DOMAIN,blzddist1-a.akamaihd.net,🖥️AsianTV
# > Steam
- DOMAIN-SUFFIX,steampowered.com,🖥️AsianTV
- DOMAIN-SUFFIX,steam-chat.com,🖥️AsianTV
- DOMAIN-KEYWORD,steamcdn,🖥️AsianTV
- DOMAIN-KEYWORD,steamstore,🖥️AsianTV
- DOMAIN-KEYWORD,steamuserimages,🖥️AsianTV
- DOMAIN-KEYWORD,steambroadcast,🖥️AsianTV
# > Tencent
#USER-AGENT,MicroMessenger%20Client,🖥️AsianTV
#USER-AGENT,WeChat*,🖥️AsianTV
- DOMAIN-SUFFIX,qq.com,🖥️AsianTV
- DOMAIN-SUFFIX,qpic.cn,🖥️AsianTV
- DOMAIN-SUFFIX,tencent.com,🖥️AsianTV
# > Alibaba
- DOMAIN-SUFFIX,alibaba.com,🖥️AsianTV
- DOMAIN-SUFFIX,alicdn.com,🖥️AsianTV
- DOMAIN-SUFFIX,amap.com,🖥️AsianTV
- DOMAIN-SUFFIX,dingtalk.com,🖥️AsianTV
- DOMAIN-SUFFIX,taobao.com,🖥️AsianTV
- DOMAIN-SUFFIX,tmall.com,🖥️AsianTV
- DOMAIN-SUFFIX,ykimg.com,🖥️AsianTV
- DOMAIN-SUFFIX,youku.com,🖥️AsianTV
- DOMAIN-SUFFIX,xiami.com,🖥️AsianTV
- DOMAIN-SUFFIX,xiami.net,🖥️AsianTV
# > NetEase
- DOMAIN-SUFFIX,163.com,🖥️AsianTV
- DOMAIN-SUFFIX,126.net,🖥️AsianTV
- DOMAIN-SUFFIX,163yun.com,🖥️AsianTV
# > Sohu
- DOMAIN-SUFFIX,sohu.com.cn,🖥️AsianTV
- DOMAIN-SUFFIX,itc.cn,🖥️AsianTV
- DOMAIN-SUFFIX,sohu.com,🖥️AsianTV
- DOMAIN-SUFFIX,v-56.com,🖥️AsianTV
# > Sina
- DOMAIN-SUFFIX,weibo.com,🖥️AsianTV
- DOMAIN-SUFFIX,weibo.cn,🖥️AsianTV
# > JD
- DOMAIN-SUFFIX,jd.com,🖥️AsianTV
- DOMAIN-SUFFIX,jd.hk,🖥️AsianTV
- DOMAIN-SUFFIX,360buyimg.com,🖥️AsianTV
# > MI
- DOMAIN-SUFFIX,duokan.com,🖥️AsianTV
- DOMAIN-SUFFIX,mi-img.com,🖥️AsianTV
- DOMAIN-SUFFIX,mifile.cn,🖥️AsianTV
- DOMAIN-SUFFIX,xiaomi.com,🖥️AsianTV
# > bilibili
- DOMAIN-SUFFIX,acgvideo.com,🖥️AsianTV
- DOMAIN-SUFFIX,bilibili.com,🖥️AsianTV
- DOMAIN-SUFFIX,hdslb.com,🖥️AsianTV
# > iQiyi
- DOMAIN-SUFFIX,iqiyi.com,🖥️AsianTV
- DOMAIN-SUFFIX,iqiyipic.com,🖥️AsianTV
- DOMAIN-SUFFIX,71.am.com,🖥️AsianTV
# > HunanTV
- DOMAIN-SUFFIX,hitv.com,🖥️AsianTV
- DOMAIN-SUFFIX,mgtv.com,🖥️AsianTV
# > Meitu
- DOMAIN-SUFFIX,meitu.com,🖥️AsianTV
- DOMAIN-SUFFIX,meitudata.com,🖥️AsianTV
- DOMAIN-SUFFIX,meipai.com,🖥️AsianTV
# > YYeTs
- DOMAIN-SUFFIX,zmzapi.com,🖥️AsianTV
- DOMAIN-SUFFIX,zimuzu.tv,🖥️AsianTV
- DOMAIN-SUFFIX,zmzfile.com,🖥️AsianTV
- DOMAIN-SUFFIX,zmzapi.net,🖥️AsianTV
# > 蛋蛋赞
- DOMAIN-SUFFIX,baduziyuan.com,🖥️AsianTV
- DOMAIN-SUFFIX,com-hs-hkdy.com,🖥️AsianTV
- DOMAIN-SUFFIX,czybjz.com,🖥️AsianTV
- DOMAIN-SUFFIX,dandanzan.com,🖥️AsianTV
- DOMAIN-SUFFIX,fjhps.com,🖥️AsianTV
- DOMAIN-SUFFIX,kuyunbo.club,🖥️AsianTV
# > Baidu
- DOMAIN-SUFFIX,baidu.com,🖥️AsianTV
- DOMAIN-SUFFIX,baidubcr.com,🖥️AsianTV
- DOMAIN-SUFFIX,bdstatic.com,🖥️AsianTV
# > ChinaNet
- DOMAIN-SUFFIX,189.cn,🖥️AsianTV
- DOMAIN-SUFFIX,21cn.com,🖥️AsianTV
# > ByteDance
- DOMAIN-SUFFIX,bytecdn.cn,🖥️AsianTV
- DOMAIN-SUFFIX,pstatp.com,🖥️AsianTV
- DOMAIN-SUFFIX,snssdk.com,🖥️AsianTV
- DOMAIN-SUFFIX,toutiao.com,🖥️AsianTV
# > Content Delivery Network
# > Akamai
- DOMAIN-SUFFIX,akadns.net,🖥️AsianTV
# - DOMAIN-SUFFIX,akamai.net,🖥️AsianTV
# - DOMAIN-SUFFIX,akamaiedge.net,🖥️AsianTV
# - DOMAIN-SUFFIX,akamaihd.net,🖥️AsianTV
# - DOMAIN-SUFFIX,akamaistream.net,🖥️AsianTV
# - DOMAIN-SUFFIX,akamaized.net,🖥️AsianTV
# > ChinaNetCenter
- DOMAIN-SUFFIX,chinanetcenter.com,🖥️AsianTV
- DOMAIN-SUFFIX,wangsu.com,🖥️AsianTV
# > CloudFlare
- DOMAIN-SUFFIX,cloudflare.com,🔑Proxy
- DOMAIN-KEYWORD,cloudflare,🔑Proxy
# > IP Query
- DOMAIN-SUFFIX,ipip.net,🖥️AsianTV
- DOMAIN-SUFFIX,ip.cn,🖥️AsianTV
- DOMAIN-SUFFIX,ip.la,🖥️AsianTV
- DOMAIN-SUFFIX,ip-cdn.com,🖥️AsianTV
- DOMAIN-SUFFIX,ipv6-test.com,🖥️AsianTV
- DOMAIN-SUFFIX,test-ipv6.com,🖥️AsianTV
- DOMAIN-SUFFIX,whatismyip.com,🖥️AsianTV
- DOMAIN,ip.bjango.com,🖥️AsianTV
# > Other
- DOMAIN-SUFFIX,40017.cn,🖥️AsianTV
- DOMAIN-SUFFIX,cailianpress.com,🖥️AsianTV
- DOMAIN-SUFFIX,chdbits.co,🖥️AsianTV
- DOMAIN-SUFFIX,chushou.tv,🖥️AsianTV
- DOMAIN-SUFFIX,cmbchina.com,🖥️AsianTV
- DOMAIN-SUFFIX,cmbimg.com,🖥️AsianTV
- DOMAIN-SUFFIX,cmct.tv,🖥️AsianTV
- DOMAIN-SUFFIX,cmvideo.cn,🖥️AsianTV
- DOMAIN-SUFFIX,cnlang.org,🖥️AsianTV
- DOMAIN-SUFFIX,doubanio.com,🖥️AsianTV
- DOMAIN-SUFFIX,douyu.com,🖥️AsianTV
- DOMAIN-SUFFIX,douyucdn.cn,🖥️AsianTV
- DOMAIN-SUFFIX,dxycdn.com,🖥️AsianTV
- DOMAIN-SUFFIX,hicloud.com,🖥️AsianTV
- DOMAIN-SUFFIX,hdchina.org,🖥️AsianTV
- DOMAIN-SUFFIX,hdcmct.org,🖥️AsianTV
- DOMAIN-SUFFIX,ithome.com,🖥️AsianTV
- DOMAIN-SUFFIX,kkmh.com,🖥️AsianTV
- DOMAIN-SUFFIX,ksosoft.com,🖥️AsianTV
- DOMAIN-SUFFIX,maoyun.tv,🖥️AsianTV
- DOMAIN-SUFFIX,meituan.net,🖥️AsianTV
- DOMAIN-SUFFIX,mobike.com,🖥️AsianTV
- DOMAIN-SUFFIX,mubu.com,🖥️AsianTV
- DOMAIN-SUFFIX,myzaker.com,🖥️AsianTV
- DOMAIN-SUFFIX,ourbits.club,🖥️AsianTV
- DOMAIN-SUFFIX,passthepopcorn.me,🖥️AsianTV
- DOMAIN-SUFFIX,paypal.com,🔑Proxy
- DOMAIN-KEYWORD,paypal,🔑Proxy
- DOMAIN-SUFFIX,paypalobjects.com,🔑Proxy
- DOMAIN-SUFFIX,privatehd.to,🖥️AsianTV
- DOMAIN-SUFFIX,redacted.ch,🖥️AsianTV
- DOMAIN-SUFFIX,ruguoapp.com,🖥️AsianTV
- DOMAIN-SUFFIX,smzdm.com,🖥️AsianTV
- DOMAIN-SUFFIX,sogou.com,🖥️AsianTV
- DOMAIN-SUFFIX,teamviewer.com,🖥️AsianTV
- DOMAIN-SUFFIX,totheglory.im,🖥️AsianTV
- DOMAIN-SUFFIX,tp.m-team.cc,🖥️AsianTV
- DOMAIN-SUFFIX,udacity.com,🖥️AsianTV
- DOMAIN-SUFFIX,xmcdn.com,🖥️AsianTV
- DOMAIN-SUFFIX,yangkeduo.com,🖥️AsianTV
- DOMAIN-SUFFIX,zhihu.com,🖥️AsianTV
- DOMAIN-SUFFIX,zhimg.com,🖥️AsianTV
#USER-AGENT,NeteaseMusic*,🖥️AsianTV
#USER-AGENT,%E7%BD%91%E6%98%93%E4%BA%91%E9%9F%B3%E4%B9%90*,🖥️AsianTV

# (DNS Cache Pollution Protection)
# > Google
- DOMAIN-SUFFIX,appspot.com,🔑Proxy
- DOMAIN-SUFFIX,blogger.com,🔑Proxy
- DOMAIN-SUFFIX,getoutline.org,🔑Proxy
- DOMAIN-SUFFIX,gvt0.com,🔑Proxy
- DOMAIN-SUFFIX,gvt1.com,🔑Proxy
- DOMAIN-SUFFIX,gvt3.com,🔑Proxy
- DOMAIN-SUFFIX,xn--ngstr-lra8j.com,🔑Proxy
- DOMAIN-KEYWORD,google,🔑Proxy
- DOMAIN-KEYWORD,blogspot,🔑Proxy
# > Facebook
- DOMAIN-SUFFIX,cdninstagram.com,🔑Proxy
- DOMAIN-SUFFIX,fb.com,🔑Proxy
- DOMAIN-SUFFIX,fb.me,🔑Proxy
- DOMAIN-SUFFIX,fbaddins.com,🔑Proxy
- DOMAIN-SUFFIX,fbcdn.net,🔑Proxy
- DOMAIN-SUFFIX,fbsbx.com,🔑Proxy
- DOMAIN-SUFFIX,fbworkmail.com,🔑Proxy
- DOMAIN-SUFFIX,instagram.com,🔑Proxy
- DOMAIN-SUFFIX,m.me,🔑Proxy
- DOMAIN-SUFFIX,messenger.com,🔑Proxy
- DOMAIN-SUFFIX,oculus.com,🔑Proxy
- DOMAIN-SUFFIX,oculuscdn.com,🔑Proxy
- DOMAIN-SUFFIX,rocksdb.org,🔑Proxy
- DOMAIN-SUFFIX,whatsapp.com,🔑Proxy
- DOMAIN-SUFFIX,whatsapp.net,🔑Proxy
- DOMAIN-KEYWORD,facebook,🔑Proxy
# > Twitter
- DOMAIN-SUFFIX,pscp.tv,🔑Proxy
- DOMAIN-SUFFIX,periscope.tv,🔑Proxy
- DOMAIN-SUFFIX,t.co,🔑Proxy
- DOMAIN-SUFFIX,twimg.co,🔑Proxy
- DOMAIN-SUFFIX,twimg.com,🔑Proxy
- DOMAIN-SUFFIX,twitpic.com,🔑Proxy
- DOMAIN-SUFFIX,vine.co,🔑Proxy
- DOMAIN-KEYWORD,twitter,🔑Proxy
# > Telegram
- DOMAIN-SUFFIX,t.me,🔑Proxy
- DOMAIN-SUFFIX,tdesktop.com,🔑Proxy
- DOMAIN-SUFFIX,telegra.ph,🔑Proxy
- DOMAIN-SUFFIX,telegram.me,🔑Proxy
- DOMAIN-SUFFIX,telegram.org,🔑Proxy
# > Line
- DOMAIN-SUFFIX,line.me,🔑Proxy
- DOMAIN-SUFFIX,line-apps.com,🔑Proxy
- DOMAIN-SUFFIX,line-scdn.net,🔑Proxy
- DOMAIN-SUFFIX,naver.jp,🔑Proxy
# > Other
- DOMAIN-SUFFIX,4shared.com,🔑Proxy
- DOMAIN-SUFFIX,881903.com,🔑Proxy
- DOMAIN-SUFFIX,abc.net.au,🔑Proxy
- DOMAIN-SUFFIX,abebooks.com,🔑Proxy
- DOMAIN-SUFFIX,amazon.co.jp,🔑Proxy
- DOMAIN-SUFFIX,apigee.com,🔑Proxy
- DOMAIN-SUFFIX,apk-dl.com,🔑Proxy
- DOMAIN-SUFFIX,apkmirror.com,🔑Proxy
- DOMAIN-SUFFIX,apkmonk.com,🔑Proxy
- DOMAIN-SUFFIX,apkpure.com,🔑Proxy
- DOMAIN-SUFFIX,aptoide.com,🔑Proxy
- DOMAIN-SUFFIX,archive.is,🔑Proxy
- DOMAIN-SUFFIX,archive.org,🔑Proxy
- DOMAIN-SUFFIX,arte.tv,🔑Proxy
- DOMAIN-SUFFIX,ask.com,🔑Proxy
- DOMAIN-SUFFIX,avgle.com,🔑Proxy
- DOMAIN-SUFFIX,badoo.com,🔑Proxy
- DOMAIN-SUFFIX,bandwagonhost.com,🔑Proxy
- DOMAIN-SUFFIX,bbc.com,🔑Proxy
- DOMAIN-SUFFIX,behance.net,🔑Proxy
- DOMAIN-SUFFIX,bibox.com,🔑Proxy
- DOMAIN-SUFFIX,biggo.com.tw,🔑Proxy
- DOMAIN-SUFFIX,binance.com,🔑Proxy
- DOMAIN-SUFFIX,bitcointalk.org,🔑Proxy
- DOMAIN-SUFFIX,bitfinex.com,🔑Proxy
- DOMAIN-SUFFIX,bitmex.com,🔑Proxy
- DOMAIN-SUFFIX,bit-z.com,🔑Proxy
- DOMAIN-SUFFIX,bloglovin.com,🔑Proxy
- DOMAIN-SUFFIX,bloomberg.cn,🔑Proxy
- DOMAIN-SUFFIX,bloomberg.com,🔑Proxy
- DOMAIN-SUFFIX,book.com.tw,🔑Proxy
- DOMAIN-SUFFIX,booklive.jp,🔑Proxy
- DOMAIN-SUFFIX,books.com.tw,🔑Proxy
- DOMAIN-SUFFIX,box.com,🔑Proxy
- DOMAIN-SUFFIX,brookings.edu,🔑Proxy
- DOMAIN-SUFFIX,businessinsider.com,🔑Proxy
- DOMAIN-SUFFIX,bwh1.net,🔑Proxy
- DOMAIN-SUFFIX,castbox.fm,🔑Proxy
- DOMAIN-SUFFIX,cbc.ca,🔑Proxy
- DOMAIN-SUFFIX,cdw.com,🔑Proxy
- DOMAIN-SUFFIX,change.org,🔑Proxy
- DOMAIN-SUFFIX,ck101.com,🔑Proxy
- DOMAIN-SUFFIX,clarionproject.org,🔑Proxy
- DOMAIN-SUFFIX,clyp.it,🔑Proxy
- DOMAIN-SUFFIX,cna.com.tw,🔑Proxy
- DOMAIN-SUFFIX,comparitech.com,🔑Proxy
- DOMAIN-SUFFIX,conoha.jp,🔑Proxy
- DOMAIN-SUFFIX,crucial.com,🔑Proxy
- DOMAIN-SUFFIX,cts.com.tw,🔑Proxy
- DOMAIN-SUFFIX,cw.com.tw,🔑Proxy
- DOMAIN-SUFFIX,cyberctm.com,🔑Proxy
- DOMAIN-SUFFIX,dailymotion.com,🔑Proxy
- DOMAIN-SUFFIX,dailyview.tw,🔑Proxy
- DOMAIN-SUFFIX,daum.net,🔑Proxy
- DOMAIN-SUFFIX,daumcdn.net,🔑Proxy
- DOMAIN-SUFFIX,dcard.tw,🔑Proxy
- DOMAIN-SUFFIX,deepdiscount.com,🔑Proxy
- DOMAIN-SUFFIX,deezer.com,🔑Proxy
- DOMAIN-SUFFIX,depositphotos.com,🔑Proxy
- DOMAIN-SUFFIX,disconnect.me,🔑Proxy
- DOMAIN-SUFFIX,discordapp.com,🔑Proxy
- DOMAIN-SUFFIX,discordapp.net,🔑Proxy
- DOMAIN-SUFFIX,disqus.com,🔑Proxy
- DOMAIN-SUFFIX,dns2go.com,🔑Proxy
- DOMAIN-SUFFIX,dropbox.com,🔑Proxy
- DOMAIN-SUFFIX,dropboxusercontent.com,🔑Proxy
- DOMAIN-SUFFIX,duckduckgo.com,🔑Proxy
- DOMAIN-SUFFIX,dw.com,🔑Proxy
- DOMAIN-SUFFIX,dynu.com,🔑Proxy
- DOMAIN-SUFFIX,earthcam.com,🔑Proxy
- DOMAIN-SUFFIX,ebookservice.tw,🔑Proxy
- DOMAIN-SUFFIX,economist.com,🔑Proxy
- DOMAIN-SUFFIX,edgecastcdn.net,🔑Proxy
- DOMAIN-SUFFIX,edu,🔑Proxy
- DOMAIN-SUFFIX,elpais.com,🔑Proxy
- DOMAIN-SUFFIX,enanyang.my,🔑Proxy
- DOMAIN-SUFFIX,euronews.com,🔑Proxy
- DOMAIN-SUFFIX,feedly.com,🔑Proxy
- DOMAIN-SUFFIX,files.wordpress.com,🔑Proxy
- DOMAIN-SUFFIX,flickr.com,🔑Proxy
- DOMAIN-SUFFIX,flitto.com,🔑Proxy
- DOMAIN-SUFFIX,foreignpolicy.com,🔑Proxy
- DOMAIN-SUFFIX,friday.tw,🔑Proxy
- DOMAIN-SUFFIX,gate.io,🔑Proxy
- DOMAIN-SUFFIX,getlantern.org,🔑Proxy
- DOMAIN-SUFFIX,getsync.com,🔑Proxy
- DOMAIN-SUFFIX,globalvoices.org,🔑Proxy
- DOMAIN-SUFFIX,goo.ne.jp,🔑Proxy
- DOMAIN-SUFFIX,goodreads.com,🔑Proxy
- DOMAIN-SUFFIX,gov.tw,🔑Proxy
- DOMAIN-SUFFIX,gumroad.com,🔑Proxy
- DOMAIN-SUFFIX,hbg.com,🔑Proxy
- DOMAIN-SUFFIX,hightail.com,🔑Proxy
- DOMAIN-SUFFIX,hk01.com,🔑Proxy
- DOMAIN-SUFFIX,hkbf.org,🔑Proxy
- DOMAIN-SUFFIX,hkbookcity.com,🔑Proxy
- DOMAIN-SUFFIX,hkej.com,🔑Proxy
- DOMAIN-SUFFIX,hket.com,🔑Proxy
- DOMAIN-SUFFIX,hkgolden.com,🔑Proxy
- DOMAIN-SUFFIX,hootsuite.com,🔑Proxy
- DOMAIN-SUFFIX,hudson.org,🔑Proxy
- DOMAIN-SUFFIX,huobi.pro,🔑Proxy
- DOMAIN-SUFFIX,initiummall.com,🔑Proxy
- DOMAIN-SUFFIX,ipfs.io,🔑Proxy
- DOMAIN-SUFFIX,issuu.com,🔑Proxy
- DOMAIN-SUFFIX,japantimes.co.jp,🔑Proxy
- DOMAIN-SUFFIX,jiji.com,🔑Proxy
- DOMAIN-SUFFIX,jinx.com,🔑Proxy
- DOMAIN-SUFFIX,jkforum.net,🔑Proxy
- DOMAIN-SUFFIX,joinmastodon.org,🔑Proxy
- DOMAIN-SUFFIX,kakao.com,🔑Proxy
- DOMAIN-SUFFIX,lihkg.com,🔑Proxy
- DOMAIN-SUFFIX,live.com,🔑Proxy
- DOMAIN-SUFFIX,mail.ru,🔑Proxy
- DOMAIN-SUFFIX,matters.news,🔑Proxy
- DOMAIN-SUFFIX,medium.com,🔑Proxy
- DOMAIN-SUFFIX,mega.nz,🔑Proxy
- DOMAIN-SUFFIX,mil,🔑Proxy
- DOMAIN-SUFFIX,mobile01.com,🔑Proxy
- DOMAIN-SUFFIX,naver.com,🔑Proxy
- DOMAIN-SUFFIX,nikkei.com,🔑Proxy
- DOMAIN-SUFFIX,nofile.io,🔑Proxy
- DOMAIN-SUFFIX,now.com,🔑Proxy
- DOMAIN-SUFFIX,nyt.com,🔑Proxy
- DOMAIN-SUFFIX,nytchina.com,🔑Proxy
- DOMAIN-SUFFIX,nytcn.me,🔑Proxy
- DOMAIN-SUFFIX,nytco.com,🔑Proxy
- DOMAIN-SUFFIX,nytimes.com,🔑Proxy
- DOMAIN-SUFFIX,nytimg.com,🔑Proxy
- DOMAIN-SUFFIX,nytlog.com,🔑Proxy
- DOMAIN-SUFFIX,nytstyle.com,🔑Proxy
- DOMAIN-SUFFIX,ok.ru,🔑Proxy
- DOMAIN-SUFFIX,okex.com,🔑Proxy
- DOMAIN-SUFFIX,pcloud.com,🔑Proxy
- DOMAIN-SUFFIX,pinimg.com,🔑Proxy
- DOMAIN-SUFFIX,pixiv.net,🔑Proxy
- DOMAIN-SUFFIX,pornhub.com,🔑Proxy
- DOMAIN-SUFFIX,pureapk.com,🔑Proxy
- DOMAIN-SUFFIX,quora.com,🔑Proxy
- DOMAIN-SUFFIX,quoracdn.net,🔑Proxy
- DOMAIN-SUFFIX,rakuten.co.jp,🔑Proxy
- DOMAIN-SUFFIX,reddit.com,🔑Proxy
- DOMAIN-SUFFIX,redditmedia.com,🔑Proxy
- DOMAIN-SUFFIX,resilio.com,🔑Proxy
- DOMAIN-SUFFIX,reuters.com,🔑Proxy
- DOMAIN-SUFFIX,scmp.com,🔑Proxy
- DOMAIN-SUFFIX,scribd.com,🔑Proxy
- DOMAIN-SUFFIX,seatguru.com,🔑Proxy
- DOMAIN-SUFFIX,shadowsocks.org,🔑Proxy
- DOMAIN-SUFFIX,slideshare.net,🔑Proxy
- DOMAIN-SUFFIX,soundcloud.com,🔑Proxy
- DOMAIN-SUFFIX,startpage.com,🔑Proxy
- DOMAIN-SUFFIX,steamcommunity.com,🔑Proxy
- DOMAIN-SUFFIX,steemit.com,🔑Proxy
- DOMAIN-SUFFIX,t66y.com,🔑Proxy
- DOMAIN-SUFFIX,teco-hk.org,🔑Proxy
- DOMAIN-SUFFIX,teco-mo.org,🔑Proxy
- DOMAIN-SUFFIX,teddysun.com,🔑Proxy
- DOMAIN-SUFFIX,theinitium.com,🔑Proxy
- DOMAIN-SUFFIX,tineye.com,🔑Proxy
- DOMAIN-SUFFIX,torproject.org,🔑Proxy
- DOMAIN-SUFFIX,tumblr.com,🔑Proxy
- DOMAIN-SUFFIX,turbobit.net,🔑Proxy
- DOMAIN-SUFFIX,twitch.tv,🔑Proxy
- DOMAIN-SUFFIX,udn.com,🔑Proxy
- DOMAIN-SUFFIX,unseen.is,🔑Proxy
- DOMAIN-SUFFIX,upmedia.mg,🔑Proxy
- DOMAIN-SUFFIX,uptodown.com,🔑Proxy
- DOMAIN-SUFFIX,ustream.tv,🔑Proxy
- DOMAIN-SUFFIX,uwants.com,🔑Proxy
- DOMAIN-SUFFIX,v2ray.com,🔑Proxy
- DOMAIN-SUFFIX,viber.com,🔑Proxy
- DOMAIN-SUFFIX,videopress.com,🔑Proxy
- DOMAIN-SUFFIX,vimeo.com,🔑Proxy
- DOMAIN-SUFFIX,voxer.com,🔑Proxy
- DOMAIN-SUFFIX,vzw.com,🔑Proxy
- DOMAIN-SUFFIX,w3schools.com,🔑Proxy
- DOMAIN-SUFFIX,wattpad.com,🔑Proxy
- DOMAIN-SUFFIX,whoer.net,🔑Proxy
- DOMAIN-SUFFIX,wikimapia.org,🔑Proxy
- DOMAIN-SUFFIX,wikipedia.org,🔑Proxy
- DOMAIN-SUFFIX,wire.com,🔑Proxy
- DOMAIN-SUFFIX,worldcat.org,🔑Proxy
- DOMAIN-SUFFIX,wsj.com,🔑Proxy
- DOMAIN-SUFFIX,wsj.net,🔑Proxy
- DOMAIN-SUFFIX,xboxlive.com,🔑Proxy
- DOMAIN-SUFFIX,xvideos.com,🔑Proxy
- DOMAIN-SUFFIX,yahoo.com,🔑Proxy
- DOMAIN-SUFFIX,yesasia.com,🔑Proxy
- DOMAIN-SUFFIX,yes-news.com,🔑Proxy
- DOMAIN-SUFFIX,yomiuri.co.jp,🔑Proxy
- DOMAIN-SUFFIX,you-get.org,🔑Proxy
- DOMAIN-SUFFIX,zb.com,🔑Proxy
- DOMAIN-SUFFIX,zello.com,🔑Proxy
- DOMAIN-SUFFIX,zeronet.io,🔑Proxy
- DOMAIN,cdn-images.mailchimp.com,🔑Proxy
- DOMAIN,id.heroku.com,🔑Proxy
- DOMAIN-KEYWORD,github,🔑Proxy
- DOMAIN-KEYWORD,jav,🔑Proxy
- DOMAIN-KEYWORD,pinterest,🔑Proxy
- DOMAIN-KEYWORD,porn,🔑Proxy
- DOMAIN-KEYWORD,wikileaks,🔑Proxy

# (Region-Restricted Access Denied)
- DOMAIN-SUFFIX,apartmentratings.com,🔑Proxy
- DOMAIN-SUFFIX,apartments.com,🔑Proxy
- DOMAIN-SUFFIX,bankmobilevibe.com,🔑Proxy
- DOMAIN-SUFFIX,bing.com,🔑Proxy
- DOMAIN-SUFFIX,booktopia.com.au,🔑Proxy
- DOMAIN-SUFFIX,centauro.com.br,🔑Proxy
- DOMAIN-SUFFIX,clearsurance.com,🔑Proxy
- DOMAIN-SUFFIX,costco.com,🔑Proxy
- DOMAIN-SUFFIX,crackle.com,🔑Proxy
- DOMAIN-SUFFIX,depositphotos.cn,🔑Proxy
- DOMAIN-SUFFIX,dish.com,🔑Proxy
- DOMAIN-SUFFIX,dmm.co.jp,🔑Proxy
- DOMAIN-SUFFIX,dmm.com,🔑Proxy
- DOMAIN-SUFFIX,dnvod.tv,🔑Proxy
- DOMAIN-SUFFIX,esurance.com,🔑Proxy
- DOMAIN-SUFFIX,extmatrix.com,🔑Proxy
- DOMAIN-SUFFIX,fastpic.ru,🔑Proxy
- DOMAIN-SUFFIX,flipboard.com,🔑Proxy
- DOMAIN-SUFFIX,fnac.be,🔑Proxy
- DOMAIN-SUFFIX,fnac.com,🔑Proxy
- DOMAIN-SUFFIX,funkyimg.com,🔑Proxy
- DOMAIN-SUFFIX,fxnetworks.com,🔑Proxy
- DOMAIN-SUFFIX,gettyimages.com,🔑Proxy
- DOMAIN-SUFFIX,jcpenney.com,🔑Proxy
- DOMAIN-SUFFIX,kknews.cc,🔑Proxy
- DOMAIN-SUFFIX,nationwide.com,🔑Proxy
- DOMAIN-SUFFIX,nbc.com,🔑Proxy
- DOMAIN-SUFFIX,nordstrom.com,🔑Proxy
- DOMAIN-SUFFIX,nordstromimage.com,🔑Proxy
- DOMAIN-SUFFIX,nordstromrack.com,🔑Proxy
- DOMAIN-SUFFIX,read01.com,🔑Proxy
- DOMAIN-SUFFIX,superpages.com,🔑Proxy
- DOMAIN-SUFFIX,target.com,🔑Proxy
- DOMAIN-SUFFIX,thinkgeek.com,🔑Proxy
- DOMAIN-SUFFIX,tracfone.com,🔑Proxy
- DOMAIN-SUFFIX,uploader.jp,🔑Proxy
- DOMAIN-SUFFIX,vevo.com,🔑Proxy
- DOMAIN-SUFFIX,viu.tv,🔑Proxy
- DOMAIN-SUFFIX,vk.com,🔑Proxy
- DOMAIN-SUFFIX,vsco.co,🔑Proxy
- DOMAIN-SUFFIX,xfinity.com,🔑Proxy
- DOMAIN-SUFFIX,zattoo.com,🔑Proxy
- DOMAIN,abc.com,🔑Proxy
- DOMAIN,abc.go.com,🔑Proxy
- DOMAIN,abc.net.au,🔑Proxy
- DOMAIN,wego.here.com,🔑Proxy
#USER-AGENT,Roam*,🔑Proxy

# (The Most Popular Sites)
# > Apple
# > Apple URL Shortener
- DOMAIN-SUFFIX,appsto.re,🖥️AsianTV
# > TestFlight
- DOMAIN,beta.itunes.apple.com,🖥️AsianTV
# > iBooks Store download
- DOMAIN,books.itunes.apple.com,🖥️AsianTV
# > iTunes Store Moveis Trailers
- DOMAIN,hls.itunes.apple.com,🖥️AsianTV
# App Store Preview
- DOMAIN,itunes.apple.com,🖥️AsianTV
# > Spotlight
- DOMAIN,api-glb-sea.smoot.apple.com,🖥️AsianTV
# > Dictionary
- DOMAIN,lookup-api.apple.com,🖥️AsianTV
#PROCESS-NAME,LookupViewService,🔑Proxy
- DOMAIN,guzzoni.apple.com,🖥️AsianTV
- DOMAIN-SUFFIX,aaplimg.com,🖥️AsianTV
- DOMAIN-SUFFIX,apple.co,🖥️AsianTV
- DOMAIN-SUFFIX,apple.com,🖥️AsianTV
- DOMAIN-SUFFIX,apple-cloudkit.com,🖥️AsianTV
- DOMAIN-SUFFIX,cdn-apple.com,🖥️AsianTV
- DOMAIN-SUFFIX,icloud.com,🖥️AsianTV
- DOMAIN-SUFFIX,icloud-content.com,🖥️AsianTV
- DOMAIN-SUFFIX,itunes.apple.com,🖥️AsianTV
- DOMAIN-SUFFIX,itunes.com,🖥️AsianTV
- DOMAIN-SUFFIX,lookup-api.apple.com,🖥️AsianTV
- DOMAIN-SUFFIX,me.com,🖥️AsianTV
- DOMAIN-SUFFIX,mzstatic.com,🔑Proxy
# > Google
- DOMAIN-SUFFIX,abc.xyz,🔑Proxy
- DOMAIN-SUFFIX,android.com,🔑Proxy
- DOMAIN-SUFFIX,androidify.com,🔑Proxy
- DOMAIN-SUFFIX,dialogflow.com,🔑Proxy
- DOMAIN-SUFFIX,autodraw.com,🔑Proxy
- DOMAIN-SUFFIX,capitalg.com,🔑Proxy
- DOMAIN-SUFFIX,certificate-transparency.org,🔑Proxy
- DOMAIN-SUFFIX,chrome.com,🔑Proxy
- DOMAIN-SUFFIX,chromeexperiments.com,🔑Proxy
- DOMAIN-SUFFIX,chromestatus.com,🔑Proxy
- DOMAIN-SUFFIX,chromium.org,🔑Proxy
- DOMAIN-SUFFIX,creativelab5.com,🔑Proxy
- DOMAIN-SUFFIX,debug.com,🔑Proxy
- DOMAIN-SUFFIX,deepmind.com,🔑Proxy
- DOMAIN-SUFFIX,firebaseio.com,🔑Proxy
- DOMAIN-SUFFIX,getmdl.io,🔑Proxy
- DOMAIN-SUFFIX,ggpht.com,🔑Proxy
- DOMAIN-SUFFIX,gmail.com,🔑Proxy
- DOMAIN-SUFFIX,gmodules.com,🔑Proxy
- DOMAIN-SUFFIX,godoc.org,🔑Proxy
- DOMAIN-SUFFIX,golang.org,🔑Proxy
- DOMAIN-SUFFIX,gstatic.com,🔑Proxy
- DOMAIN-SUFFIX,gv.com,🔑Proxy
- DOMAIN-SUFFIX,gwtproject.org,🔑Proxy
- DOMAIN-SUFFIX,itasoftware.com,🔑Proxy
- DOMAIN-SUFFIX,madewithcode.com,🔑Proxy
- DOMAIN-SUFFIX,material.io,🔑Proxy
- DOMAIN-SUFFIX,polymer-project.org,🔑Proxy
- DOMAIN-SUFFIX,admin.recaptcha.net,🔑Proxy
- DOMAIN-SUFFIX,recaptcha.net,🔑Proxy
- DOMAIN-SUFFIX,shattered.io,🔑Proxy
- DOMAIN-SUFFIX,synergyse.com,🔑Proxy
- DOMAIN-SUFFIX,tensorflow.org,🔑Proxy
- DOMAIN-SUFFIX,tiltbrush.com,🔑Proxy
- DOMAIN-SUFFIX,waveprotocol.org,🔑Proxy
- DOMAIN-SUFFIX,waymo.com,🔑Proxy
- DOMAIN-SUFFIX,webmproject.org,🔑Proxy
- DOMAIN-SUFFIX,webrtc.org,🔑Proxy
- DOMAIN-SUFFIX,whatbrowser.org,🔑Proxy
- DOMAIN-SUFFIX,widevine.com,🔑Proxy
- DOMAIN-SUFFIX,x.company,🔑Proxy
- DOMAIN-SUFFIX,youtu.be,🔑Proxy
- DOMAIN-SUFFIX,yt.be,🔑Proxy
- DOMAIN-SUFFIX,ytimg.com,🔑Proxy
# > Steam
- DOMAIN,media.steampowered.com,🔑Proxy
- DOMAIN,store.steampowered.com,🔑Proxy
# > Other
- DOMAIN-SUFFIX,0rz.tw,🔑Proxy
- DOMAIN-SUFFIX,4bluestones.biz,🔑Proxy
- DOMAIN-SUFFIX,9bis.net,🔑Proxy
- DOMAIN-SUFFIX,allconnected.co,🔑Proxy
- DOMAIN-SUFFIX,amazonaws.com,🔑Proxy
- DOMAIN-SUFFIX,aol.com,🔑Proxy
- DOMAIN-SUFFIX,bcc.com.tw,🔑Proxy
- DOMAIN-SUFFIX,bit.ly,🔑Proxy
- DOMAIN-SUFFIX,bitshare.com,🔑Proxy
- DOMAIN-SUFFIX,blog.jp,🔑Proxy
- DOMAIN-SUFFIX,blogimg.jp,🔑Proxy
- DOMAIN-SUFFIX,blogtd.org,🔑Proxy
- DOMAIN-SUFFIX,broadcast.co.nz,🔑Proxy
- DOMAIN-SUFFIX,camfrog.com,🔑Proxy
- DOMAIN-SUFFIX,cfos.de,🔑Proxy
- DOMAIN-SUFFIX,citypopulation.de,🔑Proxy
- DOMAIN-SUFFIX,cloudfront.net,🔑Proxy
- DOMAIN-SUFFIX,ctitv.com.tw,🔑Proxy
- DOMAIN-SUFFIX,cuhk.edu.hk,🔑Proxy
- DOMAIN-SUFFIX,cusu.hk,🔑Proxy
- DOMAIN-SUFFIX,discuss.com.hk,🔑Proxy
- DOMAIN-SUFFIX,dropboxapi.com,🔑Proxy
- DOMAIN-SUFFIX,edditstatic.com,🔑Proxy
- DOMAIN-SUFFIX,flickriver.com,🔑Proxy
- DOMAIN-SUFFIX,focustaiwan.tw,🔑Proxy
- DOMAIN-SUFFIX,free.fr,🔑Proxy
- DOMAIN-SUFFIX,ftchinese.com,🔑Proxy
- DOMAIN-SUFFIX,gigacircle.com,🔑Proxy
- DOMAIN-SUFFIX,gov,🔑Proxy
- DOMAIN-SUFFIX,hk-pub.com,🔑Proxy
- DOMAIN-SUFFIX,hosting.co.uk,🔑Proxy
- DOMAIN-SUFFIX,hwcdn.net,🔑Proxy
- DOMAIN-SUFFIX,jtvnw.net,🔑Proxy
- DOMAIN-SUFFIX,linksalpha.com,🔑Proxy
- DOMAIN-SUFFIX,manyvids.com,🔑Proxy
- DOMAIN-SUFFIX,myactimes.com,🔑Proxy
- DOMAIN-SUFFIX,newsblur.com,🔑Proxy
- DOMAIN-SUFFIX,now.im,🔑Proxy
- DOMAIN-SUFFIX,redditlist.com,🔑Proxy
- DOMAIN-SUFFIX,signal.org,🔑Proxy
- DOMAIN-SUFFIX,sparknotes.com,🔑Proxy
- DOMAIN-SUFFIX,streetvoice.com,🔑Proxy
- DOMAIN-SUFFIX,ttvnw.net,🔑Proxy
- DOMAIN-SUFFIX,tv.com,🔑Proxy
- DOMAIN-SUFFIX,twitchcdn.net,🔑Proxy
- DOMAIN-SUFFIX,typepad.com,🔑Proxy
- DOMAIN-SUFFIX,udnbkk.com,🔑Proxy
- DOMAIN-SUFFIX,whispersystems.org,🔑Proxy
- DOMAIN-SUFFIX,wikia.com,🔑Proxy
- DOMAIN-SUFFIX,wn.com,🔑Proxy
- DOMAIN-SUFFIX,wolframalpha.com,🔑Proxy
- DOMAIN-SUFFIX,x-art.com,🔑Proxy
- DOMAIN-SUFFIX,yimg.com,🔑Proxy

- DOMAIN-KEYWORD,dlercloud,🔑Proxy
- DOMAIN-SUFFIX,dler.cloud,🔑Proxy

# Local Area Network
- DOMAIN-KEYWORD,announce,🖥️AsianTV
- DOMAIN-KEYWORD,torrent,🖥️AsianTV
- DOMAIN-KEYWORD,tracker,🖥️AsianTV
- DOMAIN-SUFFIX,smtp,🖥️AsianTV
- DOMAIN-SUFFIX,local,🖥️AsianTV
- IP-CIDR,192.168.0.0/16,🖥️AsianTV
- IP-CIDR,10.0.0.0/8,🖥️AsianTV
- IP-CIDR,172.16.0.0/12,🖥️AsianTV
- IP-CIDR,127.0.0.0/8,🖥️AsianTV
- IP-CIDR,100.64.0.0/10,🖥️AsianTV

# (🖥️AsianTV)
# > Bilibili
- DOMAIN-KEYWORD,bilibili,🖥️AsianTV
- DOMAIN-SUFFIX,acg.tv,🖥️AsianTV
- DOMAIN-SUFFIX,acgvideo.com,🖥️AsianTV
- DOMAIN-SUFFIX,b23.tv,🖥️AsianTV
- DOMAIN-SUFFIX,biliapi.com,🖥️AsianTV
- DOMAIN-SUFFIX,biliapi.net,🖥️AsianTV
- DOMAIN-SUFFIX,bilibili.com,🖥️AsianTV
- DOMAIN-SUFFIX,biligame.com,🖥️AsianTV
- DOMAIN-SUFFIX,biligame.net,🖥️AsianTV
- DOMAIN-SUFFIX,hdslb.com,🖥️AsianTV
- DOMAIN-SUFFIX,im9.com,🖥️AsianTV

# > IQIYI
- IP-CIDR,101.227.0.0/16,🖥️AsianTV
- IP-CIDR,101.224.0.0/13,🖥️AsianTV
- IP-CIDR,119.176.0.0/12,🖥️AsianTV

# > Youku
- IP-CIDR,106.11.0.0/16,🖥️AsianTV

# > iQiyi
- IP-CIDR,101.227.97.240/32,❌AdBlock
- IP-CIDR,101.227.200.11/32,❌AdBlock
- IP-CIDR,101.227.200.28/32,❌AdBlock
- IP-CIDR,124.192.153.42/32,❌AdBlock

# Internet Service Provider ❌AdBlock Protection
- IP-CIDR,39.107.15.115/32,❌AdBlock
- IP-CIDR,47.89.59.182/32,❌AdBlock
- IP-CIDR,103.49.209.27/32,❌AdBlock
- IP-CIDR,123.56.152.96/32,❌AdBlock
# > ChinaNet
- IP-CIDR,61.160.200.223/32,❌AdBlock
- IP-CIDR,61.160.200.242/32,❌AdBlock
- IP-CIDR,61.160.200.252/32,❌AdBlock
- IP-CIDR,61.174.50.214/32,❌AdBlock
- IP-CIDR,111.175.220.163/32,❌AdBlock
- IP-CIDR,111.175.220.164/32,❌AdBlock
- IP-CIDR,124.232.160.178/32,❌AdBlock
- IP-CIDR,175.6.223.15/32,❌AdBlock
- IP-CIDR,183.59.53.237/32,❌AdBlock
- IP-CIDR,218.93.127.37/32,❌AdBlock
- IP-CIDR,221.228.17.152/32,❌AdBlock
- IP-CIDR,221.231.6.79/32,❌AdBlock
- IP-CIDR,222.186.61.91/32,❌AdBlock
- IP-CIDR,222.186.61.95/32,❌AdBlock
- IP-CIDR,222.186.61.96/32,❌AdBlock
- IP-CIDR,222.186.61.97/32,❌AdBlock
# > ChinaUnicom
- IP-CIDR,106.75.231.48/32,❌AdBlock
- IP-CIDR,119.4.249.166/32,❌AdBlock
- IP-CIDR,220.196.52.141/32,❌AdBlock
- IP-CIDR,221.6.4.148/32,❌AdBlock
# > ChinaMobile
- IP-CIDR,114.247.28.96/32,❌AdBlock
- IP-CIDR,221.179.131.72/32,❌AdBlock
- IP-CIDR,221.179.140.145/32,❌AdBlock
# > Dr.Peng
- IP-CIDR,10.72.25.0/24,❌AdBlock
- IP-CIDR,115.182.16.79/32,❌AdBlock
- IP-CIDR,118.144.88.126/32,❌AdBlock
- IP-CIDR,118.144.88.215/32,❌AdBlock
- IP-CIDR,120.76.189.132/32,❌AdBlock
- IP-CIDR,124.14.21.147/32,❌AdBlock
- IP-CIDR,124.14.21.151/32,❌AdBlock
- IP-CIDR,180.166.52.24/32,❌AdBlock
- IP-CIDR,211.161.101.106/32,❌AdBlock
- IP-CIDR,220.115.251.25/32,❌AdBlock
- IP-CIDR,222.73.156.235/32,❌AdBlock

# > Telegram
- IP-CIDR,91.108.4.0/22,🔑Proxy
- IP-CIDR,91.108.8.0/22,🔑Proxy
- IP-CIDR,91.108.12.0/22,🔑Proxy
- IP-CIDR,91.108.16.0/22,🔑Proxy
- IP-CIDR,91.108.56.0/22,🔑Proxy
- IP-CIDR,149.154.160.0/20,🔑Proxy

# (Extra IP-CIRD)
# > Google
- IP-CIDR,35.190.247.0/24,🔑Proxy
- IP-CIDR,64.233.160.0/19,🔑Proxy
- IP-CIDR,66.102.0.0/20,🔑Proxy
- IP-CIDR,66.249.80.0/20,🔑Proxy
- IP-CIDR,72.14.192.0/18,🔑Proxy
- IP-CIDR,74.125.0.0/16,🔑Proxy
- IP-CIDR,108.177.8.0/21,🔑Proxy
- IP-CIDR,172.217.0.0/16,🔑Proxy
- IP-CIDR,173.194.0.0/16,🔑Proxy
- IP-CIDR,209.85.128.0/17,🔑Proxy
- IP-CIDR,216.58.192.0/19,🔑Proxy
- IP-CIDR,216.239.32.0/19,🔑Proxy
# > Facebook
- IP-CIDR,31.13.24.0/21,🔑Proxy
- IP-CIDR,31.13.64.0/18,🔑Proxy
- IP-CIDR,45.64.40.0/22,🔑Proxy
- IP-CIDR,66.220.144.0/20,🔑Proxy
- IP-CIDR,69.63.176.0/20,🔑Proxy
- IP-CIDR,69.171.224.0/19,🔑Proxy
- IP-CIDR,74.119.76.0/22,🔑Proxy
- IP-CIDR,103.4.96.0/22,🔑Proxy
- IP-CIDR,129.134.0.0/17,🔑Proxy
- IP-CIDR,157.240.0.0/17,🔑Proxy
- IP-CIDR,173.252.64.0/19,🔑Proxy
- IP-CIDR,173.252.96.0/19,🔑Proxy
- IP-CIDR,179.60.192.0/22,🔑Proxy
- IP-CIDR,185.60.216.0/22,🔑Proxy
- IP-CIDR,204.15.20.0/22,🔑Proxy
# > Twitter
- IP-CIDR,69.195.160.0/19,🔑Proxy
- IP-CIDR,104.244.42.0/21,🔑Proxy
- IP-CIDR,192.133.76.0/22,🔑Proxy
- IP-CIDR,199.16.156.0/22,🔑Proxy
- IP-CIDR,199.59.148.0/22,🔑Proxy
- IP-CIDR,199.96.56.0/21,🔑Proxy
- IP-CIDR,202.160.128.0/22,🔑Proxy
- IP-CIDR,209.237.192.0/19,🔑Proxy

# > CloudFlare
- IP-CIDR,173.245.48.0/20,🔑Proxy
- IP-CIDR,103.21.244.0/22,🔑Proxy
- IP-CIDR,103.22.200.0/22,🔑Proxy
- IP-CIDR,103.31.4.0/22,🔑Proxy
- IP-CIDR,141.101.64.0/18,🔑Proxy
- IP-CIDR,108.162.192.0/18,🔑Proxy
- IP-CIDR,190.93.240.0/20,🔑Proxy
- IP-CIDR,188.114.96.0/20,🔑Proxy
- IP-CIDR,197.234.240.0/22,🔑Proxy
- IP-CIDR,198.41.128.0/17,🔑Proxy
- IP-CIDR,162.158.0.0/15,🔑Proxy
- IP-CIDR,104.16.0.0/12,🔑Proxy
- IP-CIDR,172.64.0.0/13,🔑Proxy
- IP-CIDR,131.0.72.0/22,🔑Proxy

#- DST-PORT,80,🖥️AsianTV
#- DST-PORT,443,🖥️AsianTV
# GeoIP China
- GEOIP,CN,🖥️AsianTV

- MATCH,🔑Proxy


