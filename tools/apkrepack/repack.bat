@echo off
rem 
rem 将game_asset与logic_asset拷贝到服务器目录
rem 
rem 调用当前目录下的config.bat

set OLD_APK_PATH=%~dp0\official_android.apk
set NEW_APK_PATH=%~dp0\official_android_new.apk
set NEW_ASSETS=%~dp0\new_assets


rem 1. 提取平台配置文件( --- 根据平台不同而不同 --- )
rmdir %~dp0\temp_data
mkdir %~dp0\temp_data

rem 备注：通用资料;
xcopy /e /y %NEW_ASSETS%\* %~dp0\temp_data\assets\

rem 重新打包;
call %~dp0\apkrebuild\apkrebuild_default_key.bat %OLD_APK_PATH% %~dp0\temp_data %NEW_APK_PATH%

rem 3. 清理环境
if exist %~dp0\temp_data rmdir /S /Q %~dp0\temp_data

pause
goto END

:END

