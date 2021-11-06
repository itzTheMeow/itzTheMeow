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

echo "
  \    /\   $(tput bold)$(whoami)@$(hostname) on ${REL:13}$(tput sgr0)
   )  ( ')  $(tput bold)CPU:$(tput sgr0) $(mpstat | awk 'END{print 100-$NF"%"}')
  (  /  )   $(tput bold)MEM:$(tput sgr0) $(awk '/^Mem/ {print $3}' <(free -m))mb/$(awk '/^Mem/ {print $2}' <(free -m))mb
   \(__)|   $(tput bold)DSK:$(tput sgr0) $(awk '/^\/dev/ {print $3}' <(df -H | grep "/dev/sda1 "))B/$(awk '/^\/dev/ {print $2}' <(df -H | grep "/dev/sda1 "))B

  $(tput bold)Uptime:$(tput sgr0) ${UP:3}
  $(tput bold)Packages:$(tput sgr0) $(dpkg --list | wc --lines)
" | lolcat
