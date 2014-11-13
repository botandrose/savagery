Savagery = {
  svgSpriteInclude: function(name) {
    if(this._svgSpritesIncluded[name]) { return; }
    this._svgSpritesIncluded[name] = true

    $.get("/assets/" + name + ".svg", function(data) {
      $("body").prepend(data);
    }, "text");
  },

  svgSpriteUse: function(basename, cssClass) {
    cssClass = cssClass || basename;
    return '<svg class="' + cssClass + '"><use xlink:href="#' + basename + '"></use></svg>';
  },

  _svgSpritesIncluded: {}
};

Ember.Handlebars.helper("svg-sprite-use", function(name, options) {
  var names = name.split("/");
  var dirname = names[0];
  var basename = names[1];
  Savagery.svgSpriteInclude(dirname);

  var cssClass = options.hash["class"];
  var html = Savagery.svgSpriteUse(basename, cssClass);
  return new Ember.Handlebars.SafeString(html);
});

