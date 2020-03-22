# ----------------------- #
# config/ps1/unix.ps1 #
# ----------------------- #

# PowerShell $PROFILE unix-like settings
# ~\Documents\WindowsPowerShell\unix.ps1

# --------------------------------------------------------------------------- #

# Just a couple of things (sed, to interpret sed scripts) from http://unxutils.sourceforge.net/
# Add-PathVariable "${env:ProgramFiles}\UnxUtils"

# Note PSReadLine uses vi keybindings by default. If you want emacs enable:
# Set-PSReadlineOption -EditMode Emacs
# I like vi keybindings, so I just add my favourite one from emacs
# See https://github.com/lzybkr/PSReadLine#usage
# Set-PSReadlineKeyHandler -Key 'Escape,_' -Function YankLastArg

# Change how powershell does tab completion
# http://stackoverflow.com/questions/39221953/can-i-make-powershell-tab-complete-show-me-all-options-rather-than-picking-a-sp
# Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete

# For dig, host, etc.
# Add-PathVariable "${env:ProgramFiles}\ISC BIND 9\bin"

# --------------------------------------------------------------------------- #

# ------------------ #
# Unix-like Commands #
# ------------------ #

# Like Unix touch, creates new files and updates time on old ones
# PSCX has a touch, but it doesn't make empty files
# Remove-Alias touch
function touch($file) {
	if ( Test-Path $file ) {
		Set-FileTime $file
	} else {
		New-Item $file -type file
	}
}

# function touch($file) {
# 	"" | Out-File $file -Encoding ASCII
# }

function grep($regex, $dir) {
  if ( $dir ) {
    get-childitem $dir | select-string $regex
    return
  }
  $input | select-string $regex
}

# Favour ripgrep over grep if installed
if(Check-Command rg){
  Set-Alias -Name grep -Value rg
}

function which($name) {
	Get-Command $name | Select-Object -ExpandProperty Definition
}

# From https://github.com/Pscx/Pscx
# function sudo(){
# 	Invoke-Elevated @args
# }

# function sudo {
#	 $file, [string]$arguments = $args;
#	 $psi = new-object System.Diagnostics.ProcessStartInfo $file;
#  $psi.Arguments = $arguments;
#  $psi.Verb = "runas";
#  $psi.WorkingDirectory = get-location;
#  [System.Diagnostics.Process]::Start($psi) >> $null
# }

# https://stackoverflow.com/questions/7690994/running-a-command-as-administrator-using-powershell
# function sudo {
  # Start-Process powershell -Verb runAs
#   if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
#     Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs;
#     exit
#   }
# }

# --------------------------------------------------------------------------- #

# ------------------------ #
# Logging Helper Functions #
# ------------------------ #

# Print a given string formatted colored green and underlined
function Print-Green-Underline ($str) {
  Write-Host "`n$([char]27)[4m$str$([char]27)[24m`n" -ForegroundColor Green
  # Write-Host "`n$([char]27)[4m$str$([char]27)[24m`n"
}

# --------------------------------------------------------------------------- #

# Print list of current directory contents
# Set-Alias l Get-ChildItem -option AllScope
# Set-Alias ls Get-ChildItemColorFormatWide -option AllScope

# Print short list of current directory contents
function dirList {
  # Write-Host "`nDirectory Contents:`n"  -ForegroundColor Green
  Print-Green-Underline "Directory Contents:"
  # Favour lsd over default dir command
  if (Check-Command lsd) {
    lsd --color always --icon always
  }
  else {
    Get-ChildItem
  }
}
Set-Alias -Name l -Value dirList

# Print list of current directory contents
function dirListAll {
  Print-Green-Underline "Directory Contents:"
  # Favour lsd over default dir command
  if (Check-Command lsd) {
    lsd -A1 --color always --icon always
  }
  else {
    Get-ChildItem | Format-Wide
  }
}
Set-Alias -Name ls -Value dirListAll -option AllScope -Force
Set-Alias -Name ll -Value dirListAll

