<template>
  <v-app>
    <!-- <Toolbar></Toolbar> -->
    <!-- <v-container fluid fill-height>
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
    </v-container> -->

    <v-container fluid fill-height>
      <v-row>
        <v-col xs="12" sm="12" md="12" class="pa-1">
          <Toolbar></Toolbar>
        </v-col>
      </v-row>
      <v-row style="height: 90%">
        <v-col xs="12" sm="10" md="10" class="pa-1">
          <Map></Map>
        </v-col>
        <v-col xs="12" sm="2" md="2" class="pa-1">
          <Detail></Detail>
        </v-col>
      </v-row>
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
