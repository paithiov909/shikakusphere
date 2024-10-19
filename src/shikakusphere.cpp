#include "xiangting.h"
#include "game.h"
#include "feature.h"
#include "random.h"
#include "paipu.h"
#include "svg.h"

Defen create_defen(const Shoupai& shoupai, const std::string& rongpai,
                   const Rule& rule, const int zhuangfeng, const int menfeng,
                   const int lizhi, const bool yifa, const bool qianggang,
                   const bool lingshang, const int haidi, const int tianhu,
                   const std::vector<std::string>& baopai,
                   const std::vector<std::string>& libaopai,
                   const int changbang, const int lizhibang) {
  return hule(
      shoupai, rongpai,
      Param{rule, zhuangfeng, menfeng,
            Param::Hupai{lizhi, yifa, qianggang, lingshang, haidi, tianhu},
            baopai, libaopai, Param::Jicun{changbang, lizhibang}});
}

Rule create_rule(const int startingPoints,
                 const std::array<float, 4>& rankPoints,
                 const bool roundRankPoints, const bool doubleWindTileScore,
                 const std::array<int, 3>& hongpai, const bool canduan,
                 const int canChangePermissionLevel, const int roundsType,
                 const bool abortiveDraw, const bool liujumanguan,
                 const bool notenDeclaration, const bool notenPenalty,
                 const int maxSimultaneousWinners,
                 const int dealerContinuationType, const bool bankruptcyEndAll,
                 const bool lastRoundStop, const int overtimeType,
                 const bool yifa, const bool libaopai, const bool gangbaopai,
                 const bool ganglibaopai, const bool gangbaopaiPostAddition,
                 const bool lizhiWithoutTsumoBonus,
                 const int lizhiPostClosedGangPermissionLevel,
                 const bool damanguanCombination, const bool doubleDamanguan,
                 const bool countedDamanguan, const bool damanguanPao,
                 const bool roundUpManguan) {
  return Rule{startingPoints,
              rankPoints,
              roundRankPoints,
              doubleWindTileScore,
              hongpai,
              canduan,
              canChangePermissionLevel,
              roundsType,
              abortiveDraw,
              liujumanguan,
              notenDeclaration,
              notenPenalty,
              maxSimultaneousWinners,
              dealerContinuationType,
              bankruptcyEndAll,
              lastRoundStop,
              overtimeType,
              yifa,
              libaopai,
              gangbaopai,
              ganglibaopai,
              gangbaopaiPostAddition,
              lizhiWithoutTsumoBonus,
              lizhiPostClosedGangPermissionLevel,
              damanguanCombination,
              doubleDamanguan,
              countedDamanguan,
              damanguanPao,
              roundUpManguan};
}
Rule set_rule(Rcpp::List& list, Rcpp::NumericVector& rankPoints,
              Rcpp::IntegerVector& hongpai) {
  const std::array<float, 4> rp = {
      static_cast<float>(rankPoints(0)), static_cast<float>(rankPoints(1)),
      static_cast<float>(rankPoints(2)), static_cast<float>(rankPoints(3))};
  const std::array<int, 3> hp = {hongpai(0), hongpai(1), hongpai(2)};
  Rule rule = create_rule(
      Rcpp::as<bool>(list["startingPoints"]), rp,
      Rcpp::as<bool>(list["roundRankPoints"]),
      Rcpp::as<bool>(list["doubleWindTileScore"]), hp,
      Rcpp::as<bool>(list["canduan"]),
      Rcpp::as<int>(list["canChangePermissionLevel"]),
      Rcpp::as<int>(list["roundsType"]), Rcpp::as<bool>(list["abortiveDraw"]),
      Rcpp::as<bool>(list["liujumanguan"]),
      Rcpp::as<bool>(list["notenDeclaration"]),
      Rcpp::as<bool>(list["notenPenalty"]),
      Rcpp::as<int>(list["maxSimultaneousWinners"]),
      Rcpp::as<int>(list["dealerContinuationType"]),
      Rcpp::as<bool>(list["bankruptcyEndAll"]),
      Rcpp::as<bool>(list["lastRoundStop"]),
      Rcpp::as<int>(list["overtimeType"]), Rcpp::as<bool>(list["yifa"]),
      Rcpp::as<bool>(list["libaopai"]), Rcpp::as<bool>(list["gangbaopai"]),
      Rcpp::as<bool>(list["ganglibaopai"]),
      Rcpp::as<bool>(list["gangbaopaiPostAddition"]),
      Rcpp::as<int>(list["lizhiWithoutTsumoBonus"]),
      Rcpp::as<int>(list["lizhiPostClosedGangPermissionLevel"]),
      Rcpp::as<int>(list["damanguanCombination"]),
      Rcpp::as<bool>(list["doubleDamanguan"]),
      Rcpp::as<bool>(list["countedDamanguan"]),
      Rcpp::as<bool>(list["damanguanPao"]),
      Rcpp::as<bool>(list["roundUpManguan"]));
  return rule;
}

