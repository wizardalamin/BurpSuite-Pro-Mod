**Burpsuite Pro Mod By Wizard Alamin**

Copy Commands & paste to powershell(windows), Terminal (Linux)

1. Burp Suite Professional Installation steps for Windows
        --> Open Powershell and execute below command to set Script Execution Policy.
                Set-ExecutionPolicy -ExecutionPolicy bypass -Scope process
        --> Now Execute Windows_Setup.ps1 file in Powershell to Complete Installation.
                ./Windows_setup_By_Wizard_Alamin.ps1

 ** Wait till the script complete download and install latest JRE&JDK Version on your machine. 
    If latest JRE&JDK is already installed, then don't worry, script will automatically procced to next.

 (Now you are done,Burp application and License process will start automatically, Just Follow No:3 step)
       
 --> For Start Menu Entry, copy **Burp-Suite-Pro.vbs** file to 
                C:\ProgramData\Microsoft\Windows\Start Menu\Programs\

-----------------------------------------------------------------------------------------------------------------
2. Burp Suite Professional Installation Commands for Kali-Linux--- Follow this commands (Easy Setup).
      
	sudo su
        (enter your root password)
        chmod +x Linux_setup_shell_by_Wizard_Alamin.sh
        ./Linux_setup_shell_by_Wizard_Alamin.sh
        
        (Now you are done,Burp application and License process will start automatically, Just Follow No:3 steps)

-----------------------------------------------------------------------------------------------------------------
3. Burp Suite Pro Activation Steps 
        1. Modify License String with your name like "license to Wizard Alamin"
        2. Copy License key from keygen.jar and paste in Burp Suite Pro and click Next.
        3. Select Manual Activation Option on your bottom Right in Burp Suite Pro.
        4. Copy License Request from BurpSuite_Pro and paste in Keygenerator.
        5. Copy license response from Keygenerator and paste in Burp Suite Pro, then next and Done.

-----------------------------------------------------------------------------------------------------------------
4. Executing Burp Suite Profession after Activation
        Windows :-: You can start Burp Suite Professional from Start Menu.
        Kali Linux :-: You can start Burp Suite Professional by writing "sudo burp" in terminal.

-----------------------------------------------------------------------------------------------------------------
