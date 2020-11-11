; Make Ctrl + S work with cmd (windows) key
!s::Send, ^s

; Selecting
!a::Send, ^a

; Copying
!c::Send, ^c

; Pasting
!v::Send, ^v

; Cutting
!x::Send, ^x

; Opening
!o::Send ^o

; Finding
!f::Send ^f

; Global Finding
+!f::Send +^f

; Undo
!z::Send ^z

; Redo
!y::Send ^y
!+z::Send ^+z

; New tab
!t::Send ^t

; close tab
!w::Send ^w

; clear terminal history
!k::Send ^l

; Close windows (cmd + q to Alt + F4)
!q::Send !{F4}

; minimize windows
!m::WinMinimize,a

; refresh
!r::Send ^r

; delete file
!Backspace::Send ^d

; empty bin
+!Backspace::FileRecycleEmpty

; mkdir
+!n::Send ^+n

; 1password
+!x::Send ^+x

; move to beginning of line
!Left::Send {Home}

; move to end of line
!Right::Send {End}

; open new tab from chrome
!LButton::Send ^{LButton}

; vscode global search
!p::Send ^p

; get new line
+Enter::Send ^{Enter}

!/::Send ^/

#!i::Send ^+i

#c::Send !i