@ECHO OFF
:menu
cls
ECHO ##################################################
ECHO #    1 : Show Current Date AD and BE             #
ECHO #    2 : Delete all file except select file      #
ECHO #    3 : Dice Game                               #
ECHO ##################################################
SET /P choice=Please Enter choice :
IF %choice% == 1 GOTO ShowDate
IF %choice% == 2 GOTO DeleteFile
IF %choice% == 3 GOTO DiceGame
IF %choice% == e EXIT
GOTO menu

:ShowDate

GOTO ExitAndMenu

:DeleteFile
cls
REM Delete File but not delete file in except file
ECHO -
ECHO ============== Delete File ==============
SET /P Except=Please Enter Except File :
FOR %%i IN (*) DO IF NOT %%i == %Except% OR  DEL "%%i"
REM End Delete file
GOTO ExitAndMenu

:DiceGame
REM This Game is Guess Dice. User guess score of dice then computer dice. if score == Dice Computer stop Dice And Show Rount of Dice 
cls
SET /P UserGuess=Please Enter guess score of two dice (2 to 12 score) :
FOR %%i IN (2 3 4 5 6 7 8 9 10 11 12) DO IF %UserGuess% == %%i GOTO StartGame
GOTO DiceGame
:StartGame
SET /A Rount=0

:Dice
SET /A Rount=%Rount%+1
SET /A Dice1=%random% %%6+1
SET /A Dice2=%random% %%6+1
SET /A Score=%Dice1% + %Dice2%

ECHO =================================
ECHO   Rount of Dice : %Rount%
ECHO   Dice1 is %Dice1%
ECHO   Dice2 is %Dice2%
ECHO   Dice Score : %Score%
ECHO   UserGuess : %UserGuess%
IF %Score% == %UserGuess%  GOTO endGame
ECHO =================================
ECHO ===    UserGuess Incorrect    ===
ECHO =================================
ECHO -
ECHO -
GOTO Dice

:endGame
ECHO =================================
ECHO ===     UserGuess Correct     ===
ECHO =================================
ECHO -
ECHO   Total Rount : %Rount%
ECHO -
GOTO ExitAndMenu

:ExitAndMenu
SET /P choice=Please Enter e(Exit) or m(Menu) :
IF %choice% == m GOTO menu
IF %choice% == e EXIT
GOTO ExitAndMenu