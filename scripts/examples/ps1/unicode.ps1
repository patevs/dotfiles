
# -------------------------------- #
# scripts/examples/ps1/unicode.ps1 #
# -------------------------------- #

# Source: https://taraksharma.com/supercharging-powershell-with-hyper-oh-my-posh-posh-git/

# Helper function to show Unicode characters

function U {
  param ( [int] $Code )
  if ( (0 -le $Code) -and ($Code -le 0xFFFF) ) {
    return [char] $Code
  }
  if ( (0x10000 -le $Code) -and ($Code -le 0x10FFFF) ) {
    return [char]::ConvertFromUtf32($Code)
  }
  throw "Invalid character code $Code"
}

# EOF #
