<template>
  <div class="mapSize">
    <v-overlay :value="!!loading" :absolute="true" class="overlay">
      <v-progress-circular
        indeterminate
        :size="64"
        color="blue"
      ></v-progress-circular>
    </v-overlay>
    <div class="divMapInternal">
      <color-range></color-range>
      <l-map :zoom="zoom" :center="center" class="map">
        <l-tile-layer :url="url" :attribution="attribution"></l-tile-layer>
        <v-geosearch :options="geosearchOptions"></v-geosearch>
        <l-polygon
          v-for="subsection in subSections"
          :key="subsection.properties ? subsection.properties.BGRI11 : null"
          :lat-lngs="
            subsection.geometry &&
            subsection.geometry.coordinates &&
            subsection.geometry.coordinates.length
              ? subsection.geometry.coordinates[0]
              : []
          "
          color="#a2a2a2"
          :weight="1"
          :fillColor="getIndexColor(subsection)"
        >
          <l-popup>
            <div>
              <div v-if="subsection.properties">
                ID {{ subsection.properties.BGRI11 }}
              </div>
              <div v-if="subsection.weatherData">
                {{ subsection.weatherData.atts.description }} :
                {{ subsection.weatherData.data }}
                {{ subsection.weatherData.atts.units }}
              </div>
              <div>Risk 43</div>
            </div>
          </l-popup>
        </l-polygon>
      </l-map>
    </div>
  </div>
</template>

<script>
import { LMap, LTileLayer, LPolygon, LPopup } from "vue2-leaflet";
import axios from "axios";
import ColorRange from "./ColorRange.vue";
import { OpenStreetMapProvider } from "leaflet-geosearch";
import VGeosearch from "vue2-leaflet-geosearch";

import L from "leaflet";

export default {
  name: "Map",
  props: {},
  components: {
    LMap,
    LTileLayer,
    LPolygon,
    LPopup,
    ColorRange,
    VGeosearch,
  },
  data() {
    return {
      geosearchOptions: {
        // Important part Here
        provider: new OpenStreetMapProvider(),
      },
      subSections: [],
      loading: 0,
      zoom: 11,
      center: [41.8318, -7.78999],
      url: "http://{s}.tile.osm.org/{z}/{x}/{y}.png",
      attribution:
        '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
    };
  },
  created() {
    this.fixMarker();
    this.loading++;
    axios
      .get(process.env.VUE_APP_DB_MICROSERVICE + "/drawAreas", {})
      .then((response) => {
        this.subSections = response.data.data;
      })
      .catch((e) => {
        console.log(e);
      })
      .finally(() => {
        this.loading--;
      });
  },
  methods: {
    getIndexColor(subsection) {
      var weather = subsection.weatherData;
      if (!weather) return "#3388ff";

      var temp = weather.data;
      if (temp > 25) {
        return "#ffcbdb";
      } else if (temp >= 20 && temp < 25) {
        return "#ffa500";
      } else if (temp >= 15 && temp < 20) {
        return "#ffd153";
      } else if (temp >= 10 && temp < 15) {
        return "#c4d348";
      } else if (temp < 10) {
        return "#55cb50";
      } else {
        return "#3388ff";
      }
    },
    fixMarker() {
      delete L.Icon.Default.prototype._getIconUrl;

      L.Icon.Default.mergeOptions({
        iconRetinaUrl: require("leaflet/dist/images/marker-icon-2x.png"),
        iconUrl: require("leaflet/dist/images/marker-icon.png"),
        shadowUrl: require("leaflet/dist/images/marker-shadow.png"),
      });
    },
  },
};
</script>
<style scoped>
.overlay {
  z-index: 600 !important;
}
.mapSize {
  height: 100% !important;
  width: 100% !important;
}
.map {
  z-index: 0 !important;
  position: absolute !important;
}
.divMapInternal {
  position: relative !important;
  height: 100% !important;
  width: 100% !important;
}
</style>