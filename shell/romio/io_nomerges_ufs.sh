if [ -e "/sys/block/sda/queue/nomerges" ]
then
	echo -e "'/sys/block/sda/queue/nomerges' found/已找到"
	
    if [ `su -c cat /sys/block/sda/queue/nomerges` == "1" ]
    then
		echo -e "Disable Nomerges/(存储I/O)调试帮助 - UFS"
        X="0"
    else
		echo -e "Enable Nomerges/(存储I/O)调试帮助 - UFS"
        X="1"
    fi
	
    su -c echo "${X}" > /sys/block/sda/queue/nomerges
	
	if [ `su -c cat /sys/block/sda/queue/nomerges` == "${X}" ]
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
	echo -e "'/sys/block/sda/queue/nomerges' not found/未找到"
fi