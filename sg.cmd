
@SET param="%1"
@SET currentDir=%~dp0
@SET subgitDir="C:\"
@SET sharedDaemonDir="%USERPROFILE%\scoop\apps\subgit\current\daemon-shared"
@IF %param%=="start" (
  subgit daemon start %sharedDaemonDir%
) ELSE (
  subgit daemon stop %sharedDaemonDir%
)
