view: location_view {

  derived_table: {
    sql:
      SELECT
        shape,
        AVG(latitude) AS avg_latitude,
        AVG(longitude) AS avg_longitude
      FROM
        public.ufo_data
      GROUP BY
        shape ;;

    persist_for: "24 hours"
    indexes: ["shape"]
  }

#  dimension: avg_location {
#    type:  location
#    sql_latitude: ${TABLE}.avg_latitude ;;
#    sql_longitude: ${TABLE}.avg_longitude ;;
#  }

  dimension: shape {
      type: string
      primary_key: yes
      sql: ${TABLE}.shape ;;
      }

  dimension: average_latitude {
    type:  string
    sql: ${TABLE}.avg_latitude ;;
    value_format: "string"
  }
 dimension: average_longitude {
    type:  string
    sql: ${TABLE}.avg_longitude ;;
    value_format: "string"}

}
