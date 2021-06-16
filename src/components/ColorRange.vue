<template>
  <v-card
    class="mx-auto"
    outlined
    style="
      z-index: 500;
      position: absolute;
      margin-left: 87% !important;
      margin-rigth: 5% !important;
      margin-top: 3% !important;
    "
  >
    <v-list-item>
      <v-list-item-avatar tile size="25" color="#ffcbdb"></v-list-item-avatar>
      <v-list-item-content> &#62;25 </v-list-item-content>
    </v-list-item>
    <v-list-item>
      <v-list-item-avatar tile size="25" color="#ffa500"></v-list-item-avatar>
      <v-list-item-content> 20-25 </v-list-item-content>
    </v-list-item>
    <v-list-item>
      <v-list-item-avatar tile size="25" color="#ffd153"></v-list-item-avatar>
      <v-list-item-content> 15-20 </v-list-item-content>
    </v-list-item>
    <v-list-item>
      <v-list-item-avatar tile size="25" color="#c4d348"></v-list-item-avatar>
      <v-list-item-content> 10-15 </v-list-item-content>
    </v-list-item>
    <v-list-item>
      <v-list-item-avatar tile size="25" color="#55cb50"></v-list-item-avatar>
      <v-list-item-content> &#60;10 </v-list-item-content>
    </v-list-item>
  </v-card>
</template>

<script>
export default {
  name: "ColorRange",
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
