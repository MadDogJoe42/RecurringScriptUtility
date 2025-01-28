# Create the /UserScripts/ directory
mkdir /UserScripts
mkdir /UserScripts/logs
mkdir /UserScripts/tmp

# Create systemd service that runs on startup
echo "[Unit]
Description=User startup service without network online
After=network.target

[Service]
Type=simple
StandardOutput=truncate:/UserScripts/logs/StartupWithoutNetwork.log
StandardError=inherit
ExecStart=/UserScripts/StartupWithoutNetwork.sh

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/StartupWithoutNetwork.service

echo "#!/bin/bash
#This script runs at startup prior to the network being online
echo 'Last run:'
date



echo 'Complete:'
date" > /UserScripts/StartupWithoutNetwork.sh
chmod +x /UserScripts/StartupWithoutNetwork.sh
systemctl start StartupWithoutNetwork
systemctl enable StartupWithoutNetwork




# Create systemd service that runs on startup with network online
echo "[Unit]
Description=User startup service with network online
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
StandardOutput=truncate:/UserScripts/logs/StartupWithNetwork.log
StandardError=inherit
ExecStart=/UserScripts/StartupWithNetwork.sh

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/StartupWithNetwork.service

echo "#!/bin/bash
#This script runs at startup after the network is online
echo 'Last run:'
date



echo 'Complete:'
date" > /UserScripts/StartupWithNetwork.sh
chmod +x /UserScripts/StartupWithNetwork.sh
systemctl start StartupWithNetwork
systemctl enable StartupWithNetwork





# Create systemd service that runs daily without
echo "[Unit]
Description=User startup service that runs once a day
After=network.target

[Timer]
OnCalendar=daily
Persistent=true

[Service]
Type=simple
StandardOutput=truncate:/UserScripts/logs/DailyWithoutNetwork.log
StandardError=inherit
ExecStart=/UserScripts/DailyWithoutNetwork.sh

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/DailyWithoutNetwork.service

echo "#!/bin/bash
#This script runs daily prior to the network being online
echo 'Last run:'
date



echo 'Complete:'
date" > /UserScripts/DailyWithoutNetwork.sh
chmod +x /UserScripts/DailyWithoutNetwork.sh
systemctl start DailyWithoutNetwork
systemctl enable DailyWithoutNetwork


# Create systemd service that runs daily with network online
echo "[Unit]
Description=User startup service that runs once a day
After=network-online.target
Wants=network-online.target

[Timer]
OnCalendar=daily
Persistent=true

[Service]
Type=simple
StandardOutput=truncate:/UserScripts/logs/DailyWithNetwork.log
StandardError=inherit
ExecStart=/UserScripts/DailyWithNetwork.sh

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/DailyWithNetwork.service

echo "#!/bin/bash
#This script runs daily after the network is online
echo 'Last run:'
date



echo 'Complete:'
date" > /UserScripts/DailyWithNetwork.sh
chmod +x /UserScripts/DailyWithNetwork.sh
systemctl start DailyWithNetwork
systemctl enable DailyWithNetwork








