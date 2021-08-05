#!/bin/bash
echo "Welcome to the setup script"
git clone https://github.com/pwall2222/oib
cd oib
echo "First I will need the path to your main browser"
read MAIN_BROWSER
echo "Now I need the path to your secondary browser"
read OTHER_BROWSER
echo "Now I need the path to your chromium based"
read CHROMIUM_BROWSER
sed -i "/MAIN_BROWSER/s/\"\"/$MAIN_BROWSER/" url-handler
sed -i "/OTHER_BROWSER/s/\"\"/$OTHER_BROWSER/" url-handler
sed -i "/CHROMIUM_BROWSER/s/\"\"/$CHROMIUM_BROWSER/" url-handler
echo "I will have you edit the .nanorc add the domains you want to use with the other browser or app."
read -p "Press any key to open nano..."
nano ~/.domainrc
cp app-list ~/.app-list
echo "I will have you edit the .app-list add the apps you want to use."
read -p "Press any key to open nano..."
nano ~/.app-list
echo "Coping desktop file"
cp url-handler.desktop /usr/share/applications/
if [ $? -eq 1 ] 
then
	sudo cp url-handler.desktop /usr/share/applications/
	if [ $? -eq 1 ]
	then
		echo "You will have to finish the setup manually"
		echo "Copy url-handler.desktop to /usr/share/applications/"
		echo "And set up the scheme handler"
		exit 1
	fi
fi
gio mime x-scheme-handler/https  url-handler.desktop
gio mime x-scheme-handler/http  url-handler.desktop