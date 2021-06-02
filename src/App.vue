<template>
  <v-app>
    <!-- <Toolbar></Toolbar> -->
    <v-container fluid fill-height>
      <v-layout wrap row>
        <v-flex xs12 sm12 md12 class="pa-1">
          <Toolbar></Toolbar>
        </v-flex>
        <v-flex xs12 sm10 md10 class="pa-1">
          <Map></Map>
        </v-flex>

        <v-flex xs12 sm2 md2 class="pa-1">
          <Detail></Detail>
        </v-flex>
      </v-layout>
    </v-container>

    <v-main>
      <router-view />
    </v-main>
  </v-app>
</template>

<script>
import Map from "./components/Map.vue";
import Toolbar from "./components/Toolbar";
import Detail from "./components/Detail";

export default {
  name: "App",
  components: {
    Map,
    Toolbar,
    Detail,
  },

  data: () => ({
    //
  }),
};
</script>
