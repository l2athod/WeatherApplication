import Foundation
@testable import WeatherApp

let weatherForecastResponseData = """
{
    "cod": "200",
    "message": 0,
    "cnt": 40,
    "list": [
        {
            "dt": 1697554800,
            "main": {
                "temp": 302.64,
                "feels_like": 302.94,
                "temp_min": 302.64,
                "temp_max": 302.64,
                "pressure": 1013,
                "sea_level": 1013,
                "grnd_level": 1007,
                "humidity": 46,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 3.18,
                "deg": 341,
                "gust": 4.75
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-17 15:00:00"
        },
        {
            "dt": 1697565600,
            "main": {
                "temp": 302.19,
                "feels_like": 302.74,
                "temp_min": 301.29,
                "temp_max": 302.19,
                "pressure": 1013,
                "sea_level": 1013,
                "grnd_level": 1008,
                "humidity": 49,
                "temp_kf": 0.9
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 0.71,
                "deg": 250,
                "gust": 0.95
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-17 18:00:00"
        },
        {
            "dt": 1697576400,
            "main": {
                "temp": 300.93,
                "feels_like": 301.61,
                "temp_min": 300.08,
                "temp_max": 300.93,
                "pressure": 1013,
                "sea_level": 1013,
                "grnd_level": 1008,
                "humidity": 53,
                "temp_kf": 0.85
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 2.2,
                "deg": 242,
                "gust": 2.34
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-17 21:00:00"
        },
        {
            "dt": 1697587200,
            "main": {
                "temp": 299.04,
                "feels_like": 299.43,
                "temp_min": 299.04,
                "temp_max": 299.04,
                "pressure": 1013,
                "sea_level": 1013,
                "grnd_level": 1007,
                "humidity": 67,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 1
            },
            "wind": {
                "speed": 2.61,
                "deg": 244,
                "gust": 2.89
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-18 00:00:00"
        },
        {
            "dt": 1697598000,
            "main": {
                "temp": 301.48,
                "feels_like": 303.1,
                "temp_min": 301.48,
                "temp_max": 301.48,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 1010,
                "humidity": 60,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02d"
                }
            ],
            "clouds": {
                "all": 16
            },
            "wind": {
                "speed": 3.34,
                "deg": 309,
                "gust": 3.78
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-18 03:00:00"
        },
        {
            "dt": 1697608800,
            "main": {
                "temp": 305.22,
                "feels_like": 306.51,
                "temp_min": 305.22,
                "temp_max": 305.22,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 1010,
                "humidity": 45,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 8
            },
            "wind": {
                "speed": 3.2,
                "deg": 335,
                "gust": 2.96
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-18 06:00:00"
        },
        {
            "dt": 1697619600,
            "main": {
                "temp": 306.49,
                "feels_like": 307.95,
                "temp_min": 306.49,
                "temp_max": 306.49,
                "pressure": 1012,
                "sea_level": 1012,
                "grnd_level": 1007,
                "humidity": 42,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 4.84,
                "deg": 352,
                "gust": 4.13
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-18 09:00:00"
        },
        {
            "dt": 1697630400,
            "main": {
                "temp": 305.66,
                "feels_like": 306.8,
                "temp_min": 305.66,
                "temp_max": 305.66,
                "pressure": 1012,
                "sea_level": 1012,
                "grnd_level": 1006,
                "humidity": 43,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 2.97,
                "deg": 7,
                "gust": 3.18
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-18 12:00:00"
        },
        {
            "dt": 1697641200,
            "main": {
                "temp": 303.27,
                "feels_like": 304.54,
                "temp_min": 303.27,
                "temp_max": 303.27,
                "pressure": 1013,
                "sea_level": 1013,
                "grnd_level": 1008,
                "humidity": 51,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 1.65,
                "deg": 15,
                "gust": 1.91
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-18 15:00:00"
        },
        {
            "dt": 1697652000,
            "main": {
                "temp": 302.18,
                "feels_like": 302.61,
                "temp_min": 302.18,
                "temp_max": 302.18,
                "pressure": 1013,
                "sea_level": 1013,
                "grnd_level": 1007,
                "humidity": 48,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 2.17,
                "deg": 290,
                "gust": 2.26
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-18 18:00:00"
        },
        {
            "dt": 1697662800,
            "main": {
                "temp": 300.53,
                "feels_like": 301.31,
                "temp_min": 300.53,
                "temp_max": 300.53,
                "pressure": 1012,
                "sea_level": 1012,
                "grnd_level": 1006,
                "humidity": 55,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 3.06,
                "deg": 290,
                "gust": 3.55
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-18 21:00:00"
        },
        {
            "dt": 1697673600,
            "main": {
                "temp": 299.55,
                "feels_like": 299.55,
                "temp_min": 299.55,
                "temp_max": 299.55,
                "pressure": 1012,
                "sea_level": 1012,
                "grnd_level": 1007,
                "humidity": 59,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 1.86,
                "deg": 266,
                "gust": 2.01
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-19 00:00:00"
        },
        {
            "dt": 1697684400,
            "main": {
                "temp": 302.05,
                "feels_like": 302.68,
                "temp_min": 302.05,
                "temp_max": 302.05,
                "pressure": 1014,
                "sea_level": 1014,
                "grnd_level": 1009,
                "humidity": 50,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 1.19,
                "deg": 253,
                "gust": 1.18
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-19 03:00:00"
        },
        {
            "dt": 1697695200,
            "main": {
                "temp": 306.74,
                "feels_like": 306.06,
                "temp_min": 306.74,
                "temp_max": 306.74,
                "pressure": 1014,
                "sea_level": 1014,
                "grnd_level": 1009,
                "humidity": 31,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 1.09,
                "deg": 328,
                "gust": 1.11
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-19 06:00:00"
        },
        {
            "dt": 1697706000,
            "main": {
                "temp": 308.77,
                "feels_like": 307.52,
                "temp_min": 308.77,
                "temp_max": 308.77,
                "pressure": 1011,
                "sea_level": 1011,
                "grnd_level": 1006,
                "humidity": 24,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 3.71,
                "deg": 1,
                "gust": 2.18
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-19 09:00:00"
        },
        {
            "dt": 1697716800,
            "main": {
                "temp": 306.59,
                "feels_like": 305.14,
                "temp_min": 306.59,
                "temp_max": 306.59,
                "pressure": 1011,
                "sea_level": 1011,
                "grnd_level": 1006,
                "humidity": 26,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 4.38,
                "deg": 357,
                "gust": 4.62
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-19 12:00:00"
        },
        {
            "dt": 1697727600,
            "main": {
                "temp": 303.71,
                "feels_like": 302.36,
                "temp_min": 303.71,
                "temp_max": 303.71,
                "pressure": 1012,
                "sea_level": 1012,
                "grnd_level": 1007,
                "humidity": 29,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 2.22,
                "deg": 5,
                "gust": 2.34
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-19 15:00:00"
        },
        {
            "dt": 1697738400,
            "main": {
                "temp": 302.09,
                "feels_like": 301.22,
                "temp_min": 302.09,
                "temp_max": 302.09,
                "pressure": 1012,
                "sea_level": 1012,
                "grnd_level": 1007,
                "humidity": 34,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 0.97,
                "deg": 151,
                "gust": 1.08
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-19 18:00:00"
        },
        {
            "dt": 1697749200,
            "main": {
                "temp": 300.94,
                "feels_like": 300.4,
                "temp_min": 300.94,
                "temp_max": 300.94,
                "pressure": 1011,
                "sea_level": 1011,
                "grnd_level": 1006,
                "humidity": 36,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 2.25,
                "deg": 207,
                "gust": 2.31
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-19 21:00:00"
        },
        {
            "dt": 1697760000,
            "main": {
                "temp": 300.23,
                "feels_like": 300.02,
                "temp_min": 300.23,
                "temp_max": 300.23,
                "pressure": 1012,
                "sea_level": 1012,
                "grnd_level": 1006,
                "humidity": 39,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 2.29,
                "deg": 276,
                "gust": 2.45
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-20 00:00:00"
        },
        {
            "dt": 1697770800,
            "main": {
                "temp": 302.9,
                "feels_like": 302.67,
                "temp_min": 302.9,
                "temp_max": 302.9,
                "pressure": 1014,
                "sea_level": 1014,
                "grnd_level": 1009,
                "humidity": 41,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 2.58,
                "deg": 331,
                "gust": 3.13
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-20 03:00:00"
        },
        {
            "dt": 1697781600,
            "main": {
                "temp": 306.59,
                "feels_like": 306.03,
                "temp_min": 306.59,
                "temp_max": 306.59,
                "pressure": 1014,
                "sea_level": 1014,
                "grnd_level": 1008,
                "humidity": 32,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 3.48,
                "deg": 18,
                "gust": 3.02
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-20 06:00:00"
        },
        {
            "dt": 1697792400,
            "main": {
                "temp": 308.37,
                "feels_like": 307.35,
                "temp_min": 308.37,
                "temp_max": 308.37,
                "pressure": 1011,
                "sea_level": 1011,
                "grnd_level": 1005,
                "humidity": 26,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 3.33,
                "deg": 24,
                "gust": 3.49
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-20 09:00:00"
        },
        {
            "dt": 1697803200,
            "main": {
                "temp": 307.11,
                "feels_like": 306.21,
                "temp_min": 307.11,
                "temp_max": 307.11,
                "pressure": 1010,
                "sea_level": 1010,
                "grnd_level": 1005,
                "humidity": 29,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 3.94,
                "deg": 9,
                "gust": 3.98
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-20 12:00:00"
        },
        {
            "dt": 1697814000,
            "main": {
                "temp": 304.22,
                "feels_like": 303.61,
                "temp_min": 304.22,
                "temp_max": 304.22,
                "pressure": 1012,
                "sea_level": 1012,
                "grnd_level": 1007,
                "humidity": 36,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 3.46,
                "deg": 42,
                "gust": 4.14
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-20 15:00:00"
        },
        {
            "dt": 1697824800,
            "main": {
                "temp": 302.94,
                "feels_like": 302.49,
                "temp_min": 302.94,
                "temp_max": 302.94,
                "pressure": 1012,
                "sea_level": 1012,
                "grnd_level": 1007,
                "humidity": 39,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 2.5,
                "deg": 105,
                "gust": 2.73
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-20 18:00:00"
        },
        {
            "dt": 1697835600,
            "main": {
                "temp": 301.74,
                "feels_like": 301.35,
                "temp_min": 301.74,
                "temp_max": 301.74,
                "pressure": 1011,
                "sea_level": 1011,
                "grnd_level": 1006,
                "humidity": 40,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 1.89,
                "deg": 214,
                "gust": 1.92
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-20 21:00:00"
        },
        {
            "dt": 1697846400,
            "main": {
                "temp": 300.2,
                "feels_like": 300.37,
                "temp_min": 300.2,
                "temp_max": 300.2,
                "pressure": 1012,
                "sea_level": 1012,
                "grnd_level": 1007,
                "humidity": 46,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 1,
                "deg": 248,
                "gust": 1.03
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-21 00:00:00"
        },
        {
            "dt": 1697857200,
            "main": {
                "temp": 303.6,
                "feels_like": 303.01,
                "temp_min": 303.6,
                "temp_max": 303.6,
                "pressure": 1014,
                "sea_level": 1014,
                "grnd_level": 1009,
                "humidity": 37,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 1.2,
                "deg": 51,
                "gust": 1.36
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-21 03:00:00"
        },
        {
            "dt": 1697868000,
            "main": {
                "temp": 307.75,
                "feels_like": 306.89,
                "temp_min": 307.75,
                "temp_max": 307.75,
                "pressure": 1014,
                "sea_level": 1014,
                "grnd_level": 1009,
                "humidity": 28,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 1.97,
                "deg": 49,
                "gust": 1.75
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-21 06:00:00"
        },
        {
            "dt": 1697878800,
            "main": {
                "temp": 309.4,
                "feels_like": 308.34,
                "temp_min": 309.4,
                "temp_max": 309.4,
                "pressure": 1011,
                "sea_level": 1011,
                "grnd_level": 1005,
                "humidity": 24,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 3
            },
            "wind": {
                "speed": 4.03,
                "deg": 8,
                "gust": 3.54
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-21 09:00:00"
        },
        {
            "dt": 1697889600,
            "main": {
                "temp": 306.97,
                "feels_like": 306.03,
                "temp_min": 306.97,
                "temp_max": 306.97,
                "pressure": 1010,
                "sea_level": 1010,
                "grnd_level": 1005,
                "humidity": 29,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03d"
                }
            ],
            "clouds": {
                "all": 36
            },
            "wind": {
                "speed": 4.66,
                "deg": 2,
                "gust": 5.51
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-21 12:00:00"
        },
        {
            "dt": 1697900400,
            "main": {
                "temp": 304.51,
                "feels_like": 303.83,
                "temp_min": 304.51,
                "temp_max": 304.51,
                "pressure": 1012,
                "sea_level": 1012,
                "grnd_level": 1006,
                "humidity": 35,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 79
            },
            "wind": {
                "speed": 2.99,
                "deg": 71,
                "gust": 3.54
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-21 15:00:00"
        },
        {
            "dt": 1697911200,
            "main": {
                "temp": 304.38,
                "feels_like": 303.55,
                "temp_min": 304.38,
                "temp_max": 304.38,
                "pressure": 1012,
                "sea_level": 1012,
                "grnd_level": 1007,
                "humidity": 34,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 72
            },
            "wind": {
                "speed": 2.66,
                "deg": 161,
                "gust": 3.3
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-21 18:00:00"
        },
        {
            "dt": 1697922000,
            "main": {
                "temp": 303.63,
                "feels_like": 303.41,
                "temp_min": 303.63,
                "temp_max": 303.63,
                "pressure": 1011,
                "sea_level": 1011,
                "grnd_level": 1006,
                "humidity": 40,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 99
            },
            "wind": {
                "speed": 3.91,
                "deg": 224,
                "gust": 6.6
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-21 21:00:00"
        },
        {
            "dt": 1697932800,
            "main": {
                "temp": 301.96,
                "feels_like": 301.93,
                "temp_min": 301.96,
                "temp_max": 301.96,
                "pressure": 1011,
                "sea_level": 1011,
                "grnd_level": 1006,
                "humidity": 44,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 80
            },
            "wind": {
                "speed": 4.73,
                "deg": 225,
                "gust": 8.35
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-22 00:00:00"
        },
        {
            "dt": 1697943600,
            "main": {
                "temp": 303.76,
                "feels_like": 303.99,
                "temp_min": 303.76,
                "temp_max": 303.76,
                "pressure": 1013,
                "sea_level": 1013,
                "grnd_level": 1008,
                "humidity": 43,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 4.67,
                "deg": 263,
                "gust": 6.59
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-22 03:00:00"
        },
        {
            "dt": 1697954400,
            "main": {
                "temp": 307.33,
                "feels_like": 307.25,
                "temp_min": 307.33,
                "temp_max": 307.33,
                "pressure": 1013,
                "sea_level": 1013,
                "grnd_level": 1008,
                "humidity": 33,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 93
            },
            "wind": {
                "speed": 1.68,
                "deg": 352,
                "gust": 2.48
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-22 06:00:00"
        },
        {
            "dt": 1697965200,
            "main": {
                "temp": 308.66,
                "feels_like": 307.93,
                "temp_min": 308.66,
                "temp_max": 308.66,
                "pressure": 1010,
                "sea_level": 1010,
                "grnd_level": 1005,
                "humidity": 27,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 74
            },
            "wind": {
                "speed": 3.88,
                "deg": 7,
                "gust": 3.54
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-22 09:00:00"
        },
        {
            "dt": 1697976000,
            "main": {
                "temp": 305.8,
                "feels_like": 305.47,
                "temp_min": 305.8,
                "temp_max": 305.8,
                "pressure": 1010,
                "sea_level": 1010,
                "grnd_level": 1005,
                "humidity": 35,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 87
            },
            "wind": {
                "speed": 4.11,
                "deg": 354,
                "gust": 4.9
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-22 12:00:00"
        }
    ],
    "city": {
        "id": 1272701,
        "name": "Dhrāngadhra",
        "coord": {
            "lat": 22.9939,
            "lon": 71.46
        },
        "country": "IN",
        "population": 75578,
        "timezone": 19800,
        "sunrise": 1697505080,
        "sunset": 1697546856
    }
}
""".data(using: .utf8)

let weatherForecastResponseMock = try? JSONDecoder().decode(WeatherForecastResponse.self, from: weatherForecastResponseData!)
