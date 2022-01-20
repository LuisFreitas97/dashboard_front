<template>
  <v-card
    class="range-card"
    outlined
  >
    <div v-for="range in ranges" v-bind:key="range.color">
      <v-list-item>
        <v-list-item-avatar
          tile
          size="25"
          :color="range.color"
        ></v-list-item-avatar>
        <v-list-item-content> {{ range.text }} &#8451; </v-list-item-content>
      </v-list-item>
    </div>
  </v-card>
</template>

<script>
export default {
  name: "ColorRange",
  props: {},
  components: {},
  data() {
    return {
      ranges: [
        { color: "red", text: ">25" },
        { color: "#ffa500", text: "20-25" },
        { color: "#ffd153", text: "15-20" },
        { color: "#c4d348", text: "10-15" },
        { color: "#55cb50", text: "<10" },
      ],
    };
  },
};
</script>

<style scoped>
.range-card {
  z-index: 500;
  position: absolute;
  margin-left: 87% !important;
  margin-top: 3% !important;
}
</style>
