@ECHO OFF
REM 結合バッチファイル：div2.exe により生成

ECHO 分割されたファイルを復元します

IF NOT EXIST "01ナレ~1.001"  GOTO ERR1
IF NOT EXIST "01ナレ~1.002"  GOTO ERR1
IF NOT EXIST "01ナレ~1.003"  GOTO ERR1
IF NOT EXIST "01ナレ~1.004"  GOTO ERR1
IF     EXIST "01.ナレッジ.zip"  GOTO ERR2

COPY "01ナレ~1.001" "01ナレ~1.ZIP"
IF ERRORLEVEL 1 GOTO ERR3
COPY /B "01ナレ~1.ZIP"+"01ナレ~1.002"+"01ナレ~1.003"+"01ナレ~1.004"
IF ERRORLEVEL 1 GOTO ERR3

DEL "01ナレ~1.001"
DEL "01ナレ~1.002"
DEL "01ナレ~1.003"
DEL "01ナレ~1.004"


REN "01ナレ~1.ZIP" "01.ナレッジ.zip"

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

