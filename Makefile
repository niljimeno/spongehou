default:
	fennel --compile control.fnl > control.lua
	fennel --compile main.fnl > main.lua
	fennel --compile player.fnl > player.lua
	fennel --compile sprites.fnl > sprites.lua

run:
	make
	love ./
