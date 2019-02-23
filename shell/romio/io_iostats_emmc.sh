if [ -e "/sys/block/mmcblk0/queue/iostats" ]
then
	echo -e "'/sys/block/mmcblk0/queue/iostats' found/已找到"
	
    if [ `su -c cat /sys/block/mmcblk0/queue/iostats` == "1" ]
    then
		echo -e "Disable IO Stats/(存储I/O)统计 - eMMC"
        X="0"
    else
		echo -e "Enable IO Stats/(存储I/O)统计 - eMMC"
        X="1"
    fi
	
    su -c echo "${X}" > /sys/block/mmcblk0/queue/iostats
	
	if [ `su -c cat /sys/block/mmcblk0/queue/iostats` == "${X}" ]
	then
        echo -e "Succeed/成功"
    else
        echo -e "Failed/失败"
		echo -e ""
		echo -e "Failture might be caused by Java's Runtime IO. Please try running file by follow command through termux or NeoTerm"
		echo -e "失败可能是由于Java的Runtime IO导致。请重新尝试或者尝试使用Termux或者Neoterm执行以下命令尝试运行"
		echo -e "'su -c source <FileName/文件名>'"
    fi
	
else
	echo -e "'/sys/block/mmcblk0/queue/iostats' not found/未找到"
fi