# Print long list of current directory contents
function dirListLong {
  Print-Green-Underline "Directory Contents:"
  # Favour lsd over default dir command
  if (Check-Command lsd) {
    lsd -al --color always --icon always
  }
  else {
    Get-ChildItem | Format-List
  }
}
Set-Alias -Name lll -Value dirListLong

# Print directory tree
function dirTree {
  Print-Green-Underline "Directory Tree:"
  # Favour lsd over default tree command
  if (Check-Command lsd) {
    lsd --tree --color always --icon always
  }
  else {
    tree
  }
}
Set-Alias -Name lst -Value dirTree

# --------------------------------------------------------------------------- #

# Should really be name=value like Unix version of export but not a big deal
# function export($name, $value) {
# 	set-item -force -path "env:$name" -value $value;
# }

# function pkill($name) {
# 	get-process $name -ErrorAction SilentlyContinue | stop-process
# }

# function pgrep($name) {
# 	get-process $name
# }

# From https://stackoverflow.com/questions/894430/creating-hard-and-soft-links-using-powershell
# function ln($target, $link) {
# 	New-Item -ItemType SymbolicLink -Path $link -Value $target
# }
# set-alias new-link ln

# http://stackoverflow.com/questions/39148304/fuser-equivalent-in-powershell/39148540#39148540
# function fuser($relativeFile){
# 	$file = Resolve-Path $relativeFile
# 	write-output "Looking for processes using $file"
# 	foreach ( $Process in (Get-Process)) {
# 		foreach ( $Module in $Process.Modules) {
# 			if ( $Module.FileName -like "$file*" ) {
# 				$Process | select-object id, path
# 			}
# 		}
# 	}
# }

# https://gallery.technet.microsoft.com/WHOIS-PowerShell-Function-ed69fde6
# Unblock-File $PSScriptRoot\whois.ps1
# . $PSScriptRoot\whois.ps1

# function uptime {
# 	Get-CimInstance Win32_OperatingSystem | select-object csname, @{LABEL='LastBootUpTime';
# 	EXPRESSION={$_.ConverttoDateTime($_.lastbootuptime)}}
# }

# function df {
# 	get-volume
# }

# Todo: look at 'edit-file' from PSCX
# Repalced with real 'sed' to interpret sed scripts
# function sed($file, $find, $replace){
# 	(Get-Content $file).replace("$find", $replace) | Set-Content $file
# }

# Like a recursive sed
# function edit-recursive($filePattern, $find, $replace) {
# 	$files = get-childitem . "$filePattern" -rec # -Exclude
# 	write-output $files
# 	foreach ($file in $files) {
# 		(Get-Content $file.PSPath) |
# 		Foreach-Object { $_ -replace "$find", "$replace" } |
# 		Set-Content $file.PSPath
# 	}
# }

# function grepv($regex) {
# 	$input | where-object { !$_.Contains($regex) }
# }

# function show-links($dir){
# 	get-childitem $dir | where-object {$_.LinkType} | select-object FullName,LinkType,Target
# }

# function cut(){
# 	foreach ($part in $input) {
# 		$line = $part.ToString();
# 		$MaxLength = [System.Math]::Min(200, $line.Length)
# 		$line.subString(0, $MaxLength)
# 	}
# }

# function Private:file($file) {
# 	$extension = (Get-Item $file).Extension
# 	$fileType = (get-itemproperty "Registry::HKEY_Classes_root\$extension")."(default)"
# 	$description =  (get-itemproperty "Registry::HKEY_Classes_root\$fileType")."(default)"
# 	write-output $description
# }

# function find-file($name) {
# 	get-childitem -recurse -filter "*${name}*" -ErrorAction SilentlyContinue | foreach-object {
# 		write-output($PSItem.FullName)
#	 }
# }
# set-alias find find-file
# set-alias find-name find-file


# EOF #

