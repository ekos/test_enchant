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
      this.preload("purimurabana1.gif");
      this.onload = function() {
        return this.rootScene.addChild(new Player(100, 100));
      };
      this.start();
    }

    return SampleGame;

  })(Game);

  Player = (function(_super) {

    __extends(Player, _super);

    function Player(x, y) {
      var game;
      Player.__super__.constructor.call(this, 44, 32);
      this.x = x;
      this.y = y;
      game = SampleGame.game;
      this.image = game.assets['purimurabana1.gif'];
      this.addEventListener('enterframe', function() {
        if (game.input.up) {
          this.y -= 5;
        } else if (game.input.down) {
          this.y += 5;
        }
        if (game.input.left) {
          return this.x -= 5;
        } else if (game.input.right) {
          return this.x += 5;
        }
      });
    }

    return Player;

  })(Sprite);

  window.onload = function() {
    return new SampleGame();
  };

}).call(this);
