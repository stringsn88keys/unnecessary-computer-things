package main

import (
	"fmt"
	"syscall"
	"unsafe"

	"github.com/lxn/win"
)

func main() {
	var hwnd win.HWND
	var hdc win.HDC
	var hbrush win.HBRUSH

	// Register the window class
	var wc win.WNDCLASSEX
	wc.CbSize = uint32(unsafe.Sizeof(wc))
	wc.LpfnWndProc = syscall.NewCallback(wndProc)
	wc.HInstance = win.HINSTANCE(syscall.Handle(win.GetModuleHandle(nil)))
	wc.HIcon = win.LoadIcon(0, win.MakeIntResource("IDI_APPLICATION"))
	wc.HCursor = win.LoadCursor(0, win.MakeIntResource("IDC_ARROW"))
	wc.HbrBackground = win.HBRUSH(win.GetStockObject(win.WHITE_BRUSH))
	wc.LpszClassName = syscall.StringToUTF16Ptr("Circle")
	win.RegisterClassEx(&wc)

	// Create the window
	hwnd = win.CreateWindowEx(0, syscall.StringToUTF16Ptr("Circle"), syscall.StringToUTF16Ptr("Circle"), win.WS_OVERLAPPEDWINDOW, win.CW_USEDEFAULT, win.CW_USEDEFAULT, win.CW_USEDEFAULT, win.CW_USEDEFAULT, 0, 0, wc.HInstance, nil)
	win.ShowWindow(hwnd, win.SW_SHOWNORMAL)

	// Run the message loop
	var msg win.MSG
	for win.GetMessage(&msg, 0, 0, 0) != 0 {
		win.TranslateMessage(&msg)
		win.DispatchMessage(&msg)
	}
}

func wndProc(hwnd win.HWND, msg uint32, wparam, lparam uintptr) uintptr {
	switch msg {
	case win.WM_PAINT:
		var ps win.PAINTSTRUCT
		hdc := win.BeginPaint(hwnd

