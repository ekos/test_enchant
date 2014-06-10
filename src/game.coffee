enchant();
class SampleGame extends Game
  SampleGame.WIDTH_SIZE = 320
  SampleGame.HEIGHT_SIZE = 320
  SampleGame.DOWN = 0
  SampleGame.LEFT = 1
  SampleGame.RIGHT = 2
  SampleGame.UP = 3
  SampleGame.GAMEOVER_WAIT = 50
  constructor : ->
    super SampleGame.WIDTH_SIZE, SampleGame.HEIGHT_SIZE
    @fps = 30
    SampleGame.game = @
    
    @preload "puzzle.png"
    @preload "chara.png"
    @preload "enemy.png"
    @preload "enemy2.png"
    @preload "start.png"
    @preload "end.png"
#    @preload "shot4.wav"
    @onload = ->
      SampleGame.game.pushScene(SampleGame.game.makeSceneStart());
            
    SampleGame.game.makeSceneStart = () ->
      scene = new Scene();
      
      start = new Sprite(236, 48)
      start.moveTo(SampleGame.WIDTH_SIZE / 2 - 236 / 2, SampleGame.HEIGHT_SIZE / 2 - 48 / 2)
      start.image = SampleGame.game.assets['start.png']
      scene.addChild start
      
      bg = new Sprite(SampleGame.WIDTH_SIZE, SampleGame.HEIGHT_SIZE)
      bg.addEventListener 'touchstart', ->
        scene.removeChild start
        scene.removeChild bg
        SampleGame.game.pushScene(SampleGame.game.makeSceneGame());
      scene.addChild bg
      
      return scene
      
    SampleGame.game.makeSceneGame = () ->
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
        for i in [0...Score.STR_INDEX.length]
          @rootScene.removeChild SampleGame.score.str_sprite[i]
        for i in [0...5]
          @rootScene.removeChild SampleGame.score.num_sprite[i]

        @rootScene.insertBefore SampleGame.backSprite
        @rootScene.insertBefore SampleGame.pad
        @rootScene.insertBefore SampleGame.button
        for i in [0...Score.STR_INDEX.length]
          @rootScene.insertBefore SampleGame.score.str_sprite[i]
        for i in [0...5]
          @rootScene.insertBefore SampleGame.score.num_sprite[i]
        
        SampleGame.hit_enemy_id = SampleGame.player.is_enemy_hit()
        if SampleGame.hit_enemy_id != -1
          SampleGame.game.pushScene(SampleGame.game.makeSceneResult());
        SampleGame.score.score_update()
        
      return @rootScene
    SampleGame.game.makeSceneResult = () ->
      SampleGame.enemy.clearEventListener 'enterframe'
      SampleGame.player.clearEventListener 'enterframe'
      SampleGame.button.clearEventListener 'enterframe'
      for i in [0...EnemyManage.ENEMY_MAX]
        SampleGame.enemy.enemy_obj[i].clearEventListener 'enterframe'
        
      SampleGame.enemy.enemy_obj[SampleGame.hit_enemy_id].flash()
      SampleGame.player.flash()
      
      SampleGame.game_over_wait = SampleGame.GAMEOVER_WAIT
      SampleGame.game_over_view = false
      end = new Sprite(189, 97)
      end.moveTo(SampleGame.WIDTH_SIZE / 2 - 189 / 2, SampleGame.HEIGHT_SIZE / 2 - 97 / 2)
      end.image = SampleGame.game.assets['end.png']
      end.visible = false
      @rootScene.addChild end

      @addEventListener 'enterframe', ->
        if !SampleGame.game_over_view
          SampleGame.game_over_wait--
        if SampleGame.game_over_wait < 0 && !SampleGame.game_over_view
          end.visible = true
          SampleGame.game_over_view = true
      
      return @rootScene
    @start()

window.onload = ->
  new SampleGame()
