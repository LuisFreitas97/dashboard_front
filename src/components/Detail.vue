<template>
  <div class="container">
    <v-card class="mx-auto mb-4">
      <v-tabs v-model="tab">
        <v-tab> Nível de Risco </v-tab>
        <v-tab> Temperatura máxima (interna) </v-tab>
        <v-tab> Temperatura máxima (exterior) </v-tab>
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
            :options="outTempChartOptions"
            :series="outTempSeries"
          ></apexchart>
        </v-tab-item>
        <v-tab-item>
          <apexchart
            width="100%"
            type="heatmap"
            :options="inTempChartOptions"
            :series="inTempSeries"
          ></apexchart>
        </v-tab-item>
      </v-tabs-items>
    </v-card>
    <v-card class="mx-auto">
      <v-card-text>
        <div>Informações</div>
        <p class="display-1 text--primary">Dicas</p>
        <div class="text--primary">
          Consumir sempre bastante água de forma a manter o corpo sempre hidratado.
          <br />
          Utilizar roupas claras.
          <br />
          Não se expor ao sol nas horas de maior calor, ou seja, entre as 11h e 16h.
        </div>

        <p class="display-1 text--primary">Números úteis</p>
        <div class="text--primary">
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
          categories: [
            "Nível de risco"
          ],
        },
        stroke: {
          width: 1,
        },
        title: {
          text: "Nível de risco por área",
        },
      },

      // Max out temp
      outTempSeries: [
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
      outTempChartOptions: {
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
            "Temperatura máxima exterior"
          ],
        },
        stroke: {
          width: 1,
        },
        title: {
          text: "Temperatura máxima exterior por área",
        },
      },

      //Max in temperature
      inTempSeries: [
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
      inTempChartOptions: {
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
            "Temperatura máxima interior"
          ],
        },
        stroke: {
          width: 1,
        },
        title: {
          text: "Temperatura máxima interior por área",
        },
      },
    };
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
