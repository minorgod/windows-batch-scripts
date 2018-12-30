
@SET param="%1"
@SET currentDir=%~dp0
@SET subgitDir=""%USERPROFILE%\scoop\apps\subgit\current"
@SET sharedDaemonDir="%USERPROFILE%\scoop\persist\subgit\daemon-shared"
@IF %param%=="start" (
  subgit daemon start %sharedDaemonDir%
) ELSE IF %param%=="stop" (
  subgit daemon stop %sharedDaemonDir%
) ELSE (
  subgit --version
  scoop which subgit
)
