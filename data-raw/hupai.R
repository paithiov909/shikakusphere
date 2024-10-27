hupai <- c(
  # ZHUANGFENG = 0,         // 場風
  ZHUANGFENGDONG = "場風 東",
  ZHUANGFENGNAN  = "場風 南",
  ZHUANGFENGXI   = "場風 西",
  ZHUANGFENGBEI  = "場風 北",
  # MENFENG = 4,            // 自風
  MENFENGDONG = "自風 東",
  MENFENGNAN  = "自風 南",
  MENFENGXI   = "自風 西",
  MENFENGBEI  = "自風 北",
  # FANPAI = 8,             // 翻牌
  FANPAIBAI = "翻牌 白",
  FANPAIFA  = "翻牌 發",
  FANPAIZHONG = "翻牌 中",
  BAOPAI = "ドラ",
  CHIBAOPAI = "赤ドラ",
  LIBAOPAI = "裏ドラ",
  LIZHI = "立直",
  DABULIZHI = "ダブル立直",
  YIPA = "一発",
  HAIDIMOYUE = "海底摸月",
  HEDILAOYU = "河底撈魚",
  LINGSHANGKAIHUA = "嶺上開花",
  QIANGGANG = "槍槓",
  MENQIANQINGZIMOHE = "門前清自摸和",
  PINGHE = "平和",
  DUANYAOJIU = "断幺九",
  YIBEIKOU = "一盃口",
  SANSETONGSHUN = "三色同順",
  YIQITONGGUAN = "一気通貫",
  HUNQUANDAIYAOJIU = "混全帯幺九",
  QIDUIZI = "七対子",
  DUIDUIHU = "対々和",
  SANANKE = "三暗刻",
  SANGANGZI = "三槓子",
  SANSETONGKE = "三色同刻",
  HUNLAOTOU = "混老頭",
  XIAOSANYUAN = "小三元",
  HUNYISE = "混一色",
  CHUNQUANDAIYAOJIU = "純全帯幺九",
  ERBEIKOU = "二盃口",
  QINGYISE = "清一色",
  GUOSHIWUSHUANG = "国士無双",
  GUOSHIWUSHUANGSHISANMIAN = "国士無双十三面",
  SIANKE = "四暗刻",
  SIANKEDANQI = "四暗刻単騎",
  DASANYUAN = "大三元",
  XIAOSIXI = "小四喜",
  DASIXI = "大四喜",
  ZIYISE = "字一色",
  LVYISE = "緑一色",
  QINGLAOTOU = "清老頭",
  SIGANGZI = "四槓子",
  JIULIANBAODENG = "九蓮宝燈",
  CHUNZHENGJIULIANBAODENG = "純正九蓮宝燈",
  TIANHE = "天和",
  DIHE = "地和"
)

hupai <- data.frame(
  id = seq_along(hupai) - 1,
  en = names(hupai),
  jp = unname(hupai)
) |>
  dplyr::as_tibble()

usethis::use_data(hupai, overwrite = TRUE)
