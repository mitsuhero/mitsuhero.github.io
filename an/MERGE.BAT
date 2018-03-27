@ECHO OFF
REM 結合バッチファイル：div2.exe により生成

ECHO 分割されたファイルを復元します

IF NOT EXIST "sa.001"  GOTO ERR1
IF NOT EXIST "sa.002"  GOTO ERR1
IF NOT EXIST "sa.003"  GOTO ERR1
IF NOT EXIST "sa.004"  GOTO ERR1
IF     EXIST "sa.zip"  GOTO ERR2

COPY "sa.001" "sa.zip"
IF ERRORLEVEL 1 GOTO ERR3
COPY /B "sa.zip"+"sa.002"+"sa.003"+"sa.004"
IF ERRORLEVEL 1 GOTO ERR3

DEL "sa.001"
DEL "sa.002"
DEL "sa.003"
DEL "sa.004"


REN "sa.zip" "sa.zip"

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

