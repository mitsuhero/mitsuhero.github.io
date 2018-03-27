@ECHO OFF
REM 結合バッチファイル：div2.exe により生成

ECHO 分割されたファイルを復元します

IF NOT EXIST "ank.001"  GOTO ERR1
IF NOT EXIST "ank.002"  GOTO ERR1
IF NOT EXIST "ank.003"  GOTO ERR1
IF NOT EXIST "ank.004"  GOTO ERR1
IF NOT EXIST "ank.005"  GOTO ERR1
IF NOT EXIST "ank.006"  GOTO ERR1
IF     EXIST "ank.zip"  GOTO ERR2

COPY "ank.001" "ank.zip"
IF ERRORLEVEL 1 GOTO ERR3
COPY /B "ank.zip"+"ank.002"+"ank.003"+"ank.004"+"ank.005"
IF ERRORLEVEL 1 GOTO ERR3
COPY /B "ank.zip"+"ank.006"
IF ERRORLEVEL 1 GOTO ERR3

DEL "ank.001"
DEL "ank.002"
DEL "ank.003"
DEL "ank.004"
DEL "ank.005"
DEL "ank.006"


REN "ank.zip" "ank.zip"

ECHO このバッチファイルも消してください
GOTO END

:ERR1
ECHO ファイルが一部存在しません
ECHO 処理を中止します
GOTO END

:ERR2
ECHO 復元先のファイルが既に存在しています
ECHO 処理を中止します
GOTO END

:ERR3
ECHO 復元に失敗しました
ECHO 処理を中止します
GOTO END

:END
ECHO 終了するには、何かキーを押してください
PAUSE >NUL

