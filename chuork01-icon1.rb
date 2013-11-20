#!/usr/bin/env ruby
# encoding: utf-8

require 'cairo'

FONT = 'IPAexMincho'

WIDTH  = 600
HEIGHT = 600

def main
  write
end

def write
  Cairo::ImageSurface.new(:argb32, WIDTH, HEIGHT) do |surface|
    Cairo::Context.new(surface) do |context|
      draw(context)
    end
    surface.write_to_png("chuork01-icon1.png")
  end
end

def draw(context)
  draw_body(context)
  draw_text(context)
end

def draw_body(context)
  pattern = Cairo::LinearPattern.new(WIDTH * 0.4, 0,
                                     WIDTH * 0.2, HEIGHT)
  pattern.add_color_stop(0.0, :white)
  pattern.add_color_stop(0.1, 0.9, 0.9, 1.0)
  pattern.add_color_stop(1.0, 0.8, 0.8, 0.9)
  context.set_source(pattern)
  context.rectangle(0, 0, WIDTH, HEIGHT)
  context.fill
end

def draw_text(context)
  context.select_font_face(FONT)

  pattern = Cairo::LinearPattern.new(0, 0,
                                     WIDTH, HEIGHT * 0.5)
  pattern.add_color_stop(0.3, :black)
  pattern.add_color_stop(1.0, 0.0, 0.0, 0.3)
  context.set_source(pattern)
  show_text(context,  38, 175, 125, "札幌市")
  show_text(context, 200, 290, 125, "中央区")
  show_text(context, 175, 560, 125, "会議01")

  context.set_source_rgb(0.9, 0.0, 0.0)
  show_text(context, 100, 425, 163, "Ruby")

  context.set_source_rgb(0.1, 0.1, 0.2)
  show_text(context, 288, 55, 60, "#chuork01")
end

def show_text(context, x, y, size, text)
  context.move_to(x, y)
  context.font_size = size
  context.show_text(text)
end

main
