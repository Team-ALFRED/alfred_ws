from PIL import Image

MAP_FILE = "/home/avengineer/alfred_ws/ros_alfred/src/alfred_maps/pharos_lab/pharos_lab.pgm"
OUTPUT   = "/home/avengineer/alfred_ws/ros_alfred/src/alfred_maps/pharos_lab/pharos_lab.png"

def trim(im):
    width = im.size[0]
    height = im.size[1]

    box = [width, width, 0, 0]
    color = im.getpixel((0, 0))

    for y in range(0, height, 10):
        for x in range(min(box[0], width/2)):
            if im.getpixel((x, y)) != color:
                box[0] = x - 25
                break

    for y in range(0, height, 10):
        for x in range(width-1, max(box[2], width/2), -1):
            if im.getpixel((x, y)) != color:
                box[2] = x + 25
                break

    for x in range(0, width, 10):
        for y in range(min(box[1], height/2)):
            if im.getpixel((x, y)) != color:
                box[1] = y - 25
                break

    for x in range(0, width, 10):
        for y in range(height-1, max(box[3], height/2), -1):
            if im.getpixel((x, y)) != color:
                box[3] = y + 25
                break

    x = max(width/2-box[0], box[2]-width/2)
    y = max(height/2-box[1], box[3]-height/2)
    box = [width/2-x, height/2-y, width/2+x, height/2+y]

    return im.crop(box)

def replace_color(im, old_color, new_color):
    for x in range(im.size[0]):
        for y in range(im.size[1]):
            if im.getpixel((x, y)) == old_color:
              im.putpixel((x, y), new_color)

if __name__ == "__main__":
    im = Image.open(MAP_FILE)
    crop = trim(im)
    color = im.getpixel((0,0))
    replace_color(crop, color, 240)

    crop.save(OUTPUT)
