default:
	fennel --compile control.fnl > control.lua
	fennel --compile main.fnl > main.lua
	fennel --compile player.fnl > player.lua
	fennel --compile sprites.fnl > sprites.lua
	fennel --compile enemies.fnl > enemies.lua
	fennel --compile config.fnl > config.lua

run:
	make
	love ./
