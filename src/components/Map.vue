<template>
  <div style="height: 100%; width: 100%">
    <v-overlay :value="!!loading" :absolute="true">
      <v-progress-circular
        indeterminate
        :size="64"
        color="blue"
      ></v-progress-circular>
    </v-overlay>
    <l-map :zoom="zoom" :center="center">
      <l-tile-layer :url="url" :attribution="attribution"></l-tile-layer>
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
</template>

<script>
import { LMap, LTileLayer, LPolygon, LPopup } from "vue2-leaflet";
import axios from "axios";

export default {
  name: "Map",
  props: {},
  components: {
    LMap,
    LTileLayer,
    LPolygon,
    LPopup,
  },
  data() {
    return {
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
    this.loading++;
    axios
      .get(process.env.VUE_APP_DB_MICROSERVICE + "/drawAreas", {})
      .then((response) => {
        this.subSections = response.data.data;
      })
      .catch((e) => {
        console.log(e);
      })
      .finally(() => {this.loading--});
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
  },
};
</script>