<template>
  <div class="container">
    <v-card class="mx-auto">
      <apexchart
        width="100%"
        type="heatmap"
        :options="chartOptions"
        :series="series"
      ></apexchart>
    </v-card>
    <v-card class="mx-auto">
      <v-card-text>
        <div>Informações</div>
        <p class="display-1 text--primary">Dicas</p>
        <div class="text--primary">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed tempor
          incididunt ut labore.
          <br />
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed tempor
          incididunt ut labore et dolore magna aliqua.
          <br />
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed tempor
          incididunt ut labore.
        </div>

        <p class="display-1 text--primary">Número úteis</p>
        <div class="text--primary">
          Entidade +351 123456
          <br />
          Entidade +351 123456
        </div>
      </v-card-text>
    </v-card>
  </div>
</template>

<script>
import VueApexCharts from "vue-apexcharts";

export default {
  name: "Detail",
  props: {},
  components: { apexchart: VueApexCharts },
  data() {
    return {
      series: [
        {
          name: "17063200114",
          data: [20, 30, 40],
        },
        {
          name: "17063200115",
          data: [30, 10, 5],
        },
        {
          name: "17063200116",
          data: [40, 4, 10],
        },
        {
          name: "17063200117",
          data: [50, 60, 70],
        },
        {
          name: "17063200118",
          data: [15, 50, 50],
        },
        {
          name: "17063200119",
          data: [25, 35, 12],
        },
        {
          name: "17063200120",
          data: [5, 14, 60],
        },
        {
          name: "17063200121",
          data: [2, 4, 40],
        },
        {
          name: "17063200122",
          data: [3, 5, 6],
        },
      ],
      chartOptions: {
        chart: {
          height: 350,
          type: "heatmap",
        },
        plotOptions: {
          heatmap: {
            shadeIntensity: 0.5,
            radius: 0,
            useFillColorAsStroke: true,
            colorScale: {
              ranges: [
                {
                  from: -30,
                  to: 5,
                  name: "Baixo",
                  color: "#00A100",
                },
                {
                  from: 6,
                  to: 20,
                  name: "Médio",
                  color: "#128FD9",
                },
                {
                  from: 21,
                  to: 45,
                  name: "Alto",
                  color: "#FFB200",
                },
                {
                  from: 46,
                  to: 55,
                  name: "Extremo",
                  color: "#FF0000",
                },
              ],
            },
          },
        },
        dataLabels: {
          enabled: true,
        },
        xaxis: {
          categories: [
            "Nível de risco",
            "Temp máx (interna)",
            "Temp máx (exterior)",
          ],
          position: "top",
        },
        stroke: {
          width: 1,
        },
        title: {
          text: "HeatMap Chart with Color Range",
        },
      },
    };
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
