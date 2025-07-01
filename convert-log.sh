#!/bin/bash
# 这个脚本通常用于：

# 网站访问统计：分析网站的访问量、访问来源、用户行为等
# 定期报告生成：可以通过 cron 定时任务定期运行，生成最新的访问统计报告
# 运维监控：帮助运维人员了解网站的访问情况和性能状况
echo 1
path=/usr/robot518/log
cp /usr/local/nginx/logs/access.log* $path
# gunzip -f $path/access.log*
rm -f /usr/robot518/html/*gz.html
for file in $path/*
do
	goaccess -f $file -c -a > $file.html
done
mv $path/*.html /usr/robot518/html/
