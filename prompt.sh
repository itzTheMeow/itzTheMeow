#######################################################
#                      Credits                        #
#                    Made by Meow                     #
#                                                     #
#      Cat: https://www.asciiart.eu/animals/cats      #
#                                                     #
#######################################################

# Run With
# bash <(curl -sS "https://raw.githubusercontent.com/itzTheMeow/itzTheMeow/main/prompt.sh?$(date +%s)")

if ! command -v lolcat &> /dev/null
then
    echo "Couldn't find lolcat, installing..."
    sudo apt-get install -y lolcat > /dev/null
fi

if ! command -v mpstat &> /dev/null
then
    echo "Couldn't find sysstat, installing..."
    sudo apt-get install -y sysstat > /dev/null
fi

REL="$(lsb_release -d)"
UP="$(uptime -p)"

RST="\033[0m"
BLD="\033[1m"

echo -e "
  \    /\   ${BLD}$(whoami)@$(hostname) on ${REL:13}${RST}
   )  ( ')  ${BLD}CPU: $(mpstat | awk 'END{print 100-$NF"%"}')${RST}
  (  /  )   ${BLD}MEM: $(awk '/^Mem/ {print $3}' <(free -m))mb/$(awk '/^Mem/ {print $2}' <(free -m))mb${RST}
   \(__)|   ${BLD}DSK: $(awk '/^\/dev/ {print $3}' <(df -H | grep "/dev/sda1 "))B/$(awk '/^\/dev/ {print $2}' <(df -H | grep "/dev/sda1 "))B${RST}

  ${BLD}Uptime: ${UP:3}${RST}
  ${BLD}Packages: $(dpkg --list | wc --lines)${RST}
" | lolcat