extern std::mt19937_64 engine;

std::map<std::string, int> init_rest(const Rule& rule) {
  std::map<std::string, int> rest{
      {"m1", 4}, {"m2", 4}, {"m3", 4}, {"m4", 4}, {"m5", 4}, {"m6", 4},
      {"m7", 4}, {"m8", 4}, {"m9", 4}, {"p1", 4}, {"p2", 4}, {"p3", 4},
      {"p4", 4}, {"p5", 4}, {"p6", 4}, {"p7", 4}, {"p8", 4}, {"p9", 4},
      {"s1", 4}, {"s2", 4}, {"s3", 4}, {"s4", 4}, {"s5", 4}, {"s6", 4},
      {"s7", 4}, {"s8", 4}, {"s9", 4}, {"z1", 4}, {"z2", 4}, {"z3", 4},
      {"z4", 4}, {"z5", 4}, {"z6", 4}, {"z7", 4}};
  for (const auto s : {'m', 'p', 's'}) {
    for (int i = 0; i < rule.hongpai_(s); i++) {
      rest[to_string(s, 5)]--;
      rest[to_string(s, 0)]++;
    }
  }
  return rest;
}

Shoupai random_setup(
    const Rule& rule,
    const std::function<void(std::vector<std::string>& pai,
                             std::map<std::string, int>& rest,
                             std::vector<std::string>& fulou, const Rule& rule,
                             std::mt19937_64& mt)>& setup_func) {
  std::vector<std::string> pai;
  std::vector<std::string> fulou;
  std::map<std::string, int> rest = init_rest(rule);
  setup_func(pai, rest, fulou, rule, engine);
  std::shuffle(pai.begin(), pai.end(), engine);
  return Shoupai{pai, fulou};
}

// Shoupai ----
// [[Rcpp::export]]
std::vector<std::string> skksph_shoupai_to_svg(
    const std::vector<std::string>& pai) {
  std::vector<std::string> ret;
  ret.reserve(pai.size());
  for (const auto& paistr : pai) {
    Shoupai p = Shoupai{paistr};
    ret.push_back(shoupai_to_svg(p));
  }
  return ret;
}

