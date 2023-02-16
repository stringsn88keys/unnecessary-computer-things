// cl win32circle.c User32.lib gdi32.lib

#include <windows.h>

LRESULT CALLBACK WindowProc(HWND hwnd, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    switch (uMsg)
    {
    case WM_PAINT:
    {
        PAINTSTRUCT ps;
        HDC hdc = BeginPaint(hwnd, &ps);

        // Set the color of the circle to red
        HBRUSH hbrush = CreateSolidBrush(RGB(255, 0, 0));
        SelectObject(hdc, hbrush);

        // Draw a circle with a radius of 50 pixels
        Ellipse(hdc, 50, 50, 100, 100);

        // Clean up
        DeleteObject(hbrush);
        EndPaint(hwnd, &ps);
        return 0;
    }
    case WM_DESTROY:
    {
        PostQuitMessage(0);
        return 0;
    }
    }

    return DefWindowProc(hwnd, uMsg, wParam, lParam);
}

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
{
    WNDCLASSEX wc = {sizeof(WNDCLASSEX), CS_HREDRAW | CS_VREDRAW, WindowProc, 0, 0, hInstance, LoadIcon(NULL, IDI_APPLICATION), LoadCursor(NULL, IDC_ARROW), (HBRUSH)(COLOR_WINDOW + 1), NULL, "Circle", LoadIcon(NULL, IDI_APPLICATION)};
    RegisterClassEx(&wc);

    HWND hwnd = CreateWindowEx(0, "Circle", "Circle", WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, NULL, NULL, hInstance, NULL);
    ShowWindow(hwnd, nCmdShow);

    MSG msg;
    while (GetMessage(&msg, NULL, 0, 0))
    {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }

    return (int)msg.wParam;
}
