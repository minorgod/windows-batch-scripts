@echo off
echo use the full 'Find-Java' command in powershell for full options.
echo use param -Version 1.7, 1.8, 9, 10, 11 to select the java version
echo use param -SetSession to set the JAVA_HOME and JRE_HOME env vars for the current session only
echo use param -SetUser to permananetly set the JAVA_HOME and JRE_HOME env vars for the current user
echo use param -SetSystem to permananetly set the JAVA_HOME and JRE_HOME env vars for the system (requires admin rights)
echo use param -Output to specify the output (Valid options are AsEnv, None, All)
echo pipe to ConvertTo-JSON to output as json, eg: Find-Java -Output All ^| ConvertTo-JSON
echo.
echo.
echo java env vars: 
powershell -command Find-Java -Output AsEnv