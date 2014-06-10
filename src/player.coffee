class Player extends Sprite
  Player.WIDTH = 32
  Player.HEIGHT = 32
  Player.ANIM_WAIT = 3;
  Player.ANIM_MAX = 3;
  Player.FRAME_INDEX = [[0,1,2],[6,7,8],[12,13,14],[18,19,20]]
  Player.MOVE_SPEED = 3
  Player.FLASH_FRAME = 10
  constructor: (x, y) ->
    super Player.WIDTH, Player.HEIGHT
    
    @now_frame_index = 0;
    @anim_wait = Player.ANIM_WAIT
    @flash_frame = Player.FLASH_FRAME
    
    @player_turn = SampleGame.DOWN
    
    @x = x
    @y = y
    @image = SampleGame.game.assets['chara.png']

    @addEventListener 'enterframe', ->
      input = SampleGame.game.input;
      #移動
      if input.down 
        @y = @y+Player.MOVE_SPEED
        @player_turn = SampleGame.DOWN
      if input.up 
        @y = @y-Player.MOVE_SPEED
        @player_turn = SampleGame.UP
      if input.left 
        @x = @x-Player.MOVE_SPEED
        @player_turn = SampleGame.LEFT
      if input.right 
        @x = @x+Player.MOVE_SPEED
        @player_turn = SampleGame.RIGHT
      
      #画面外に出るのを防ぐ
      if @x < 0
        @x = 0
      if @x > SampleGame.WIDTH_SIZE - Player.WIDTH
        @x = SampleGame.WIDTH_SIZE - Player.WIDTH
      if @y < 0
        @y = 0
      if @y > SampleGame.HEIGHT_SIZE - Player.HEIGHT - 100
        @y = SampleGame.HEIGHT_SIZE - Player.HEIGHT - 100
        
      #アニメーション
      @anim_wait--
      if @anim_wait <= 0
        @now_frame_index++;
        if @now_frame_index >= Player.ANIM_MAX
          @now_frame_index = 0
        @frame = Player.FRAME_INDEX[@player_turn][@now_frame_index]
        @anim_wait = Player.ANIM_WAIT
        
  is_enemy_hit: -> 
    for i in [0..EnemyManage.ENEMY_MAX]
      if SampleGame.enemy.enemy_obj[i] != null && !SampleGame.enemy.enemy_obj[i].is_die
        distance = ((Enemy.WIDTH-14)+Player.WIDTH-6)/2;
        if SampleGame.enemy.enemy_obj[i].within(@, distance)
          return i
      else 
        return -1
    return -1

  flash: ->
    @flash_frame--
    if @flash_frame <= 0
      if @visible
        @visible = false
      else
        @visible = true
      @flash_frame = Player.FLASH_FRAME
    return 0