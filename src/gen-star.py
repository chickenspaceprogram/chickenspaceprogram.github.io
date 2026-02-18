#!/usr/bin/env python3
import math

class StarData:
	# creates a 200x200 star with 10px border on all sides
	star_radius: int = 100
	star_border: int = 5
	stroke_color: str = "efefd0"
	stroke_width: int = 5
	stroke_opacity: float = 1.0
	fill_opacity: float = 0.0

	# in radians
	rotate_angle: float = 0.0
	def __init__(self, npts: int, skipped_pts: int):
		self.npts = npts
		self.skipped_pts = skipped_pts
	def __get_angle(self, i):
		return 2 * math.pi * i / self.npts + self.rotate_angle
	def __get_pt(self, i):
		return (self.star_radius * math.cos(self.__get_angle(i)) \
				+ self.star_radius + self.star_border, \
			-self.star_radius * math.sin(self.__get_angle(i)) \
				+ self.star_radius + self.star_border)
	def gen_svg(self) -> str:
		# peak readability
		points: list[(int, int)] = \
			[ self.__get_pt(i) for i in range(self.npts) ]
		lines: list[((int, int), (int, int))] = [ \
			(pt, points[(i + self.skipped_pts) % self.npts]) \
			for (i, pt) in enumerate(points) \
		]
		lines_txt: str = ""
		for ((p1x, p1y), (p2x, p2y)) in lines:
			lines_txt += f'''<line x1="{p1x}" y1="{p1y}" x2="{p2x}" y2="{p2y}" />\n'''

		return \
f'''<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg xmlns="http://www.w3.org/2000/svg" version="1.0" width="{2 * ( \
self.star_radius + self.star_border)}" height="{2 * (self.star_radius \
+ self.star_border)}">
<g style="stroke:#{self.stroke_color};stroke-width:{self.stroke_width \
};stroke-opacity:{self.stroke_opacity};fill-opacity:{self.fill_opacity}">
{lines_txt}</g>
</svg>'''

print(StarData(7, 3).gen_svg())
