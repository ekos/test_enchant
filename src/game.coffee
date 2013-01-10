enchant();
class SampleGame extends Game
  SampleGame.WIDTH_SIZE = 320
  SampleGame.HEIGHT_SIZE = 320
  SampleGame.DOWN = 0
  SampleGame.LEFT = 1
  SampleGame.RIGHT = 2
  SampleGame.UP = 3

  constructor : ->
    super SampleGame.WIDTH_SIZE, SampleGame.HEIGHT_SIZE
    @fps = 30
    SampleGame.game = @
    
    @preload "puzzle.png"
    @preload "chara.png"
    @preload "enemy.png"
    @preload "enemy2.png"
#    @preload "shot4.wav"
    @onload = ->
      SampleGame.player = new Player(100, 100)
      @rootScene.addChild SampleGame.player
      
      SampleGame.backSprite = new Sprite(SampleGame.WIDTH_SIZE, 100)
      SampleGame.back = new Surface(SampleGame.WIDTH_SIZE, 100)
      SampleGame.back.context.fillStyle = "#CCCCCC"
      SampleGame.back.context.fillRect 0, 0, SampleGame.WIDTH_SIZE, 100
      SampleGame.backSprite.image = SampleGame.back;
      SampleGame.backSprite.moveTo(0, SampleGame.HEIGHT_SIZE - 100)
      @rootScene.addChild SampleGame.backSprite
      
      
      SampleGame.pad = new Pad()
      SampleGame.pad.moveTo(0, 220);
      @rootScene.addChild SampleGame.pad
      
      SampleGame.button = new Shot(220, 220)
      @rootScene.addChild SampleGame.button
      
      SampleGame.enemy = new EnemyManage()
      @rootScene.addChild SampleGame.enemy
      
      SampleGame.score = new Score(120, 230)
      @rootScene.addChild SampleGame.score

      
      @addEventListener 'enterframe', ->
        @rootScene.removeChild SampleGame.backSprite
        @rootScene.removeChild SampleGame.pad
        @rootScene.removeChild SampleGame.button

        @rootScene.insertBefore SampleGame.backSprite
        @rootScene.insertBefore SampleGame.pad
        @rootScene.insertBefore SampleGame.button

    @start()

window.onload = ->
  new SampleGame()