// Defen ----
// [[Rcpp::export]]
Rcpp::DataFrame skksph_get_defen(
    const std::string& paistr,
    const std::vector<std::string>& baopai,    // ドラ
    const std::vector<std::string>& libaopai,  // 裏ドラ
    Rcpp::List list, Rcpp::NumericVector rankPoints,
    Rcpp::IntegerVector hongpai, const std::string& rongpai = "",
    const int zhuangfeng = 0, const int menfeng = 1, const int lizhi = 0,
    const bool yifa = false, const bool qianggang = false,
    const bool lingshang = false, const int haidi = 0, const int tianhu = 0,
    const int changbang = 0, const int lizhibang = 0) {
  // FIXME: Rcppで空のstd::vectorを渡すやり方がわからない
  if (std::all_of(baopai.begin(), baopai.end(),
                  [](const std::string& str) { return str.empty(); })) {
    Rcpp::stop("baopai can not be empty");
  }
  const std::vector<std::string> libao =
      std::all_of(libaopai.begin(), libaopai.end(),
                  [](const std::string& str) { return str.empty(); })
          ? std::vector<std::string>{}
          : libaopai;
  const std::string rp = rongpai.empty() ? std::string{} : rongpai;

  std::vector<std::string> sp;
  std::vector<std::string> hp;
  std::vector<int> fu;
  std::vector<int> fanshu;
  std::vector<int> damanguan;
  std::vector<int> df;
  // std::vector<std::array<int, 4>> fenpei;
  std::vector<int> mf;  // 自風

  Shoupai p = Shoupai{paistr};
  Rule rule = set_rule(list, rankPoints, hongpai);
  Defen defen = create_defen(p, rp, rule, zhuangfeng, menfeng, lizhi, yifa,
                             qianggang, lingshang, haidi, tianhu, baopai, libao,
                             changbang, lizhibang);

  std::string hupai;
  for (const auto& h : defen.hupai) {
    if (!hupai.empty()) {
      hupai += ",";
    }
    hupai += std::to_string(static_cast<int>(h.name));
  }
  sp.push_back(paistr + rongpai);
  hp.push_back(hupai);
  fu.push_back(defen.fu);
  fanshu.push_back(defen.fanshu);
  damanguan.push_back(defen.damanguan);
  df.push_back(defen.defen);
  mf.push_back(defen.menfeng);

  return Rcpp::DataFrame::create(
      Rcpp::Named("shoupai") = Rcpp::wrap(sp),
      Rcpp::Named("hupai") = Rcpp::wrap(hp), Rcpp::Named("fu") = Rcpp::wrap(fu),
      Rcpp::Named("fanshu") = Rcpp::wrap(fanshu),
      Rcpp::Named("damanguan") = Rcpp::wrap(damanguan),
      Rcpp::Named("defen") = Rcpp::wrap(df),
      Rcpp::Named("menfeng") = Rcpp::wrap(mf));
}

// [[Rcpp::export]]
std::vector<int> skksph_get_xiangting(const std::vector<std::string>& shoupai) {
  std::vector<int> ret;
  ret.reserve(shoupai.size());
  for (const auto& paistr : shoupai) {
    Shoupai p = Shoupai{paistr};
    ret.push_back(xiangting(p));
  }
  return ret;
}

// [[Rcpp::export]]
Rcpp::List skksph_get_tingpai(const std::vector<std::string>& shoupai) {
  std::vector<std::vector<std::string>> ret;
  ret.reserve(shoupai.size());
  for (const auto& paistr : shoupai) {
    Shoupai p = Shoupai{paistr};
    ret.push_back(tingpai(p, xiangting));
  }
  return Rcpp::wrap(ret);
}

// Features ----
// TODO: features

