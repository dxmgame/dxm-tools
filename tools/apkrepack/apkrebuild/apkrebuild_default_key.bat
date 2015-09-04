@echo off

rem 通过重新打包赋予新的数据；新的签名。

rem parametric: 1. old APK; 2. config copy folder; 3. data copy folder; 4. signer key file; 5. signer key password; 6. signer key alias; 7. new APK
set ocd=%cd%
cd /d %~dp0

if not exist %1 goto APK_FAILED

echo ######## APK uncompress ########
call apktool d -f %1 game_apk

echo ######## APK copy new data ########
xcopy %2\*  game_apk\ /e /h /r /k /y

echo ######## APK rebuild unsigned ########
call apktool b -f game_apk gen\game_unsigned.apk

echo ######## APK change unsigned to signed
jarsigner -verbose -keystore androidkey -storepass runqu123456 -keypass runqu123456 -digestalg SHA1 -sigalg MD5withRSA -signedjar gen\game_signed.apk gen\game_unsigned.apk runqukey

echo ######## APK signed to align ########
zipalign -f -v 4 gen\game_signed.apk %3

rmdir /S /Q game_apk
rmdir /S /Q gen

echo ######## APK rebuild OK ########

goto END

:APK_FAILED
echo ######## APK Not Exist ########
goto END

:KEY_FAILED
echo ######## KEY Not Exist ########
goto END

:END

cd /d %ocd%

