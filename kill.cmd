@ECHO OFF
@SET processBaseName=%1
@SET extension="%2"
if %extension%=="" (
	SET extension=exe
)
SET processName=%processBaseName%
echo killing %processName%
wmic process where "name like '%%%processName%%%'" delete