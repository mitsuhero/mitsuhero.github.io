@ECHO OFF
REM 結合バッチファイル：div2.exe により生成

ECHO 分割されたファイルを復元します

IF NOT EXIST "OSKDIC.001"  GOTO ERR1
IF NOT EXIST "OSKDIC.002"  GOTO ERR1
IF NOT EXIST "OSKDIC.003"  GOTO ERR1
IF NOT EXIST "OSKDIC.004"  GOTO ERR1
IF NOT EXIST "OSKDIC.005"  GOTO ERR1
IF NOT EXIST "OSKDIC.006"  GOTO ERR1
IF NOT EXIST "OSKDIC.007"  GOTO ERR1
IF NOT EXIST "OSKDIC.008"  GOTO ERR1
IF NOT EXIST "OSKDIC.009"  GOTO ERR1
IF NOT EXIST "OSKDIC.010"  GOTO ERR1
IF     EXIST "OSKDIC.zip"  GOTO ERR2

COPY "OSKDIC.001" "OSKDIC.zip"
IF ERRORLEVEL 1 GOTO ERR3
COPY /B "OSKDIC.zip"+"OSKDIC.002"+"OSKDIC.003"+"OSKDIC.004"+"OSKDIC.005"
IF ERRORLEVEL 1 GOTO ERR3
COPY /B "OSKDIC.zip"+"OSKDIC.006"+"OSKDIC.007"+"OSKDIC.008"+"OSKDIC.009"
IF ERRORLEVEL 1 GOTO ERR3
COPY /B "OSKDIC.zip"+"OSKDIC.010"
IF ERRORLEVEL 1 GOTO ERR3

DEL "OSKDIC.001"
DEL "OSKDIC.002"
DEL "OSKDIC.003"
DEL "OSKDIC.004"
DEL "OSKDIC.005"
DEL "OSKDIC.006"
DEL "OSKDIC.007"
DEL "OSKDIC.008"
DEL "OSKDIC.009"
DEL "OSKDIC.010"


REN "OSKDIC.zip" "OSKDIC.zip"

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

