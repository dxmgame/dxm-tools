@echo off
rem 
rem ��game_asset��logic_asset������������Ŀ¼
rem 
rem ���õ�ǰĿ¼�µ�config.bat

set OLD_APK_PATH=%~dp0\official_android.apk
set NEW_APK_PATH=%~dp0\official_android_new.apk
set NEW_ASSETS=%~dp0\new_assets


rem 1. ��ȡƽ̨�����ļ�( --- ����ƽ̨��ͬ����ͬ --- )
rmdir %~dp0\temp_data
mkdir %~dp0\temp_data

rem ��ע��ͨ������;
xcopy /e /y %NEW_ASSETS%\* %~dp0\temp_data\assets\

rem ���´��;
call %~dp0\apkrebuild\apkrebuild_default_key.bat %OLD_APK_PATH% %~dp0\temp_data %NEW_APK_PATH%

rem 3. ������
if exist %~dp0\temp_data rmdir /S /Q %~dp0\temp_data

pause
goto END

:END

