ok, but I dont understand if our code has made our scheme faster or slower? like we using all those techniques like cache highlighting, precompilation and everything but still there is no such difference in speed, even most of the time it performs better when those features are turned off...

please what are we doing wrong?

when:
enable_precompile = true,
cache_highlights = true,

try one:
[Snail] Trying precompiled: /home/aliqyanabid/.local/share/nvim/lazy/snail.nvim/lua/snail/palette.lua
c
[Snail] Using precompiled palette
[Snail] Trying precompiled: /home/aliqyanabid/.local/share/nvim/lazy/snail.nvim/lua/snail/highlights.
luac
[Snail] Using precompiled highlights
[Snail] Trying precompiled: /home/aliqyanabid/.local/share/nvim/lazy/snail.nvim/lua/snail/utils.luac
[Snail] Using precompiled utils
[Snail] Loaded in 0.874ms

try two:
[Snail] Trying precompiled: /home/aliqyanabid/.local/share/nvim/lazy/snail.nvim/lua/snail/palette.lua
c
[Snail] Using precompiled palette
[Snail] Trying precompiled: /home/aliqyanabid/.local/share/nvim/lazy/snail.nvim/lua/snail/highlights.
luac
[Snail] Using precompiled highlights
[Snail] Trying precompiled: /home/aliqyanabid/.local/share/nvim/lazy/snail.nvim/lua/snail/utils.luac
[Snail] Using precompiled utils
[Snail] Loaded in 0.572ms

try three:
[Snail] Trying precompiled: /home/aliqyanabid/.local/share/nvim/lazy/snail.nvim/lua/snail/palette.lua
c
[Snail] Using precompiled palette
[Snail] Trying precompiled: /home/aliqyanabid/.local/share/nvim/lazy/snail.nvim/lua/snail/highlights.
luac
[Snail] Using precompiled highlights
[Snail] Trying precompiled: /home/aliqyanabid/.local/share/nvim/lazy/snail.nvim/lua/snail/utils.luac
[Snail] Using precompiled utils
[Snail] Loaded in 0.680ms

when:
enable_precompile = false,
cache_highlights = false,

try one:
[Snail] Using Lua source for palette
[Snail] Using Lua source for highlights
[Snail] Using Lua source for utils
[Snail] Loaded in 0.422ms


try two:
[Snail] Using Lua source for palette
[Snail] Using Lua source for highlights
[Snail] Using Lua source for utils
[Snail] Loaded in 0.579ms

try three:
[Snail] Using Lua source for palette
[Snail] Using Lua source for highlights
[Snail] Using Lua source for utils
[Snail] Loaded in 0.395ms
