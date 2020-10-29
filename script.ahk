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

; Undo
!z::Send ^z

; Redo
!y::Send ^y

; New tab
!t::Send ^t

; close tab
!w::Send ^w

; Close windows (cmd + q to Alt + F4)
!q::Send !{F4}

; minimize windows
!m::WinMinimize,a

!r::Send ^r
!Backspace::Send ^d
+!Backspace::FileRecycleEmpty
+!n::Send ^+n
!Left::Send {Home}
!Right::Send {End}
