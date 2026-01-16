@echo:
@echo:
@echo * %date% %time% : RESYNCING THE TIME
@echo:
@w32tm /resync
@echo:
@echo:

@echo * %date% %time% : VERIFYING SYNC STATUS
@echo:
@w32tm /query /status
@echo:
@echo:

pause

