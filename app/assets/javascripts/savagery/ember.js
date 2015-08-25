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
    return '<svg class="' + cssClass + '"><use xlink:href="#' + basename + '"></use></svg>';
  },

  _svgSpritesIncluded: {},

  emberHelper: function(name, options) {
    var names = name.split("/");
    var dirname = names[0];
    var basename = names[1];
    Savagery.svgSpriteInclude(dirname);

    var cssClass = options.hash["class"];
    var html = Savagery.svgSpriteUse(basename, cssClass);
    return new Ember.Handlebars.SafeString(html);
  }
};

Ember.Application.initializer({
  name: "savagery-helpers",

  initialize: function(container, application) {
    application.register("helper:svg-sprite-use", Savagery.emberHelper);
  }
});

