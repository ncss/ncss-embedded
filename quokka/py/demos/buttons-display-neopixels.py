import quokka
import neopixel
import radio

n = neopixel.NeoPixel()

quokka.display.print('radio fw', radio.version())
quokka.sleep(1000)
n.clear()
n.show()


while True:
  if quokka.button_a.was_pressed():
    quokka.display.print('a')
    quokka.red.toggle()

  if quokka.button_b.was_pressed():
    quokka.display.print('b')
    quokka.blue.toggle()

  if quokka.button_c.was_pressed():
    quokka.display.print('c')
    quokka.orange.toggle()

  if quokka.button_d.was_pressed():
    quokka.display.print('d')
    quokka.green.toggle()

  if quokka.button_usr.was_pressed():
    quokka.display.print('u')

  if quokka.button_a.is_pressed():
    n.set_pixel(0, 255, 0, 0)
  else:
    n.set_pixel(0, 0, 0, 0)

  if quokka.button_b.is_pressed():
    n.set_pixel(1, 255, 0, 0)
  else:
    n.set_pixel(1, 0, 0, 0)

  if quokka.button_c.is_pressed():
    n.set_pixel(2, 255, 0, 0)
  else:
    n.set_pixel(2, 0, 0, 0)

  if quokka.button_d.is_pressed():
    n.set_pixel(3, 255, 0, 0)
  else:
    n.set_pixel(3, 0, 0, 0)

  if quokka.button_usr.is_pressed():
    n.set_pixel(4, 255, 0, 0)
  else:
    n.set_pixel(4, 0, 0, 0)

  n.show()
  quokka.sleep(50)
