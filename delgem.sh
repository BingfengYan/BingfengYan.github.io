for x in `gem list --no-versions`; 
    do gem uninstall $x -a -x -I;
done