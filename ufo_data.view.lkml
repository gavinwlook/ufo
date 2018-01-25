view: ufo_data {
  sql_table_name: public.ufo_data ;;

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: date_posted {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date_posted ;;
  }

  dimension: duration {
    type: number
    sql: ${TABLE}.duration ;;
  }

  dimension: duration_desc {
    type: string
    sql: ${TABLE}.duration_desc ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: shape {
    type: string
    sql: ${TABLE}.shape ;;
  }

  dimension_group: sighting {
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
      hour,
      hour2,
      day_of_week,
      date,
      week,
      week_of_year,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}.sighting_date ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: location {
  type: location
  sql_latitude:${latitude} ;;
  sql_longitude:${longitude} ;;
}

  measure: count {
    type: count
    drill_fields: []
  }
  measure: average_duration {
    type:  average
    sql: ${duration} ;;
    value_format: "0.##"
  }

  measure: average_latitude {
    type:  average
    sql: ${latitude} ;;
    value_format: "0.##"
  }
}
