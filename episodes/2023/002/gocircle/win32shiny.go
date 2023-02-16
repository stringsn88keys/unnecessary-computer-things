package main

import (
	"image"
	"image/color"

	"golang.org/x/exp/shiny/driver"
	"golang.org/x/exp/shiny/screen"
	"golang.org/x/image/draw"
)

func main() {
	driver.Main(func(s screen.Screen) {
		w, err := s.NewWindow(&screen.NewWindowOptions{
			Width:  300,
			Height: 300,
		})
		if err != nil {
			panic(err)
		}
		defer w.Release()

		for {
			select {
			case e := <-w.Events():
				switch e := e.(type) {
				case screen.EventResize:
					img, _ := s.NewBuffer(image.Point{e.WidthPx, e.HeightPx})
					draw.Circle(img.RGBA(), img.Bounds().Center(), 50, color.RGBA{255, 0, 0, 255}, draw.Over)
					w.Upload(image.Point{}, img, img.Bounds())
					w.Publish()

				case screen.EventClose:
					return
				}
			}
		}
	})
}
