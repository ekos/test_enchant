class Shot extends Sprite
  constructor: (x, y) ->
    super 100, 100
    Shot.SHOT_MAX = 20
    @bullet_num = 0
    @bullet_obj = []
    
    @x = x
    @y = y
    
    @image = SampleGame.game.assets['apad.png']
    
    for i in [0..Shot.SHOT_MAX]
      @bullet_obj[i] = null
    
    
    @addEventListener 'touchstart', ->
      if @bullet_num < Shot.SHOT_MAX
        bullet_turn = SampleGame.player.player_turn
        if bullet_turn == SampleGame.DOWN
          bullet_x = SampleGame.player.x + (16 / 2)
          bullet_y = SampleGame.player.y + (16)
        else if bullet_turn == SampleGame.UP
          bullet_x = SampleGame.player.x + (16 / 2)
          bullet_y = SampleGame.player.y - (16)
        else if bullet_turn == SampleGame.LEFT
          bullet_x = SampleGame.player.x - (16)
          bullet_y = SampleGame.player.y + (16 / 2)
        else if bullet_turn == SampleGame.RIGHT
          bullet_x = SampleGame.player.x + (16)
          bullet_y = SampleGame.player.y + (16 / 2)
        for i in [0..Shot.SHOT_MAX]
          if @bullet_obj[i] == null
            @bullet_obj[i] = new Bullet(bullet_x, bullet_y, bullet_turn)
            SampleGame.game.rootScene.addChild @bullet_obj[i]
            @bullet_num++
            break
      
    @addEventListener 'enterframe', ->
      for i in [0..Shot.SHOT_MAX]
        if @bullet_obj[i] != null
          if @bullet_obj[i].is_die
            SampleGame.game.rootScene.removeChild @bullet_obj[i]
            @bullet_obj[i] = null
            @bullet_num--