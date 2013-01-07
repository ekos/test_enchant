enchant()
class SampleGame extends Game
  constructor : ->
    super 320, 320
    @fps = 30
    SampleGame.game = @
    @preload "puzzle.png"
    @preload "chara.png"
    @onload = ->
      map = new Map(6, 5)
      map.image = SampleGame.game.assets['puzzle.png']
      map.tileHeight = 18
      map.tileWidth = 18
      map.loadData([
        [0,1,2,3,4,5],
        [0,1,2,3,4,5],
        [0,1,2,3,4,5],
        [0,1,2,3,4,5],
        [0,1,2,3,4,5]
      ])
#      @rootScene.addChild map
      SampleGame.player = new Player(100, 100)
      @rootScene.addChild SampleGame.player
    @start()

class Player extends Sprite
  constructor: (x, y) ->
    super 32, 32
    
    
    @x = x
    @y = y
    game = SampleGame.game
    @image = game.assets['chara.png']

window.onload = ->
  new SampleGame()
