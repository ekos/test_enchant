enchant()
class SampleGame extends Game
  constructor : ->
    super 320, 320
    @fps = 30
    SampleGame.game = @
    @preload "puzzle.png"
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
      @rootScene.addChild map
      @rootScene.addChild new Player(100, 100)
      @rootScene.addChild new Player(120, 120)
    @start()

class Player extends Sprite
  constructor: (x, y) ->
    super 18, 18
    
    
    @x = x
    @y = y
    game = SampleGame.game
    @image = game.assets['puzzle.png']
    @addEventListener 'touchstart', ->
      @frame += 1


window.onload = ->
  new SampleGame()
