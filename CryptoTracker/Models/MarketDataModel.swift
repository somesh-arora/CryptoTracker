//
//  MarketDataModel.swift
//  CryptoTracker
//
//  Created by Somesh Arora on 12/16/21.
//

import Foundation

/* JSON Data
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 {
   "data": {
     "active_cryptocurrencies": 11762,
     "upcoming_icos": 0,
     "ongoing_icos": 50,
     "ended_icos": 3375,
     "markets": 689,
     "total_market_cap": {
       "btc": 48832906.6812972,
       "eth": 587440384.7238989,
       "ltc": 15601255395.80968,
       "bch": 5316735300.723344,
       "bnb": 4402887375.191321,
       "eos": 720688548301.4603,
       "xrp": 2872393417372.8926,
       "xlm": 8941987626167.791,
       "link": 123249672883.20796,
       "dot": 89877199930.62302,
       "yfi": 93852581.4437028,
       "usd": 2329173193155.793,
       "aed": 8555286055780.56,
       "ars": 237270741993308.56,
       "aud": 3243860468666.808,
       "bdt": 199330804912396.03,
       "bhd": 878109939685.7003,
       "bmd": 2329173193155.793,
       "brl": 13249736955759.213,
       "cad": 2978197303428.655,
       "chf": 2142049747990.849,
       "clp": 1971668399738311.2,
       "cny": 14833106563293.36,
       "czk": 52103140825429.63,
       "dkk": 15299167131724.232,
       "eur": 2057428556710.305,
       "gbp": 1747448213125.9717,
       "hkd": 18173723215577.043,
       "huf": 758635000742773.9,
       "idr": 33478540313553660,
       "ils": 7214008380769.841,
       "inr": 177459810399333.2,
       "jpy": 264859508973302.97,
       "krw": 2761894703201891,
       "kwd": 706293820746.1744,
       "lkr": 469497845770694.2,
       "mmk": 4137345362121589.5,
       "mxn": 48472544439771.21,
       "myr": 9798831623606.434,
       "ngn": 955310385172847.6,
       "nok": 20952310376352.23,
       "nzd": 3431410152526.1,
       "php": 116358505210483.84,
       "pkr": 414180536776464.06,
       "pln": 9531361019970.377,
       "rub": 171751600842072.84,
       "sar": 8741275193600.4,
       "sek": 21062727160746.965,
       "sgd": 3178389739380.3926,
       "thb": 77790890891613.89,
       "try": 36525628180430.484,
       "twd": 64831373574067.83,
       "uah": 63254658414346.79,
       "vef": 233220111830.6894,
       "vnd": 53488895646401576,
       "zar": 37107222726761.51,
       "xdr": 1660269589679.3457,
       "xag": 103344343160.65373,
       "xau": 1292551371.809873,
       "bits": 48832906681297.195,
       "sats": 4883290668129720
     },
     "total_volume": {
       "btc": 2319925.6736944015,
       "eth": 27907780.283901125,
       "ltc": 741175477.651103,
       "bch": 252584405.93931398,
       "bnb": 209169843.7439802,
       "eos": 34238057481.482117,
       "xrp": 136460016140.43501,
       "xlm": 424810810529.72565,
       "link": 5855274646.301177,
       "dot": 4269834375.406428,
       "yfi": 4458694.516276481,
       "usd": 110653021835.2211,
       "aed": 406439614502.9514,
       "ars": 11272122086838.98,
       "aud": 154107459387.1088,
       "bdt": 9469693354369.738,
       "bhd": 41716742496.987564,
       "bmd": 110653021835.2211,
       "brl": 629460890664.8594,
       "cad": 141486486369.60547,
       "chf": 101763268714.00125,
       "clp": 93668889513733.06,
       "cny": 704682704255.4225,
       "czk": 2475286078502.55,
       "dkk": 726824041965.5836,
       "eur": 97743133777.70578,
       "gbp": 83016765713.74347,
       "hkd": 863386800822.5876,
       "huf": 36040795741949.9,
       "idr": 1590479258138704.5,
       "ils": 342718965348.91986,
       "inr": 8430658713011.461,
       "jpy": 12582793377413.1,
       "krw": 131210506714576.75,
       "kwd": 33554201035.26869,
       "lkr": 22304633907135.56,
       "mmk": 196554626354086.34,
       "mxn": 2302805791369.92,
       "myr": 465517262860.77576,
       "ngn": 45384336905715.9,
       "nok": 995390323220.914,
       "nzd": 163017462011.32452,
       "php": 5527893011822.136,
       "pkr": 19676650973968.25,
       "pln": 452810423098.3276,
       "rub": 8159476373013.914,
       "sar": 415275479602.5358,
       "sek": 1000635940374.0342,
       "sgd": 150997113596.3426,
       "thb": 3695644949763.6387,
       "try": 1735238557815.569,
       "twd": 3079971646925.47,
       "uah": 3005065969018.3027,
       "vef": 11079687076.360682,
       "vnd": 2541119722352586.5,
       "zar": 1762868617367.8245,
       "xdr": 78875133759.47308,
       "xag": 4909623678.438718,
       "xau": 61405787.93723748,
       "bits": 2319925673694.4014,
       "sats": 231992567369440.16
     },
     "market_cap_percentage": {
       "btc": 38.70920449867663,
       "eth": 20.218208139165917,
       "bnb": 3.8176558371791383,
       "usdt": 3.3142791637401388,
       "sol": 2.365677444112174,
       "usdc": 1.7956264106851971,
       "ada": 1.7153128982025194,
       "xrp": 1.644109204668541,
       "dot": 1.185853652643266,
       "avax": 1.0683252527449203
     },
     "market_cap_change_percentage_24h_usd": -2.0675726144563247,
     "updated_at": 1639707743
   }
 }
 */


struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let activeCryptocurrencies: Int?
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    let updatedAt: Int?
    
    enum CodingKeys: String, CodingKey {
        case activeCryptocurrencies = "active_cryptocurrencies"
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
        case updatedAt = "updated_at"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominanace: String {
        if let item = marketCapPercentage.first(where: {$0.key == "btc"}) {
            return "\(item.value.asPercentString())"
        }
        return ""
    }
}
