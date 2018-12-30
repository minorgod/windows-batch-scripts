

# Before you begin, open an admin powershell session and enter the following two lines (without the # signs):

#Set-ExecutionPolicy Bypass -Scope Process -Force; 
#iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Then quit powershell and re-open it as a non-admin user and install scoop via the following two lines (without the # signs):

#Set-ExecutionPolicy RemoteSigned -scope CurrentUser -force
#iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

# Then you can run this script to install all the goodies below and get your machine mostly set up for development.
# Do not change the order of the install as some packages depend on stuff installed in previous steps. If you have
# an error at any step, quit powershell and try again as there might issues setting environment variables and reopening
# a new powershell session can help with that. Also, continuing a failed install will resume where it left off as scoop
# keeps track of installed packages so it will not take as long on subsequent runs. 

# Once installed, you can update scoop and all package info by typing "scoop update".
# To update some specific package type "scoop update somepackagename" 
# and to update all installed packages type "scoop update *"

# Enjoy. 

scoop install git git-lfs
#readd all official known buckets
#scoop bucket known | % { scoop bucket rm $_ }
scoop bucket known | % { scoop bucket add $_ }
#scoop update

#add bucket for tortoisegit
scoop bucket add wangzq https://github.com/wangzq/scoop-bucket
scoop install sudo

# Exclude windows defender scanning of scoop install dir
sudo Add-MpPreference -ExclusionPath $env:USERPROFILE\scoop

#some apps (winmerge) require microsoft visual c++ redistributable, so use chocolatey for that
#if any of the steps say skipping installation because they don't apply to this OS, just keep saying yes
#because there may be multiple packages in each install and some may apply.
sudo choco install vcredist-all -y
sudo scoop install 7zip

#utils
scoop install cygwin openssh 7zip curl sudo coreutils grep sed less conemu putty notepadplusplus notepadplusplus-pm sublime-text winscp filezilla git-lfs gitignore winmerge
refreshenv
[environment]::setenvironmentvariable('GIT_SSH', (resolve-path (scoop which ssh)), 'USER')
refreshenv

#register notepad++ shell extensions so we have the "open in notepad++" option in our shell
sudo regsvr32 /s /i (Split-Path -Path (scoop which notepad++) -Parent)\NppShell.dll
sudo regsvr32 /s /i (Split-Path -Path (scoop which notepad++) -Parent)\NppShell64.dll
refreshenv

#for some reason tortoisesvn doesn't install properly, so you'll need to do it manually
#sudo scoop install tortoisesvn
sudo scoop install tortoisegit tortoisesvn
#run tortoisesvn registry scripts in scoop-extras repo:
# https://github.com/lukesampson/scoop-extras/tree/master/scripts/tortoisesvn
# and also manually set up tortoisegit path

#add my custom bucket for subgit and stuff
scoop bucket add minorgod https://github.com/minorgod/scoop-minorgod
scoop install subgit

# programming languages and JDKs -- the JAVA_HOME will be set to your java8 install dir automatically.
scoop install php composer python ruby nvm yarn oraclejdk8u

refreshenv
scoop install msys2

#You may want to stop at this point and restart your system, then re-run this script to continue.

sudo msys2

refreshenv
nvm install 10.13.0
#You may want to stop at this point and restart your system, then re-run this script to continue.

sudo nvm use 10.13.0

#browsers
scoop install firefox-developer phantomjs

#graphics apps
scoop install inkscape gimp imagemagick

#optional cool stuff:
#clean up junk programs!!!
scoop install bulk-crap-uninstaller

#open source password manager
scoop install bitwarden 

#editors and merge tools
scoop install beyondcompare brackets 

#c++ compiler helper
scoop install cmake-rc 

#commandline tool to list and manipulate windows
scoop install cmdow


# Install weblogic 10.3.6 (wls1036_generic.jar)
#http://download.oracle.com/otn/nt/middleware/11g/wls/1036/wls1036_dev.zip
#http://download.oracle.com/otn/nt/middleware/11g/wls/1036/wls1036_dev_supplemental.zip
#http://download.oracle.com/otn/nt/middleware/11g/wls/1036/wls1036_generic.jar
#http://download.oracle.com/otn/nt/middleware/11g/wls/1036/wls1036_dev_supplemental.zip
#%JAVA_HOME%\bin\java -Xmx1024m -jar wls1036_generic.jar



# Install weblogic 12c from minimal zip file distro:
#http://download.oracle.com/otn/nt/middleware/12c/12213/fmw_12.2.1.3.0_wls_Disk1_1of1.zip
#http://download.oracle.com/otn/nt/middleware/12c/wls/1213/wls1213_dev_update3.zip
#http://download.oracle.com/otn/nt/middleware/12c/wls/1213/wls1213_dev_supplemental_update3.zip


# WAMP stack
#scoop install apache mariadb php
#iex (new-object net.webclient).downloadstring('https://gist.github.com/lukesampson/6546858/raw/apache-php-init.ps1')

# console theme
scoop install concfg pshazz
concfg import solarized small

#Install IDEs
scoop install jetbrains-toolbox


#Install goodies
scoop install mplayer vlc sumatrapdf


#INSTALL NON-PORTABLE APPS
#Install VirtualBox
scoop install virtualbox-np

#some handy shell menu commands
scoop install shelltools-np

exit 0

#Reboot or logout and log back in, then run the ruby installer to install msys2 toolchain..
#This allows linux build tools used by ruby to compile c binaries and extensions. 
#Just accept the defaults by hitting enter when the ruby installer asks what to install. 
#ridk install