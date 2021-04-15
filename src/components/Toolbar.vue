<template>
  <v-card color="grey lighten-4" flat height="7%" tile>
    <v-toolbar dark>
      <!-- <v-app-bar-nav-icon></v-app-bar-nav-icon> -->

      <v-toolbar-title>RELIABLE</v-toolbar-title>

      <v-spacer></v-spacer>

      <v-btn depressed> About </v-btn>

      <v-btn depressed> Contacts </v-btn>

      <v-btn depressed> Login </v-btn>
    </v-toolbar>
  </v-card>
</template>

<script>
export default {
  name: "Toolbar",
  props: {},
  components: {},
  data() {
    return {};
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
