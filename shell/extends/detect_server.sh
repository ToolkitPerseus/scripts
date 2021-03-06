echo -e "Android OS `getprop ro.build.version.release`"

echo -e "Preventing some problems occured by disabling internet detect/避免禁用网络检测而发生某些问题"
echo -e "Execute following command to disable internet detect/若想禁用网络检测，请使用终端执行以下命令"
echo -e "su -c settings put global captive_portal_detection_enabled 0\n"

echo -e "Start replacing detecting server and generate_204 page/现在开始更换服务器以及检测页面\n"

echo -e "1.Net detecting mode/网络检测模式"
echo -e " - `settings get global captive_portal_mode`"

echo -e "2.检测地址/Detecting address(s)"
echo -e " - `settings get global captive_portal_http_url`"
echo -e " - `settings get global captive_portal_https_url`"

echo -e "\n3.启用https模式/Enable https"
echo -e "su -c settings put global captive_portal_use_https"
su -c settings put global captive_portal_use_https

echo -e "\n4.移除原有检测服务器/Remove default detecting server"
echo -e "su -c settings delete global captive_portal_server"
su -c settings delete global captive_portal_server

echo -e "\n5.设置检测服务器/Set detect server"
echo -e "settings put global captive_portal_server google.cn"
su -c settings put global captive_portal_server google.cn

echo -e "\n3.移除原有generate_204页面/Remove default generate_204 page (https/http)"
echo -e "su -c settings delete global captive_portal_https_url"
su -c settings delete global captive_portal_https_url
echo -e "su -c settings delete global captive_portal_http_url"
su -c settings delete global captive_portal_http_url

echo -e "\n7.设置generate_204页面/Set generate_204 page (https/http)"
echo -e "su -c settings put global captive_portal_https_url https://google.cn/generate_204"
su -c settings put global captive_portal_https_url https://google.cn/generate_204
echo -e "su -c settings put global captive_portal_http_url http://google.cn/generate_204"
su -c settings put global captive_portal_http_url http://google.cn/generate_204