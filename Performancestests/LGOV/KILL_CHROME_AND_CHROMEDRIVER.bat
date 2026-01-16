
@echo * %date% %time% : CLEANING UP ROGUE CHROMEDRIVER PROCESSES
@taskkill /IM chromedriver.exe /F 2>nul
@ping -n 5 -w 1 127.0.0.1 > nul
@echo:

@echo * %date% %time% : CLEANING UP ROGUE CHROME PROCESSES
@taskkill /IM chrome.exe /F 2>nul
@ping -n 5 -w 1 127.0.0.1 > nul
@echo:
@echo:

