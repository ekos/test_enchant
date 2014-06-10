class Enemy extends Sprite
  Enemy.SPEED_RATE = 0.5
  Enemy.WIDTH = 54
  Enemy.HEIGHT = 70
  Enemy.HIT_POINT = 10
  Enemy.DAMAGE_FRAME = 5
  Enemy.FLASH_FRAME = 10
  constructor: (x, y) ->
    super Enemy.WIDTH, Enemy.HEIGHT
    @image = SampleGame.game.assets['enemy.png']
    
    @x = x
    @y = y
    @hit_point = Enemy.HIT_POINT
    @is_die = false
    @is_damage = false
    @damage_frame = 0
    @flash_frame = Enemy.FLASH_FRAME
    @addEventListener 'enterframe', ->
      x_speed = ((SampleGame.player.x + Player.WIDTH / 2) - (@x + Enemy.WIDTH / 2))
      y_speed = ((SampleGame.player.y + Player.HEIGHT / 2) - (@y + Enemy.HEIGHT / 2))
      
      l = Math.sqrt(x_speed * x_speed + y_speed * y_speed)
      
      @x += (x_speed / l) * Enemy.SPEED_RATE
      @y += (y_speed / l) * Enemy.SPEED_RATE
      
      if @is_damage
        @damage_frame--
        if @damage_frame <= 0
          @is_damage = false
          @image = SampleGame.game.assets['enemy.png']
      
      for i in [0..Shot.SHOT_MAX]
        if SampleGame.button.bullet_obj[i] != null && !SampleGame.button.bullet_obj[i].is_die
          distance = ((Enemy.WIDTH-14)+Bullet.WIDTH)/2;
          if SampleGame.button.bullet_obj[i].within(@, distance)
            if SampleGame.button.bullet_obj[i].bullet_turn == SampleGame.DOWN
              @y += 10
            else if SampleGame.button.bullet_obj[i].bullet_turn == SampleGame.UP
              @y -= 10
            else if SampleGame.button.bullet_obj[i].bullet_turn == SampleGame.RIGHT
              @x += 10
            else if SampleGame.button.bullet_obj[i].bullet_turn == SampleGame.LEFT
              @x -= 10
            SampleGame.button.bullet_obj[i].is_die = true
            
            SampleGame.score.score_num += 3
            
            @image = SampleGame.game.assets['enemy2.png']
            @damage_frame = Enemy.DAMAGE_FRAME
            @is_damage = true
            
            @hit_point--
            if @hit_point <= 0
              @is_die = true
              SampleGame.score.score_num += 10
  flash: ->
    @flash_frame--
    if @flash_frame <= 0
      if @visible
        @visible = false
      else
        @visible = true
      @flash_frame = Enemy.FLASH_FRAME
    return 0