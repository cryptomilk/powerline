#!/usr/bin/vim -S
set encoding=utf-8
tabedit abc
tabedit def
try
	source powerline/bindings/vim/plugin/powerline.vim
catch
	call writefile([v:exception], 'message.fail')
	cquit
endtry
set ls=2
redrawstatus!
redir =>mes
	messages
redir END
let mess=split(mes, "\n")
if len(mess)>1
	call writefile(mess, 'message.fail')
	cquit
endif
qall!
