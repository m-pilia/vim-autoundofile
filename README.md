# Enable or disable undofile automatically

This plugin exports a function `autoundofile#Setlocal` that allows to enable or
disable
[`persistent-undo`](http://vimdoc.sourceforge.net/htmldoc/undo.html#undo-persistence)
automatically for the current buffer, according to some conditions. The
function accepts three arguments:
1. An integer specifying a maximum length for the undo file name. If the file
   name has greater length, persistent undo will be disabled. This is useful
   for instance if the undo files are stored in a filesystem with file name
   length restrictions (such as
   [EncFs](https://github.com/vgough/encfs/blob/master/encfs/encfs.pod#CAVEATS)),
   since the undo file names include an encoding of the whole path and can be
   quite long.
2. A list of patterns. If the file name associated to the buffer matches any of
   the patterns, persistent undo will be disabled.
3. A flag for verbosity. If true, a message will be emitted if persistent undo
   is disabled.

The function can be called automatically when entering a buffer by creating an
autocommand (e.g. in `.vimrc`):
```vim
autocmd BufNewFile,BufRead * call autoundofile#Setlocal(75, ['/tmp.*'], 1)
```

# License
Autoundofile is distributed under the [GPL3 license](blob/master/LICENSE).
