//= require ember-rails-assets

Savagery = {
  svgSpriteInclude: function(name) {
    if(this._svgSpritesIncluded[name]) { return; }
    this._svgSpritesIncluded[name] = true

    path = window.ASSETS.path(name + ".svg")
    $.get(path, function(data) {
      $("body").prepend(data);
    }, "text");
  },

  svgSpriteUse: function(basename, cssClass) {
    cssClass = cssClass || basename;
    var absolutePath = window.location.href
    absolutePath = absolutePath.replace(window.location.hash, '');
    absolutePath = absolutePath + "#" + basename;
    return '<svg class="' + cssClass + '"><use xlink:href="' + absolutePath + '"></use></svg>';
  },

  _svgSpritesIncluded: {},
};

Ember.Application.initializer({
  name: "savagery-helpers",

  initialize: function(application) {
    application.register("helper:svg-sprite-use", Ember.Helper.helper(this.svgSpriteUseHelper));
  },

  svgSpriteUseHelper: function(params, hash) {
    var name = params[0];
    var names = name.split("/");
    var dirname = names[0];
    var basename = names[1];
    Savagery.svgSpriteInclude(dirname);

    var cssClass = hash["class"];
    var html = Savagery.svgSpriteUse(basename, cssClass);
    return new Ember.Handlebars.SafeString(html);
  }
});

Ember.Application.initializer({
  name: "ember-rails-assets-helpers",

  initialize: function(application) {
    application.register("helper:asset-path", Ember.Helper.helper(function(params, hash) {
      var name = params[0];
      var path = window.ASSETS.path(name);
      return new Ember.Handlebars.SafeString(path);
    }));
  }
});

