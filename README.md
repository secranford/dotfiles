# Repo to Store dot files
- Store this repo somewhere then create symbolic links in your home directory to the dot files of your choosing within the directory of the machine you need. For example `ln -s /myrepo/boltzmann/.bashrc ~/.bashrc`.
- There is a separate branch for testing new changes to your dot files, be aware that your links will point to the active branch. So if you want to test changes, you can switch to the `dev` branch and make changes and then open a new terminal tab which will source the dot files on your active branch.

# Machines
- `boltzmann` is my lab machine with env variables specific to the system config
- `loki` is my lab cluster with env variables specific to that system, very similar to `boltzmann`
- `pc` is for my personal machine

# Vim Plugins
- To install plugins: `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
- Run `:PlugInstall` in vim to install plugins that are listed in `.vimrc` or similar files
- If you want to run without plugins, run `VIM_NOPLUG=1 vim` or add something similar to your `.vimrc`
- Add a custom help doc for your plugins. Create a `doc` directory, `mkdir -p ~/.vim/doc` and place `my-plugins.txt` within. In vim, run `:helptags ~/.vim/doc` to make vim load the docs and `:h my-plugins` to access the help from within vim.
- If you want/need to run without plugins, you should be able to use the same `.vimrc` although some features will be unavailable. Copy `onedark.vim` and `autoload_onedark.vim` to you `.vim/colors` and `.vim/autoload`, respectively to have access to the onedark colorscheme. Rename `autoload_onedark.vim` to `onedark.vim` once it is in `.vim/autoload`. Both files were copied from the [onedark][onedark] github page.

[onedark]: https://github.com/joshdick/onedark.vim
