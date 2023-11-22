# uHOSTS v1.0

## Description

Skript umožnuje zamenu suboru HOSTS v operacnych systemoch Windows 10 za uzivatelsky upraveny subor HOSTS.   
Skript vyzaduje spustenie s administratorskym opravnenim.   
Skript zalohuje povodny subor v adresary systemu Windows ako subor `hosts.org`   
Uzivatelsky upraveny subor HOSTS je nutne umiestnit do adresara `uHOSTS_root\dat\`        

Pre system Windows 10 je odporucane pouzit tento upraveny subor HOSTS:
> https://someonewhocares.org/hosts/hosts   


Defaultna cesta k suboru HOSTS v systeme Windows10:
> %WINDIR%\System32\drivers\etc\hosts 

alebo

> C:\Windows\System32\drivers\etc\hosts 


---


## Information
Project name: **uHOSTS**      
Version: 1.0    
Programming lang: Windows CMD Bash scripting    
Created by: Marek Marko 
Date: 07/2017       
Target systems: OS Windows 10  

File structure:

```
ROOT\ >--- uHOSTS.bat
            readme.md
                  dat\  >--- HOSTS  (custom file)
```

