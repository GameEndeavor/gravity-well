extends Node
class_name Utils

# Angle lerping code courtesy of Zylann: https://godotengine.org/qa/5770/how-to-lerp-between-two-angles?show=5798#a5798
static func lerp_angle(a, b, t):
	if abs(a-b) >= PI:
		if a > b:
			a = normalize_angle(a) - 2.0 * PI
		else:
			b = normalize_angle(b) - 2.0 * PI
	return lerp(a, b, t)

static func normalize_angle(x):
	return fposmod(x + PI, 2.0*PI) - PI