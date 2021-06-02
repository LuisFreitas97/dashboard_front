<template>
  <div style="height: 100%; width: 100%">
    <l-map :zoom="zoom" :center="center">
      <l-tile-layer :url="url" :attribution="attribution"></l-tile-layer>
      <l-marker :lat-lng="marker">
        <l-icon
          :icon-size="icon.size"
          :icon-anchor="icon.anchor"
          :icon-url="icon.url"
        />
      </l-marker>
      <l-circle :lat-lng="circle.center" :radius="circle.radius">
        <l-popup>
          <div>
            ID 1234566789
            <br />
            Temperature 23º
            <br />
            Risk 43
          </div>
        </l-popup>
      </l-circle>
      <l-rectangle :bounds="rectangle.bounds" :l-style="rectangle.style" />
      <l-polygon :lat-lngs="polygon.latlngs" :color="polygon.color" />
      <l-polyline :lat-lngs="polyline.latlngs" :color="polyline.color" />

      <l-polygon
        v-for="subsection in subSections"
        :key="subsection.properties.BGRI11"
        :lat-lngs="subsection.geometry.coordinates[0]"
        color="#a2a2a2"
        weight="1"
        :fillColor="getIndexColor(subsection)"
      >
        <l-popup>
          <div>
            ID {{ subsection.properties.BGRI11 }}
            <br />
            {{ subsection.weatherData.atts.description }} :
            {{ subsection.weatherData.data }}
            {{ subsection.weatherData.atts.units }}
            <br />
            Risk 43
          </div>
        </l-popup>
      </l-polygon>
    </l-map>
  </div>
</template>

<script>
import { latLng } from "leaflet";
import {
  LMap,
  LMarker,
  LTileLayer,
  LCircle,
  LRectangle,
  LPolygon,
  LPolyline,
  LIcon,
  LPopup,
} from "vue2-leaflet";
import axios from "axios";

export default {
  name: "Map",
  props: {},
  components: {
    LMap,
    LMarker,
    LTileLayer,
    LCircle,
    LRectangle,
    LPolygon,
    LPolyline,
    LIcon,
    LPopup,
  },
  data() {
    return {
      // zoom: 13,
      // center: latLng(41.8239, -7.79006),
      subSections: [],
      icon: {
        size: [32, 37],
        anchor: [16, 37],
        url: "/images/icon/marker.png",
      },
      zoom: 11,
      // center: [47.31322, -1.319482],
      center: [41.8318, -7.78999],
      circle: {
        center: latLng(47.41322, -1.0482),
        radius: 4500,
      },
      rectangle: {
        bounds: [
          [47.341456, -1.397133],
          [47.303901, -1.243813],
        ],
        style: { color: "red", weight: 5 },
      },
      polygon: {
        latlngs: [
          [47.2263299, -1.6222],
          [47.21024000000001, -1.6270065],
          [47.1969447, -1.6136169],
          [47.18527929999999, -1.6143036],
          [47.1794457, -1.6098404],
          [47.1775788, -1.5985107],
          [47.1676598, -1.5753365],
          [47.1593731, -1.5521622],
          [47.1593731, -1.5319061],
          [47.1722111, -1.5143967],
          [47.1960115, -1.4841843],
          [47.2095404, -1.4848709],
          [47.2291277, -1.4683914],
          [47.2533687, -1.5116501],
          [47.2577961, -1.5531921],
          [47.26828069, -1.5621185],
          [47.2657179, -1.589241],
          [47.2589612, -1.6204834],
          [47.237287, -1.6266632],
          [47.2263299, -1.6222],
        ],
        color: "#ff00ff",
      },
      polyline: {
        latlngs: [
          [47.334852, -1.509485],
          [47.342596, -1.328731],
          [47.241487, -1.190568],
          [47.234787, -1.358337],
        ],
        color: "green",
      },
      url: "http://{s}.tile.osm.org/{z}/{x}/{y}.png",
      attribution:
        '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
      marker: latLng(47.41322, -1.219482),
    };
  },
  created() {
    axios
      .get(process.env.VUE_APP_DB_MICROSERVICE + "/drawAreas", {})
      .then((response) => {
        this.subSections = response.data.data;
      })
      .catch((e) => {
        console.log(e);
      })
      .finally();
  },
  methods: {
    getIndexColor(subsection) {
      var temp = subsection.weatherData.data;
      if (temp > 25) {
        return "#ffcbdb";
      } else if (temp >= 22 && temp < 25) {
        return "#ffa500";
      } else if (temp >= 20 && temp < 22) {
        return "#ffd153";
      } else if (temp >= 18 && temp < 20) {
        return "#c4d348";
      } else if (temp < 18) {
        return "#55cb50";
      } else {
        return "#3388ff";
      }
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
