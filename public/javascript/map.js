window.addEventListener("load", function () {
  
  require([
    "esri/config",
    "esri/Map",
    "esri/views/MapView",
    "esri/layers/FeatureLayer",
  ], (esriConfig, Map, MapView, FeatureLayer) => {
    const continentsLayer = new FeatureLayer({
      url: "https://services7.arcgis.com/oy2ryNBtKzDDH8X7/arcgis/rest/services/WorldContinents/FeatureServer/0",
      outFields: ["*"],
    });

    // Retrive ArcGIS API key
    esriConfig.apiKey =
      "AAPK12631ed09aac4abebe928994f2c02a47KTcD3CaSnCbrQL6A0G7r2RK0zL5-x1CGzLjc8Ko3Zptyj_bhIyTwvDhYTg9SNUv4";

    // Create the map
    const map = new Map({
      basemap: "arcgis-topographic",
      layers: [continentsLayer],
    });

    // Create the map view
    const view = new MapView({
      container: "viewDiv",
      map: map,
      center: [30.389533, 28.538999],
      zoom: 2,
      highlightOptions: {
        color: [42, 107, 212, 0.6],
      },
    });

    // Add ui components to the view
    view.ui.add("info", "top-right");

    view
      .when()
      .then(() => {
        return continentsLayer.when();
      })
      .then((layer) => {
        const renderer = layer.renderer.clone();
        renderer.symbol.color = [128, 128, 128, 0.1];
        renderer.symbol.outline = { color: [145, 145, 145, 0.5] };
        layer.renderer = renderer;

        // Set up an event handler for pointer-down (mobile)
        // pointer-move events (mouse) and click events (mouse)
        // and retrieve the screen x, y coordinates

        return view.whenLayerView(layer);
      })
      .then((layerView) => {
        view.on("pointer-move", eventHandler);
        //view.on("pointer-down", eventHandler); // if we wanted it to work on mobile as well
        view.on("click", eventHandler);

        function eventHandler(event) {
          // only include graphics from continentsLayer in the hitTest
          const opts = { include: continentsLayer };

          // the hitTest() checks to see if any graphics from the continentsLayer
          // intersect the x, y coordinates of the pointer

          if (event.type == "pointer-move") {
            view.hitTest(event, opts).then(getGraphics);
          } else if (event.type == "click") {
            view.hitTest(event, opts).then(linkRegion);
          }
        }

        let highlight, currentContinent;

        function getGraphics(response) {
          // the topmost graphic from the continentsLayer
          // and display select attribute values from the
          // graphic to the user
          if (response.results.length) {
            const graphic = response.results[0].graphic;

            const attributes = graphic.attributes;
            const continentName = attributes.CONTINENT;

            document.getElementById("info").style.visibility = "visible";
            document.getElementById("regionSelect").innerHTML = continentName;

            // returned all features from the hitTest
            const query = layerView.createQuery();
            query.where = "CONTINENT = '" + continentName + "'";
            layerView.queryObjectIds(query).then((ids) => {
              if (highlight) {
                highlight.remove();
              }
              highlight = layerView.highlight(ids);
              currentContinent = continentName;
            });
          } else {
            // remove the highlight if no features are
            // returned from the hitTest
            if (highlight) {
              highlight.remove();
              highlight = null;
            }
            document.getElementById("info").style.visibility = "hidden";
          }
        }

        function linkRegion(response) {
          if (response.results.length) {
            const feature = response.results[0].graphic;

            const attributes = feature.attributes;
            const continentLink = attributes.CONTINENT_LINK;

            // Link to corresponding page
            window.location.href = `region/${continentLink}`;
          }
        }
      });
  });
});
