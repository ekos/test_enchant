class Score extends Sprite
  constructor: (x, y) ->
    super 0, 0
    
    @score_num = 0
    @x_offset = x
    @y_offset = y
    Score.STR_INDEX = [51,35,47,50,37]
    Score.NUM_INDEX = [16,17,18,19,20,21,22,23,24,25]
    
    @str_sprite = []
    @num_sprite = []
    for i in [0..Score.STR_INDEX.length]
      @str_sprite[i] = new Sprite(16, 16)
      @str_sprite[i].moveTo(@x_offset+16*i, @y_offset)
      @str_sprite[i].image = SampleGame.game.assets['font.png']
      @str_sprite[i].frame = Score.STR_INDEX[i]
      SampleGame.game.rootScene.addChild @str_sprite[i]
      
    #10000
    @num_sprite[0] = new Sprite(16, 16)
    @num_sprite[0].moveTo(@x_offset+16*0, @y_offset+20)
    @num_sprite[0].image = SampleGame.game.assets['font.png']
    if @score_num == 0
      @num_sprite[0].frame = Score.NUM_INDEX[0]
    else
      @num_sprite[0].frame = Score.NUM_INDEX[Math.floor(@score_num / 10000)]
    SampleGame.game.rootScene.addChild @num_sprite[0]
    #1000
    @num_sprite[1] = new Sprite(16, 16)
    @num_sprite[1].moveTo(@x_offset+16*1, @y_offset+20)
    @num_sprite[1].image = SampleGame.game.assets['font.png']
    if @score_num == 0
      @num_sprite[1].frame = Score.NUM_INDEX[0]
    else
      @num_sprite[1].frame = Score.NUM_INDEX[Math.floor(@score_num % 10000 / 1000)]
    SampleGame.game.rootScene.addChild @num_sprite[1]
    #100
    @num_sprite[2] = new Sprite(16, 16)
    @num_sprite[2].moveTo(@x_offset+16*2, @y_offset+20)
    @num_sprite[2].image = SampleGame.game.assets['font.png']
    if @score_num == 0
      @num_sprite[2].frame = Score.NUM_INDEX[0]
    else
      @num_sprite[2].frame = Score.NUM_INDEX[Math.floor(@score_num % 1000 / 100)]
    SampleGame.game.rootScene.addChild @num_sprite[2]
    #10
    @num_sprite[3] = new Sprite(16, 16)
    @num_sprite[3].moveTo(@x_offset+16*3, @y_offset+20)
    @num_sprite[3].image = SampleGame.game.assets['font.png']
    if @score_num == 0
      @num_sprite[3].frame = Score.NUM_INDEX[0]
    else
      @num_sprite[3].frame = Score.NUM_INDEX[Math.floor(@score_num % 100 / 10)]
    SampleGame.game.rootScene.addChild @num_sprite[3]
    #1
    @num_sprite[4] = new Sprite(16, 16)
    @num_sprite[4].moveTo(@x_offset+16*4, @y_offset+20)
    @num_sprite[4].image = SampleGame.game.assets['font.png']
    if @score_num == 0
      @num_sprite[4].frame = Score.NUM_INDEX[0]
    else
      @num_sprite[4].frame = Score.NUM_INDEX[Math.floor(@score_num % 10)]
    SampleGame.game.rootScene.addChild @num_sprite[4]
    
  score_update: ->
    for i in [0...5]
      if @score_num == 0
        @num_sprite[i].frame = Score.NUM_INDEX[0]
      else
        index = null
        if i == 0 
          index = @score_num / 10000
        if i == 1 
          index = @score_num % 10000 / 1000
        if i == 2 
          index = @score_num % 1000 / 100
        if i == 3 
          index = @score_num % 100 / 10
        if i == 4 
          index = @score_num % 10
        @num_sprite[i].frame = Score.NUM_INDEX[Math.floor(index)]
