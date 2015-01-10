# Basado (ok, copiado) en el trabajo de bbatsov (prelude)

install_dotfiles () {
    printf "$BBLUE Clonando el repositorio de configuración desde Github...\n$RESET"
    if [ x$DOTFILES_VERBOSE != x ]
    then
        /usr/bin/env git clone $DOTFILES_URL "$DOTFILES_INSTALL_DIR"
    else
        /usr/bin/env git clone $DOTFILES_URL "$DOTFILES_INSTALL_DIR" > /dev/null
    fi
    if ! [ $? -eq 0 ]
    then
        printf "$RED Un error fatal ocurrió al intentar instalar. Abortamos la misión...\n\n"
        exit 1
    fi
}

make_dotfiles_dirs () {
    printf "$BBLUE Creando los directorios requeridos.\n$RESET"
    mkdir -p "$DOTFILES_INSTALL_DIR" "$DOTFILES_INSTALL_DIR/personal"
}

make_symbolic_links () {
    printf "$BBLUE Creando los enlaces simbólicos requeridos.\n$RESET"
    if [ -e $HOME/.bashrc ]
    then
        printf "$BYELLOW Ya existe el archivo .bashrc => respaldamos\n"
        mv $HOME/.bashrc $HOME/.bashrc.old
    fi
    
    if [ -e $HOME/.zshrc ]
    then
        printf "$BYELLOW Ya existe el archivo .zshrc => respaldamos\n"
        mv $HOME/.zshrc $HOME/.zshrc.old
    fi

    ln -s $DOTFILES_INSTALL_DIR/bashrc .bashrc
    ln -s $DOTFILES_INSTALL_DIR/irbrc  .irbrc
    ln -s $DOTFILES_INSTALL_DIR/hgrc   .hgrc
    ln -s $DOTFILES_INSTALL_DIR/screenrc .screenrc
    ln -s $DOTFILES_INSTALL_DIR/gitconfig .gitconfig
    ln -s $DOTFILES_INSTALL_DIR/ssh       .ssh
    ln -s $DOTFILES_INSTALL_DIR/psqlrc       .psqlrc
    ln -s $DOTFILES_INSTALL_DIR/tmux.conf       .tmux.conf
    ln -s $DOTFILES_INSTALL_DIR/zshrc       .zshrc
    ln -s $DOTFILES_INSTALL_DIR/Xdefaults       .Xdefaults
    ln -s $DOTFILES_INSTALL_DIR/Xresources       .Xresources
}

colors_ () {
    case "$SHELL" in
    *zsh)
        autoload colors && colors
        eval RESET='$reset_color'
        for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE
        do
            eval $COLOR='$fg_no_bold[${(L)COLOR}]'
            eval B$COLOR='$fg_bold[${(L)COLOR}]'
        done
        ;;      
    *)
        RESET='\e[0m' # Reset
        RED='\e[0;31m' # Red
        GREEN='\e[0;32m' # Green
        YELLOW='\e[0;33m' # Yellow
        BLUE='\e[0;34m' # Blue
        PURPLE='\e[0;35m' # Magenta
        CYAN='\e[0;36m' # Cyan
        WHITE='\e[0;37m' # White
        BRED='\e[1;31m' # Bold Red
        BGREEN='\e[1;32m' # Bold Green
        BYELLOW='\e[1;33m' # Bold Yellow
        BBLUE='\e[1;34m' # Bold Blue
        BPURPLE='\e[1;35m' # Bold Magenta
        BCYAN='\e[1;36m' # Bold Cyan
        BWHITE='\e[1;37m' # Bold White
        ;;
    esac
}

VERBOSE_COLOR=$BBLUE
DORFILES_VERBOSE='true'

[ -z "$DOTFILES_URL" ] && DOTFILES_URL="https://github.com/nanounanue/dotfiles.git"
[ -z "$DOTFILES_INSTALL_DIR" ] && DOTFILES_INSTALL_DIR="$HOME/dotfiles"

if [ x$DOTFILES_VERBOSE != x ]
then
    printf "$VERBOSE_COLOR"
    printf "DOTFILES_VERBOSE = $DOTFILES_VERBOSE\n"
    printf "INSTALL_DIR = $DOTFILES_INSTALL_DIR\n"
    printf "SOURCE_URL = $DOTFILES_URL\n"
    printf "$RESET"
fi

# Si ya están instalados los dotfiles
if [ -d "$DOTFILES_INSTALL_DIR/zshrc" ]
then
    printf "\n\n$BRED"
    printf "Ya tienes instalados los dotfiles.$RESET\nNecesitas borrar $DOTFILES_INSTALL_DIR si quieres instalar los dotfiles de nuevo.\n"
    printf "Si quieres actualizar tu copia local, ejecuta 'git pull origin master' desde $DOTFILES_INSTALL_DIR\n\n"
    exit 1;
fi

### Verificar dependencias
printf "$CYAN Verificando si git está instalado... $RESET"
if hash git 2>&-
then
    printf "$GREEN encontrado.$RESET\n"
else
    printf "$RED no encontrado. ¡Abortando la instalación!$RESET\n"
exit 1
fi;


# Instalando los dotfiles
install_dotfiles
make_dotfiles_dirs
make_symbolic_links

printf "\n"
printf "$BBLUE\n"
printf "$BBLUE     _       _      __ _ _            \n"
printf "$BBLUE    | |     | |    / _(_) |           \n"
printf "$BBLUE  __| | ___ | |_  | |_ _| | ___  ___  \n"
printf "$BBLUE / _  |/ _ \| __| |  _| | |/ _ \/ __| \n"
printf "$BBLUE| (_| | (_) | |_  | | | | |  __/\__ \ \n"
printf "$BBLUE \__,_|\___/ \__| |_| |_|_|\___||___/ \n\n"
printf "$GREEN ... está instalado y listo para mejorar tu experiencia, $USER! ;)$RESET\n"
