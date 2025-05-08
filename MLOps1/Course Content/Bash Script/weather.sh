#!/bin/bash  

# ---- OpenWeatherMap API Key ----------  
API_KEY="f09b07c9f7c34273564a480d0e348fdf"  

# ----- Detect location -------------  
LOCATION_JSON=$(curl -s https://ipinfo.io/json)  
LAT=$(echo "$LOCATION_JSON" | jq -r '.loc' | cut -d',' -f1)  
LON=$(echo "$LOCATION_JSON" | jq -r '.loc' | cut -d',' -f2)  
CITY=$(echo "$LOCATION_JSON" | jq -r '.city')  

# --- Output file -----  
OUTFILE="/home/vltisme/Desktop/Github/MLOps/MLOps1/Course Content/Bash Script/weather_forecast_$(date +'%Y-%m-%d').txt"  
mkdir -p "$(dirname "$OUTFILE")"  

# Fetch data  
curl -s "https://api.openweathermap.org/data/2.5/forecast?lat=$LAT&lon=$LON&appid=$API_KEY&units=metric" -o /tmp/weather.json  

# --- Format forecast ---  
{  
  echo "📅 Weather forecast for $CITY ($LAT, $LON) | Next 4 days"  
  echo "Updated: $(date)"  
  echo  
  echo "Legend: ☀️=Clear  🌤️=Partly Cloudy  ☁️=Cloudy  🌧️=Rain  ⛈️=Thunderstorm  ❄️=Snow  🌫️=Mist/Fog"  
  echo  

  for i in 1 2 3 4; do  
    DATE=$(date -d "+$i day" +'%Y-%m-%d')  
    echo "==== $DATE ===="  

    # reset slots  
    morning=""  
    afternoon=""  
    evening=""  

    # Read only the three key times into the current shell  
    while IFS=$'\t' read datetime temp cond desc humidity; do  

      hour=${datetime:11:2}    # grab chars 11–12 of "YYYY-MM-DD HH:MM:SS"  

      # map to label + bucket  
      case $hour in  
        06)  
          tod="Morning"  
          ;;  
        12)  
          tod="Afternoon"  
          ;;  
        18)  
          tod="Evening"  
          ;;  
        *)  
          continue   # skip everything else  
          ;;  
      esac  

      # pick an emoji  
      case $cond in  
        Clear)        icon="☀️" ;;  
        Clouds)  
          case $desc in  
            *partly*|*few*|*broken*) icon="🌤️" ;;  
            *)                     icon="☁️" ;;  
          esac  
          ;;  
        Rain)         icon="🌧️" ;;  
        Drizzle)      icon="🌦️" ;;  
        Thunderstorm) icon="⛈️" ;;  
        Snow)         icon="❄️" ;;  
        Mist|Fog|Haze)icon="🌫️" ;;  
        *)            icon="❓" ;;  
      esac  

      line="$icon  [$tod]  ${desc^}, ${temp}°C (Humidity: ${humidity}%)"  

      case $tod in  
        Morning)   morning="$line" ;;  
        Afternoon) afternoon="$line" ;;  
        Evening)   evening="$line" ;;  
      esac  

    done < <(  
      jq --arg d "$DATE" -r '  
        .list[]  
        | select(  
            ( .dt_txt | startswith($d + " 06:00:00") ) or  
            ( .dt_txt | startswith($d + " 12:00:00") ) or  
            ( .dt_txt | startswith($d + " 18:00:00") )  
          )  
        | [ .dt_txt,  
            ( .main.temp | round | tostring ),  
            .weather[0].main,  
            .weather[0].description,  
            ( .main.humidity | tostring )  
          ]  
        | @tsv  
      ' /tmp/weather.json  
    )  

    # finally, print in order  
    [ -n "$morning"   ] && echo "$morning"  
    [ -n "$afternoon" ] && echo "$afternoon"  
    [ -n "$evening"   ] && echo "$evening"  

    echo  
  done  

} > "$OUTFILE"
