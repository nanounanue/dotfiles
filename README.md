Dotfiles
=============

Archivos de configuración (por que luego me da **home sick** :(


* * *


### Quick start

Ejecuta en la línea de comandos

        curl -L http://github.com/nanounanue/dotfiles/raw/master/installer.sh | sh


Te recomiendo actualizar esos archivos para poder reflejar tu nombre, credenciales, etc. en el archivo `gitconfig` (**Muy, muy importante**)


### Install fonts

#### Nerd fonts
https://github.com/ryanoasis/nerd-fonts


#### Powerline
https://github.com/powerline/fonts
https://powerline.readthedocs.io/en/latest/installation/linux.html#fonts-installation

 Download the latest version of the symbol font and fontconfig file:

    wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
    wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

 Move the symbol font to a valid X font path. Valid font paths can be listed with xset q:

    mv PowerlineSymbols.otf ~/.local/share/fonts/

 Update font cache for the path the font was moved to (root priveleges may be needed to update cache for the system-wide paths):

    fc-cache -vf ~/.local/share/fonts/

 Install the fontconfig file. For newer versions of fontconfig the config path is ~/.config/fontconfig/conf.d/, for older versions it’s ~/.fonts.conf.d/:

    mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/


#### Awesome fonts
https://github.com/gabrielelana/awesome-terminal-fonts

1. copy all the fonts from ./build directory to ~/.fonts directory
2. copy all the font maps (all *.sh files) from ./build directory to ~/.fonts directory
3. run fc-cache -fv ~/.fonts to let freetype2 know of those fonts
4. customize the configuration file ./config/10-symbols.conf replacing PragmataPro with the name of the font you want to use in the terminal (I will add more fonts in the future so that this step could be skippable)
5. copy the above configuration file to ~/.config/fontconfig/conf.d directory
6. source the font maps (source ~/.fonts/*.sh) in your shell startup script (eg. ~/.bashrc or ~/.zshrc)

