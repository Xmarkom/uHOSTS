@echo off
rem mode con:cols=80 lines=30     set screen size
rem Skript pre nahradenie HOST suboru editovanou verziou
rem Urcene pre operacny system WINDOWS 10
rem Created by Marek Marko @ 2017
color 1E
Title uHOST v1.0
@timeout /t 1 > nul
SETLOCAL ENABLEDELAYEDEXPANSION
call :_LOGO
call :check_Permiss
set mypath=%~dp0
set syspath="%WINDIR%\System32\drivers\etc"
call :check_File
cls
call :_LOGO
call :change_file
echo:
echo:
echo:
echo ^> Ukonci program lubovolnou klavesou ...
pause >nul
exit




:_LOGO
rem ________________________________________________
echo:
echo    Welcome to
echo:
echo		           ##     ##  #######   ######  ######## 
echo		           ##     ## ##     ## ##    ##    ##    
echo		           ##     ## ##     ## ##          ##    
echo		##     ##  ######### ##     ##  ######     ##    
echo		##     ##  ##     ## ##     ##       ##    ##    
echo		##     ##  ##     ## ##     ## ##    ##    ##    
echo		 #######   ##     ##  #######   ######     ##   v 1.0
echo: 
echo    	          written by Marek Marko @ 2017
echo:
exit /B



:check_Permiss
rem ________________________________________________
    @timeout /t 1 > nul
    echo:
    echo  ^> ### Vyzaduju sa opravnenia administratora ! ###
	@timeout /t 1 > nul
	echo:
	echo  ^> Kontrola opravneni:
	echo:
	@timeout /t 2 > nul
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo  ^> Opravnenia administratora ... OK
        @timeout /t 1 > nul
		exit /B
    ) else (
		echo:
        echo     ERROR: Program nema pozadovane opravnenia  !!!
		echo     ______________________________________________
		echo:
		echo     Spusti znovu program: "Ako administrator..."!!
        echo:
		echo:
        echo  ^> Ukonci program lubovolnou klavesou ... 
		pause >nul
        exit
    )



:check_File 
rem ________________________________________________
    echo:
	echo  ^> Kontrola suborov:
	echo:
	@timeout /t 1 > nul
    if exist "%mypath%\dat\hosts" (
        echo  ^> User HOST subor ... OK
        @timeout /t 1 > nul
    ) else (
		echo:
        echo  ^> ERROR: user HOST subor nenajdeny !!
		echo:
		echo:
        echo  ^> Ukonci program lubovolnou klavesou ... 
		pause >nul
		exit
    )
	if exist "%syspath%\hosts" (
		echo:
        echo  ^> System HOST subor ... OK
        @timeout /t 1 > nul
    ) else (
		echo:
        echo  ^> ERROR: System HOST subor nepristupny !!
		echo:
		echo:
        echo  ^> Ukonci program lubovolnou klavesou ...
		pause >nul
		exit
    )
exit /B



:change_file
rem ________________________________________________
    echo:
    echo  ^> ###  Upravujem systemove subory  ###
	@timeout /t 1 > nul
	echo:
	echo  ^> Vytvaram zalohu ... OK
	copy /V "%syspath%\hosts" "%syspath%\hosts.org" > nul
	del /F /Q "%syspath%\hosts"
	@timeout /t 1 > nul
	echo:
	echo: >>"%mypath%\dat\hosts"
	echo ^# edit by uHOSTS v1.0 >>"%mypath%\dat\hosts" 
	echo  ^> Kopirujem subory ... OK
	copy /V "%mypath%\dat\hosts" "%syspath%\hosts" > nul
	@timeout /t 1 > nul
	echo:
	echo  ^> ###  Upravy uspesne dokoncene !!  ###
exit /B



     rem zatial nepouzite !!!!
:restore_file
rem ________________________________________________
    echo:
    echo  ^> ###  Obnova systemoveho suboru HOSTS ###
	@timeout /t 1 > nul
	echo:
	echo  ^> Vyhladavam zalohu ...
	if exist "%syspath%\hosts.org" (
		echo:
        echo  ^> System HOST subor ... OK
        @timeout /t 1 > nul
    ) else (
		echo:
        echo  ^> ERROR: System HOST subor nenajdeny !!
		echo:
		echo:
        echo  ^> Ukonci program lubovolnou klavesou ...
		pause >nul
		exit
	)
	copy /V "%syspath%\hosts" "%syspath%\hosts.del" > nul
	@timeout /t 1 > nul
	echo:
	echo  ^> Obnovujem subor ... OK
	copy /V "%syspath%\hosts.org" "%syspath%\hosts" > nul
	@timeout /t 1 > nul
	echo:
	echo  ^> ###  Subor uspesne obnoveny !!  ###
exit /B                                                          
                                                               