
@SET param="%1"
@SET currentDir=%~dp0
@SET subgitDir=""%USERPROFILE%\scoop\apps\subgit\current"
@SET sharedDaemonDir="%USERPROFILE%\scoop\persist\subgit\daemon-shared"
@IF %param%=="start" (
	subgit daemon start %sharedDaemonDir%
) ELSE IF %param%=="stop" (
	subgit daemon stop %sharedDaemonDir%
) ELSE IF %param%=="list" (
	subgit daemon list %sharedDaemonDir%
) ELSE (
	@FOR /F "tokens=* USEBACKQ" %%F IN (`scoop which subgit`) DO (
		@SET subgit_dir=%%F
	)
	subgit --version
	echo subgit executable path: %subgit_dir%
)
