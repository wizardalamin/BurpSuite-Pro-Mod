#!/bin/bash

echo "                                                                                                                                                        
          ____                                         _   _             _____                                                                                
         |  _ \                                       (_) | |           |  __ \                                                                               
         | |_) |  _   _   _ __   _ __    ___   _   _   _  | |_    ___   | |__) |  _ __    ___                                                                 
         |  _ <  | | | | | -__| | -_ \  / __| | | | | | | | __|  / _ \  |  ___/  | -__|  / _ \                                                                
         | |_) | | |_| | | |    | |_) | \__ \ | |_| | | | | |_  |  __/  | |      | |    | (_) |                                                               
         |____/   \__,_| |_|    | .__/  |___/  \__,_| |_|  \__|  \___|  |_|      |_|     \___/                                                                
                     __  __     | |       _     ____                                                                                                          
                    |  \/  |    |_|      | |   |  _ \                                                                                                         
                    | \  / |   ___     __| |   | |_) |  _   _                                                                                                 
                    | |\/| |  / _ \   / _- |   |    <  | | | |                                                                                                
                    | |  | | | (_) | | (_| |   | |_) | | |_| |                                                                                                
                    |_|  |_|  \___/   \__,_|   |____/   \__, |                                                                                                
                                                         __/ |                                                                                                
 __          __  _                            _         |___/                           _                                                                     
 \ \        / / (_)                          | |        /\     | |                     (_)                                                                    
  \ \  /\  / /   _   ____   __ _   _ __    __| |       /  \    | |   __ _   _ __ ___    _   _ __                                                              
   \ \/  \/ /   | | |_  /  / _- | | -__|  / _- |      / /\ \   | |  / _- | | -_ - _ \  | | | -_ \                                                             
    \  /\  /    | |  / /  | (_| | | |    | (_| |     / ____ \  | | | (_| | | | | | | | | | | | | |                                                            
     \/  \/     |_| /___|  \__,_| |_|     \__,_|    /_/    \_\ |_|  \__,_| |_| |_| |_| |_| |_| |_|                                                            
 
"


if [[ $EUID -eq 0 ]]; then
    # Download Burp Suite Profesional Latet Version
    echo 'Now loading Burp Suite Professional v2022.8.2 from folder....' 
    sleep 7

    # execute Keygenerator
    echo 'Starting Keygenerator'
    (java -jar keygen_By_Wizard_Alamin.jar) &
    sleep 3s
    
    # Execute Burp Suite Professional with Keyloader
    echo 'Executing Burp Suite Professional with Keyloader'
    echo "java --illegal-access=permit -Dfile.encoding=utf-8 -javaagent:$(pwd)/Burploader_By_Wizard_Alamin.jar -noverify -jar $(pwd)/Burp-Suite-Pro.jar &" > burp
    chmod +x burp
    cp burp /bin/burp 
    (./burp)
else
    echo "Execute Command as Root User"
exit
fi
