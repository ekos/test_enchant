class Bullet extends Sprite
  Bullet.WIDTH = 16
  Bullet.HEIGHT = 16
  Bullet.MOVE_SPEED = 5
  Bullet.FRAME_INDEX = [52,50,54,48]
  constructor: (x, y, turn) ->
    super Bullet.WIDTH, Bullet.HEIGHT
    
    @x = x
    @y = y
    @bullet_turn = turn
    @is_die = false
    @image = SampleGame.game.assets['icon.png']
    
    @frame = Bullet.FRAME_INDEX[@bullet_turn]
    
    @addEventListener 'enterframe', ->
      if @bullet_turn == SampleGame.DOWN
        @y += Bullet.MOVE_SPEED
      else if @bullet_turn == SampleGame.LEFT
        @x -= Bullet.MOVE_SPEED
      else if @bullet_turn == SampleGame.RIGHT
        @x += Bullet.MOVE_SPEED
      else if @bullet_turn == SampleGame.UP
        @y -= Bullet.MOVE_SPEED

      if @x < 0 - Bullet.WIDTH
        @is_die = true;
      if @x > SampleGame.WIDTH_SIZE + Bullet.WIDTH
        @is_die = true;
      if @y < 0  - Bullet.HEIGHT
        @is_die = true;
      if @y > (SampleGame.HEIGHT_SIZE - 100) + Bullet.HEIGHT 
        @is_die = true;
