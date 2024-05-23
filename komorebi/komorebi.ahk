#SingleInstance Force

; Block the Windows key default behavior when pressed alone
SetCapsLockState("AlwaysOff")

; Load library
#Include komorebic.lib.ahk


; Focus windows
CapsLock & h::CycleFocus("previous")
CapsLock & j::Focus("down")
CapsLock & k::Focus("up")
CapsLock & l::CycleFocus("next")

; Move windows
CapsLock & Left::Move("left")
CapsLock & Down::Move("down")
CapsLock & Up::Move("up")
CapsLock & Right::Move("right")
CapsLock & Enter::Promote()

; Resize
CapsLock & u::ResizeAxis("horizontal", "increase")
CapsLock & p::ResizeAxis("horizontal", "decrease")
CapsLock & o::ResizeAxis("vertical", "increase")
CapsLock & i::ResizeAxis("vertical", "decrease")

; Manipulate windows
CapsLock & f::ToggleFloat()
CapsLock & z::ToggleMonocle()

; Stack windows
!Left::Stack("left")
!Right::Stack("right")
!Up::Stack("up")
!Down::Stack("down")
CapsLock & q::Unstack()
CapsLock & n::CycleStack("previous")
CapsLock & m::CycleStack("next")

; Window manager options
CapsLock & r::Retile()
CapsLock & t::TogglePause()

; Layouts
CapsLock & x::FlipLayout("horizontal")
CapsLock & y::FlipLayout("vertical")

; Workspaces
CapsLock & 1::FocusWorkspace(0)
CapsLock & 2::FocusWorkspace(1)
CapsLock & 3::FocusWorkspace(2)
CapsLock & 4::FocusWorkspace(3)
CapsLock & 5::FocusWorkspace(4)

; Move windows across workspaces
#1::MoveToWorkspace(0)
#2::MoveToWorkspace(1)
#3::MoveToWorkspace(2)
#4::MoveToWorkspace(3)
#5::MoveToWorkspace(4)

;Start/Stop
CapsLock & s::Stop()

;Close
CapsLock & c::Close()

;Minimize
CapsLock & w::Minimize()
