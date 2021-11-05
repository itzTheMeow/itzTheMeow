#######################################################
#                      Credits                        #
#                    Made by Meow                     #
#                                                     #
#      Cat: https://www.asciiart.eu/animals/cats      #
#                                                     #
#######################################################

# Run With
# bash <(curl -sS https://raw.githubusercontent.com/itzTheMeow/itzTheMeow/main/prompt.sh)

if ! command -v lolcat &> /dev/null
then
    echo "Couldn't find lolcat, installing..."
    sudo apt-get install lolcat
fi
if ! command -v sysstat &> /dev/null
then
    echo "Couldn't find sysstat, installing..."
    sudo apt-get install sysstat
fi

REL="$(lsb_release -d)"

echo "
  \    /\   $(whoami)@$(hostname) on ${REL:13}
   )  ( ')  CPU: 10%
  (  /  )   MEM: 1000mb/1500mb
   \(__)|   DSK: 50gb/100gb

  Uptime: 0s
  Packages: 100
" | lolcat