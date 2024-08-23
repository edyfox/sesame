Copy these files into `/root/bin` and run `sudo crontab -e` to create a crontab
for root using content as following:


```crontab
@reboot /root/bin/sesamed --daemon
@hourly /root/bin/watchdog
```
