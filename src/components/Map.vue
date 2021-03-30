<template>
  <div style="height: 500px; width: 100%">
    <l-map :zoom="zoom" :center="center">
      <l-tile-layer :url="url" :attribution="attribution"></l-tile-layer>
      <!-- <l-marker :lat-lng="marker"></l-marker> -->
    </l-map>
  </div>
</template>

<script>
import { latLng } from "leaflet";
import { LMap, LTileLayer } from "vue2-leaflet";

export default {
  name: "Map",
  props: {},
  components: {
    LMap,
    LTileLayer
  },
  data() {
    return {
      zoom: 13,
      center: latLng(47.41322, -1.219482),
        url:'http://{s}.tile.osm.org/{z}/{x}/{y}.png',
        attribution:'&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
      //   marker: latLng(47.41322, -1.219482),
    };
  },
  methods: {
    initMap() {
      //   L.map("map").setView([37, 7749, -122, 4194], 13);
      //   L.map("map", {
      //     center: [51.505, -0.09],
      //     zoom: 13,
      //   });
    },
  },
  mounted() {
    // this.initMap();
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
/* #map {
  height: 500px;
  width: 500px;
} */
</style>
