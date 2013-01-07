// Generated by CoffeeScript 1.3.3
(function() {
  var Player, SampleGame,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  enchant();

  SampleGame = (function(_super) {

    __extends(SampleGame, _super);

    function SampleGame() {
      SampleGame.__super__.constructor.call(this, 320, 320);
      this.fps = 30;
      SampleGame.game = this;
      this.preload("puzzle.png");
      this.preload("chara.png");
      this.onload = function() {
        var map;
        map = new Map(6, 5);
        map.image = SampleGame.game.assets['puzzle.png'];
        map.tileHeight = 18;
        map.tileWidth = 18;
        map.loadData([[0, 1, 2, 3, 4, 5], [0, 1, 2, 3, 4, 5], [0, 1, 2, 3, 4, 5], [0, 1, 2, 3, 4, 5], [0, 1, 2, 3, 4, 5]]);
        SampleGame.player = new Player(100, 100);
        return this.rootScene.addChild(SampleGame.player);
      };
      this.start();
    }

    return SampleGame;

  })(Game);

  Player = (function(_super) {

    __extends(Player, _super);

    function Player(x, y) {
      var game, player;
      Player.__super__.constructor.call(this, 32, 32);
      this.x = x;
      this.y = y;
      game = SampleGame.game;
      player = SampleGame.player;
      this.image = game.assets['chara.png'];
      this.addEventListener('touchstart', function() {
        return this.x += 1;
      });
    }

    return Player;

  })(Sprite);

  window.onload = function() {
    return new SampleGame();
  };

}).call(this);