// Random ----
// [[Rcpp::export]]
std::vector<std::string> random_zhuangfeng(const int n, const int zhuangfeng,
                                           const std::size_t seed,
                                           Rcpp::List list,
                                           Rcpp::NumericVector rankPoints,
                                           Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p =
        random_setup(rule, [zhuangfeng](std::vector<std::string>& pai,
                                        std::map<std::string, int>& rest,
                                        std::vector<std::string>& fulou,
                                        const Rule& rule, std::mt19937_64& mt) {
          setup_zhuangfeng(pai, rest, fulou, zhuangfeng, rule, mt);
        });
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_menfeng(const int n, const int menfeng,
                                        const std::size_t seed, Rcpp::List list,
                                        Rcpp::NumericVector rankPoints,
                                        Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p =
        random_setup(rule, [menfeng](std::vector<std::string>& pai,
                                     std::map<std::string, int>& rest,
                                     std::vector<std::string>& fulou,
                                     const Rule& rule, std::mt19937_64& mt) {
          setup_menfeng(pai, rest, fulou, menfeng, rule, mt);
        });
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_fanpai(const int n, const std::size_t seed,
                                       Rcpp::List list,
                                       Rcpp::NumericVector rankPoints,
                                       Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(rule, setup_fanpai);
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_pinghe(const int n, const int zhuangfeng,
                                       const int menfeng,
                                       const std::size_t seed, Rcpp::List list,
                                       Rcpp::NumericVector rankPoints,
                                       Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(
        rule, [zhuangfeng, menfeng](std::vector<std::string>& pai,
                                    std::map<std::string, int>& rest,
                                    std::vector<std::string>& fulou,
                                    const Rule& rule, std::mt19937_64& mt) {
          setup_pinghe(pai, rest, zhuangfeng, menfeng, rule, mt);
        });
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_duanyaojiu(const int n, const std::size_t seed,
                                           Rcpp::List list,
                                           Rcpp::NumericVector rankPoints,
                                           Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(
        rule,
        [](std::vector<std::string>& pai, std::map<std::string, int>& rest,
           std::vector<std::string>& fulou, const Rule& rule,
           std::mt19937_64& mt) { setup_duanyaojiu(pai, rest, rule, mt); });
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_yibeikou(const int n, const std::size_t seed,
                                         Rcpp::List list,
                                         Rcpp::NumericVector rankPoints,
                                         Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(
        rule,
        [](std::vector<std::string>& pai, std::map<std::string, int>& rest,
           std::vector<std::string>& fulou, const Rule& rule,
           std::mt19937_64& mt) { setup_yibeikou(pai, rest, rule, mt); });
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_sansetongshun(const int n,
                                              const std::size_t seed,
                                              Rcpp::List list,
                                              Rcpp::NumericVector rankPoints,
                                              Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(rule, setup_sansetongshun);
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_yiqitongguan(const int n,
                                             const std::size_t seed,
                                             Rcpp::List list,
                                             Rcpp::NumericVector rankPoints,
                                             Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(rule, setup_yiqitongguan);
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_hunquandaiyaojiu(const int n,
                                                 const std::size_t seed,
                                                 Rcpp::List list,
                                                 Rcpp::NumericVector rankPoints,
                                                 Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(rule, setup_hunquandaiyaojiu);
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_qiduizi(const int n, const std::size_t seed,
                                        Rcpp::List list,
                                        Rcpp::NumericVector rankPoints,
                                        Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(
        rule,
        [](std::vector<std::string>& pai, std::map<std::string, int>& rest,
           std::vector<std::string>& fulou, const Rule& rule,
           std::mt19937_64& mt) { setup_qiduizi(pai, rest, rule, mt); });
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_duiduihu(const int n, const std::size_t seed,
                                         Rcpp::List list,
                                         Rcpp::NumericVector rankPoints,
                                         Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(rule, setup_duiduihu);
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_sananke(const int n, const std::size_t seed,
                                        Rcpp::List list,
                                        Rcpp::NumericVector rankPoints,
                                        Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(rule, setup_sananke);
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_sangangzi(const int n, const std::size_t seed,
                                          Rcpp::List list,
                                          Rcpp::NumericVector rankPoints,
                                          Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(rule, setup_sangangzi);
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_sansetongke(const int n, const std::size_t seed,
                                            Rcpp::List list,
                                            Rcpp::NumericVector rankPoints,
                                            Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(rule, setup_sansetongke);
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_hunlaotou(const int n, const std::size_t seed,
                                          Rcpp::List list,
                                          Rcpp::NumericVector rankPoints,
                                          Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(rule, setup_hunlaotou);
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_xiaosanyuan(const int n, const std::size_t seed,
                                            Rcpp::List list,
                                            Rcpp::NumericVector rankPoints,
                                            Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(rule, setup_xiaosanyuan);
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_hunyise(const int n, const std::size_t seed,
                                        Rcpp::List list,
                                        Rcpp::NumericVector rankPoints,
                                        Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(rule, setup_hunyise);
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_chunquandaiyaojiu(
    const int n, const std::size_t seed, Rcpp::List list,
    Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(rule, setup_chunquandaiyaojiu);
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_erbeikou(const int n, const std::size_t seed,
                                         Rcpp::List list,
                                         Rcpp::NumericVector rankPoints,
                                         Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(rule, setup_erbeikou);
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_qingyise(const int n, const std::size_t seed,
                                         Rcpp::List list,
                                         Rcpp::NumericVector rankPoints,
                                         Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(rule, setup_qingyise);
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_guoshiwushuang(const int n,
                                               const std::size_t seed,
                                               Rcpp::List list,
                                               Rcpp::NumericVector rankPoints,
                                               Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(
        rule,
        [](std::vector<std::string>& pai, std::map<std::string, int>& rest,
           std::vector<std::string>& fulou, const Rule& rule,
           std::mt19937_64& mt) { setup_guoshiwushuang(pai, rest, rule, mt); });
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_sianke(const int n, const std::size_t seed,
                                       Rcpp::List list,
                                       Rcpp::NumericVector rankPoints,
                                       Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(
        rule,
        [](std::vector<std::string>& pai, std::map<std::string, int>& rest,
           std::vector<std::string>& fulou, const Rule& rule,
           std::mt19937_64& mt) { setup_sianke(pai, rest, rule, mt); });
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_dasanyuan(const int n, const std::size_t seed,
                                          Rcpp::List list,
                                          Rcpp::NumericVector rankPoints,
                                          Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(rule, setup_dasanyuan);
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_xiaosixi(const int n, const std::size_t seed,
                                         Rcpp::List list,
                                         Rcpp::NumericVector rankPoints,
                                         Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(rule, setup_xiaosixi);
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_dasixi(const int n, const std::size_t seed,
                                       Rcpp::List list,
                                       Rcpp::NumericVector rankPoints,
                                       Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(rule, setup_dasixi);
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_ziyise(const int n, const std::size_t seed,
                                       Rcpp::List list,
                                       Rcpp::NumericVector rankPoints,
                                       Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(rule, setup_ziyise);
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_lvyise(const int n, const std::size_t seed,
                                       Rcpp::List list,
                                       Rcpp::NumericVector rankPoints,
                                       Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(rule, setup_lvyise);
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_qinglaotou(const int n, const std::size_t seed,
                                           Rcpp::List list,
                                           Rcpp::NumericVector rankPoints,
                                           Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(rule, setup_qinglaotou);
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_sigangzi(const int n, const std::size_t seed,
                                         Rcpp::List list,
                                         Rcpp::NumericVector rankPoints,
                                         Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(rule, setup_sigangzi);
    ret[i] = p.toString();
  }
  return ret;
}

// [[Rcpp::export]]
std::vector<std::string> random_jiulianbaodeng(const int n,
                                               const std::size_t seed,
                                               Rcpp::List list,
                                               Rcpp::NumericVector rankPoints,
                                               Rcpp::IntegerVector hongpai) {
  std::mt19937_64 mt(seed);
  Rule rule = set_rule(list, rankPoints, hongpai);
  std::vector<std::string> ret(n);
  for (int i = 0; i < n; i++) {
    Shoupai p = random_setup(
        rule,
        [](std::vector<std::string>& pai, std::map<std::string, int>& rest,
           std::vector<std::string>& fulou, const Rule& rule,
           std::mt19937_64& mt) { setup_jiulianbaodeng(pai, rest, rule, mt); });
    ret[i] = p.toString();
  }
  return ret;
}
