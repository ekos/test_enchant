enchant()
class SampleGame extends Game
  constructor : ->
    super 320, 320
    @fps = 30
    SampleGame.game = @
    @preload "purimurabana1.gif"
    @onload = ->
      @rootScene.addChild new Player(100, 100)
    @start()

class Player extends Sprite
  constructor: (x, y) ->
    super 44, 32
    @x = x
    @y = y
    game = SampleGame.game
    @image = game.assets['purimurabana1.gif']
    @addEventListener 'enterframe', ->
      if game.input.up
        @y -= 5
      else if game.input.down
        @y += 5
      if game.input.left
        @x -= 5
      else if game.input.right
        @x += 5

window.onload = ->
  new SampleGame()
