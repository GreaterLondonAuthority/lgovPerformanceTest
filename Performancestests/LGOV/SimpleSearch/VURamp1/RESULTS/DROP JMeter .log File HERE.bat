@SET FORMAT_JMETER_LOG_FILE_DIR=D:\TEST_FRAMEWORK\TOOLS\GLA__Format_JMeter_Log_File

@echo(
@echo(
@echo     FORMATTING JMETER LOG FILE
@echo(
@echo         LOGFILE PATH       = %1
@echo(
@echo         ****************************
@echo         * DO NOT CLOSE THIS WINDOW *
@echo         ****************************
@echo(
@echo(

@cd /D %FORMAT_JMETER_LOG_FILE_DIR%

@CALL Format_JMeter_Log_File.bat %1

pause

