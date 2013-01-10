class EnemyManage extends Sprite
  EnemyManage.ENEMY_MAX = 5
  constructor: ->
    super 0, 0
    @enemy_num = 0
    @enemy_obj = []
    
    for i in [0..EnemyManage.ENEMY_MAX]
      @enemy_obj[i] = null

    
    @addEventListener 'enterframe', ->
      if @enemy_num < EnemyManage.ENEMY_MAX
          
        for i in [0..EnemyManage.ENEMY_MAX]
          if @enemy_obj[i] == null
            x_rand = Math.floor( Math.random() * SampleGame.WIDTH_SIZE )
            y_rand = Math.floor( Math.random() * SampleGame.HEIGHT_SIZE )
            
            if x_rand < (SampleGame.WIDTH_SIZE / 2)
              x_rand -= (SampleGame.WIDTH_SIZE / 2) - Enemy.WIDTH
            else
              x_rand += (SampleGame.WIDTH_SIZE / 2)
              
            if y_rand < (SampleGame.HEIGHT_SIZE / 2)
              y_rand -= (SampleGame.HEIGHT_SIZE / 2) - Enemy.HEIGHT
            else
              y_rand += (SampleGame.HEIGHT_SIZE / 2)

            @enemy_obj[i] = new Enemy(x_rand, y_rand)
            SampleGame.game.rootScene.addChild @enemy_obj[i]
            @enemy_num++
            break
      for i in [0..EnemyManage.ENEMY_MAX]
        if @enemy_obj[i] != null
          if @enemy_obj[i].is_die
            SampleGame.game.rootScene.removeChild @enemy_obj[i]
            @enemy_obj[i] = null
            @enemy_num--