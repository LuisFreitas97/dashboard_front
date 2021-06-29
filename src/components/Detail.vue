<template>
  <div class="container">
    <v-overlay :value="!!loading" :absolute="true" class="overlay">
      <v-progress-circular
        indeterminate
        :size="64"
        color="blue"
      ></v-progress-circular>
    </v-overlay>
    <v-card class="mx-auto mb-4">
      <v-tabs v-model="tab">
        <v-tab> Nível de Risco </v-tab>
        <v-tab @change="getHumidityData"> Humidade relativa (2 metros) </v-tab>
        <v-tab @change="getWindSpeed"> Velocidade do vento (10 metros) </v-tab>
      </v-tabs>
      <v-tabs-items v-model="tab">
        <v-tab-item>
          <apexchart
            width="100%"
            type="heatmap"
            :options="riskChartOptions"
            :series="riskSeries"
          ></apexchart>
        </v-tab-item>
        <v-tab-item>
          <apexchart
            width="100%"
            type="heatmap"
            :options="humidityChartOptions"
            :series="humidityData"
          ></apexchart>
        </v-tab-item>
        <v-tab-item>
          <apexchart
            width="100%"
            type="heatmap"
            :options="windSpeedChartOptions"
            :series="windSpeedData"
          ></apexchart>
        </v-tab-item>
      </v-tabs-items>
    </v-card>
    <v-card class="mx-auto">
      <v-card-text>
        <p class="display-1 text--primary">Informações</p>
        <ul>
          <li>
            Consumir sempre bastante água de forma a manter o corpo sempre
            hidratado.
          </li>
          <li>Utilizar roupas claras.</li>
          <li>
            Não se expor ao sol nas horas de maior calor, ou seja, entre as 11h
            e 16h.
          </li>
        </ul>

        <p class="display-1 text--primary">Números úteis</p>
        <ul>
          <li>
            Entidade oficial: +351 123456
          </li>
        </ul>
      </v-card-text>
    </v-card>
  </div>
</template>

<script>
import VueApexCharts from "vue-apexcharts";
import axios from "axios";

export default {
  name: "Detail",
  props: {},
  components: { apexchart: VueApexCharts },
  data() {
    return {
      humidityData: [],
      windSpeedData: [],
      loading: 0,
      tab: null,
      riskSeries: [
        {
          name: "17063200114",
          data: [20],
        },
        {
          name: "17063200115",
          data: [30],
        },
        {
          name: "17063200116",
          data: [40],
        },
        {
          name: "17063200117",
          data: [50],
        },
        {
          name: "17063200118",
          data: [15],
        },
        {
          name: "17063200119",
          data: [25],
        },
        {
          name: "17063200120",
          data: [5],
        },
        {
          name: "17063200121",
          data: [2],
        },
        {
          name: "17063200122",
          data: [3],
        },
      ],
      riskChartOptions: {
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
          categories: ["Nível de risco"],
        },
        stroke: {
          width: 1,
        },
        title: {
          text: "Nível de risco por área",
        },
      },
      humidityChartOptions: {
        chart: {
          height: 350,
          type: "heatmap",
        },
        noData: {
          text: "Sem Dados",
          align: "center",
          verticalAlign: "middle",
          offsetX: 0,
          offsetY: 0,
        },
        plotOptions: {
          heatmap: {
            shadeIntensity: 0.5,
            radius: 0,
            useFillColorAsStroke: true,
            colorScale: {
              ranges: [
                {
                  from: 0,
                  to: 25,
                  name: "Baixo",
                  color: "#00A100",
                },
                {
                  from: 26,
                  to: 50,
                  name: "Médio",
                  color: "#128FD9",
                },
                {
                  from: 51,
                  to: 75,
                  name: "Alto",
                  color: "#FFB200",
                },
                {
                  from: 76,
                  to: 100,
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
          categories: ["Humidade relativa (2 metros)"],
        },
        stroke: {
          width: 1,
        },
        title: {
          text: "Humidade relativa (%)",
        },
      },
      windSpeedChartOptions: {
        chart: {
          height: 350,
          type: "heatmap",
        },
        noData: {
          text: "Sem Dados",
          align: "center",
          verticalAlign: "middle",
          offsetX: 0,
          offsetY: 0,
        },
        plotOptions: {
          heatmap: {
            shadeIntensity: 0.5,
            radius: 0,
            useFillColorAsStroke: true,
            colorScale: {
              ranges: [
                {
                  from: 0,
                  to: 25,
                  name: "Baixo",
                  color: "#00A100",
                },
                {
                  from: 26,
                  to: 50,
                  name: "Médio",
                  color: "#128FD9",
                },
                {
                  from: 51,
                  to: 75,
                  name: "Alto",
                  color: "#FFB200",
                },
                {
                  from: 76,
                  to: 100,
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
          categories: ["Velocidade do vento (10 metros)"],
        },
        stroke: {
          width: 1,
        },
        title: {
          text: "Velocidade do vento (m/s)",
        },
      },
    };
  },
  created() {},
  methods: {
    getHumidityData() {
      this.loading++;
      axios
        .get(process.env.VUE_APP_DB_MICROSERVICE + "/weatherDataByType", {
          params: {
            vars: "rh2",
          },
        })
        .then((response) => {
          var data = response.data.data;
          if (data && data.length) {
            this.humidityData = data.slice(0, 10).map(function (obj) {
              return { name: obj.BGRI11, data: [obj.data] };
            });
          }
        })
        .catch((e) => {
          console.log(e);
        })
        .finally(() => this.loading--);
    },
    getWindSpeed() {
      this.loading++;
      axios
        .get(process.env.VUE_APP_DB_MICROSERVICE + "/weatherDataByType", {
          params: {
            vars: "ws10",
          },
        })
        .then((response) => {
          var data = response.data.data;
          if (data && data.length) {
            this.windSpeedData = data.slice(0, 10).map(function (obj) {
              return { name: obj.BGRI11, data: [obj.data] };
            });
          }
        })
        .catch((e) => {
          console.log(e);
        })
        .finally(() => this.loading--);
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
