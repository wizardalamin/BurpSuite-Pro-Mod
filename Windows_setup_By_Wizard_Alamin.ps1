# Name is Important
echo "

                 ____                      ____          _  _          ____                      
                | __ )  _   _  _ __  _ __ / ___|  _   _ (_)| |_  ___  |  _ \  _ __  ___          
                |  _ \ | | | || -__|| -_ \\___ \ | | | || || __|/ _ \ | |_) || -__|/ _ \         
                | |_) || |_| || |   | |_) |___) || |_| || || |_|  __/ |  __/ | |  | (_) |        
                |____/  \__,_||_|   | .__/|____/  \__,_||_| \__|\___| |_|    |_|   \___/         
                                    |_|                                                          
                                   __  __             _   ____                                   
                                  |  \/  |  ___    __| | | __ )  _   _                           
                                  | |\/| | / _ \  / _- | |  _ \ | | | |                          
                                  | |  | || (_) || (_| | | |_) || |_| |                          
                                  |_|  |_| \___/  \__,_| |____/  \__, |                          
 __        __  _                            _           _      _ |___/                 _         
 \ \      / / (_)  ____   __ _   _ __    __| |         / \    | |   __ _   _ __ ___   (_)  _ __  
  \ \ /\ / /  | | |_  /  / _- | | -__|  / _- |        / _ \   | |  / _- | | -_ - _ \  | | | -_ \ 
   \ V  V /   | |  / /  | (_| | | |    | (_| |       / ___ \  | | | (_| | | | | | | | | | | | | |
    \_/\_/    |_| /___|  \__,_| |_|     \__,_|      /_/   \_\ |_|  \__,_| |_| |_| |_| |_| |_| |_|
                                                                                                 
                                                                                                 
"
# Check JDK-18 Availability or Download JDK-19
$jdk18 = Get-WmiObject -Class Win32_Product -filter "Vendor='Oracle Corporation'" |where Caption -clike "Java(TM) SE Development Kit 19*"
if (!($jdk18)){
    echo "`t`tDownnloading Java JDK-19 Required for run Burpsuite on your machine...."
    wget "https://download.oracle.com/java/19/latest/jdk-19_windows-x64_bin.exe" -O jdk-19.exe    
    echo "`n`t`tJDK-19 Downloaded, lets start the Installation process"
    start -wait jdk-19.exe
    rm jdk-19.exe
}else{
    echo "Required JDK-19 is Installed"
    $jdk18
}

# Check JRE-8 Availability or Download JRE-8
$jre8 = Get-WmiObject -Class Win32_Product -filter "Vendor='Oracle Corporation'" |where Caption -clike "Java 8 Update *"
if (!($jre8)){
    echo "`n`t`tDownloading Java JRE, Required for run Burpsuite on your machine......"
    wget "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=246474_2dee051a5d0647d5be72a7c0abff270e" -O jre-8.exe
    echo "`n`t`tJRE-8 Downloaded, lets start the Installation process"
    start -wait jre-8.exe
    rm jre-8.exe
}else{
    echo "`n`nRequired JRE-8 is Installed`n"
    $jre8
}

# Downloading Burp Suite Professional
if (Test-Path Burp-Suite-Pro.jar){
    {echo "Burp Suite Professional JAR file is available.`nChecking its Integrity ...."}
}
    if (((Get-Item Burp-Suite-Pro.jar).length/1MB) -lt 500 ){
    {echo "File Looks fine. Lets proceed for Execution"}
}
# Creating Burp.bat file with command for execution
if (Test-Path burp.bat) {rm burp.bat} 
$path = "java --add-opens=java.desktop/javax.swing=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED -javaagent:`"$pwd\Burploader_By_Wizard_Alamin.jar`" -noverify -jar `"$pwd\Burp-Suite-Pro.jar`""
$path | add-content -path Burp.bat
echo "`nBurp.bat file is created"


# Creating Burp-Suite-Pro.vbs File for background execution
if (Test-Path Burp-Suite-Pro.vbs) {
   Remove-Item Burp-Suite-Pro.vbs}
echo "Set WshShell = CreateObject(`"WScript.Shell`")" > Burp-Suite-Pro.vbs
add-content Burp-Suite-Pro.vbs "WshShell.Run chr(34) & `"$pwd\Burp.bat`" & Chr(34), 0"
add-content Burp-Suite-Pro.vbs "Set WshShell = Nothing"
echo "`nBurp-Suite-Pro.vbs file is created."


# Lets Activate Burp Suite Professional with keygenerator and Keyloader
echo "Reloading Environment Variables ...."
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
echo "`n`nStarting Keygenerator ...."
start-process java.exe -argumentlist "-jar keygen_By_Wizard_Alamin.jar"
echo "`n`nStarting Burp Suite Professional"
java --add-opens=java.desktop/javax.swing=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED -javaagent:"Burploader_By_Wizard_Alamin.jar" -noverify -jar "Burp-Suite-Pro.jar"
