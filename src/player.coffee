class Player extends Sprite
  constructor: (x, y) ->
    super 32, 32
    
    
    @x = x
    @y = y
    game = SampleGame.game
    @image = game.assets['chara.png']

