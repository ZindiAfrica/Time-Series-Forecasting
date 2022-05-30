library(data.table)
setwd("/home/mark/competitions/zindi-sea-turtles/")

train<-fread("train.csv")

train[,year:=year(as.Date(Date_TimeCaught))]
train[,week:=week(as.Date(Date_TimeCaught))]
train[,year_week:=year*100+week]
train[,.N,.(CaptureSite,year_week)][order(-N)]
train[,turtles_per_site_week:=.N,.(CaptureSite,year_week)]
plot(train[CaptureSite=="CaptureSite_25",.N,year_week][order(-year_week)],type="b")

year_weeks<-train[,.(year_week_turtles=.N,sites=uniqueN(CaptureSite)),year_week]

site_weeks<-merge(year_weeks[,.(year_week_turtles,sites,year_week,key=1)]
                  ,train[,.(key=1,site_turtles=.N),CaptureSite]
                  ,"key",allow.cartesian = TRUE)
dense_train<-merge(site_weeks,train[,.(turtles=.N),.(year_week,CaptureSite)],c("year_week","CaptureSite"),all.x=TRUE)
dense_train[is.na(turtles),turtles:=0]
dense_train[CaptureSite=="CaptureSite_25"][order(-year_week)][1:99]

site_stats<-dense_train[,.(mean_turtles=mean(turtles)
                           ,turtles_2018=mean(turtles[substr(as.character(year_week),1,4)=="2018"])
                           ,turtles_2017=mean(turtles[substr(as.character(year_week),1,4)=="2017"])
),CaptureSite]
last_year_stats<-dense_train[substr(as.character(year_week),1,4)=="2018",.(CaptureSite,turtles,year_week)]
last_year_stats[,key:=paste0(CaptureSite,"_",gsub("2018","2019",year_week))]

dense_train[,week_num:=as.integer(substr(as.character(year_week),5,6))]
dense_train[,period:=floor(week_num/11)]
by_week<-dense_train[,.(weekly_average=mean(turtles)),.(CaptureSite,week_num)]
by_period<-dense_train[as.numeric(substr(as.character(year_week),1,4))>2014,.(period_average=mean(turtles)),.(CaptureSite,period)]
by_period10<-dense_train[as.numeric(substr(as.character(year_week),1,4))>2010,.(period_average10=mean(turtles)),.(CaptureSite,period)]
by_period16<-dense_train[as.numeric(substr(as.character(year_week),1,4))>2016,.(period_average16=mean(turtles)),.(CaptureSite,period)]

site_stats<-site_stats[order(-turtles_2018)]
dcast(dense_train[,.(y=round(mean(turtles),1)),.(CaptureSite,year=as.numeric(substr(as.character(year_week),1,4)))],CaptureSite~year)

ss<-fread("archive/Sample_sub.csv")
ss[,CaptureSite:=substr(ID,1,nchar(ID)-7)]
ss[,week_num:=as.integer(substr(ID,nchar(ID)-1,nchar(ID)))]
ss[,period:=pmin(3,floor(week_num/11))]

submission<-merge(ss,site_stats,"CaptureSite",all.x=TRUE)
submission<-merge(submission,by_period,c("CaptureSite","period"),all.x=TRUE)
submission[is.na(period_average),period_average:=0]
submission<-merge(submission,by_period10,c("CaptureSite","period"),all.x=TRUE)
submission[is.na(period_average10),period_average10:=0]
submission<-merge(submission,by_period16,c("CaptureSite","period"),all.x=TRUE)
submission[is.na(period_average16),period_average16:=0]

submission[,Capture_Number:=pmax(0,round(turtles_2018*0.6 + period_average*0.5 - period_average16*0.1,1))]  

submission[CaptureSite=="CaptureSite_15",Capture_Number:=Capture_Number*1.7]
submission[CaptureSite=="CaptureSite_16",Capture_Number:=Capture_Number*0.4]
submission[CaptureSite=="CaptureSite_3",Capture_Number:=Capture_Number*1.7]

fwrite(submission[,.(ID,Capture_Number)],"subM1i.csv")
