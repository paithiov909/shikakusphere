// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// to_svg_string
std::vector<std::string> to_svg_string(const std::vector<std::string>& pai);
RcppExport SEXP _shikakusphere_to_svg_string(SEXP paiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const std::vector<std::string>& >::type pai(paiSEXP);
    rcpp_result_gen = Rcpp::wrap(to_svg_string(pai));
    return rcpp_result_gen;
END_RCPP
}
// get_defen
Rcpp::DataFrame get_defen(const std::string& paistr, const std::vector<std::string>& baopai, const std::vector<std::string>& libaopai, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai, const std::string& rongpai, const int zhuangfeng, const int menfeng, const int lizhi, const bool yifa, const bool qianggang, const bool lingshang, const int haidi, const int tianhu, const int changbang, const int lizhibang);
RcppExport SEXP _shikakusphere_get_defen(SEXP paistrSEXP, SEXP baopaiSEXP, SEXP libaopaiSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP, SEXP rongpaiSEXP, SEXP zhuangfengSEXP, SEXP menfengSEXP, SEXP lizhiSEXP, SEXP yifaSEXP, SEXP qianggangSEXP, SEXP lingshangSEXP, SEXP haidiSEXP, SEXP tianhuSEXP, SEXP changbangSEXP, SEXP lizhibangSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const std::string& >::type paistr(paistrSEXP);
    Rcpp::traits::input_parameter< const std::vector<std::string>& >::type baopai(baopaiSEXP);
    Rcpp::traits::input_parameter< const std::vector<std::string>& >::type libaopai(libaopaiSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    Rcpp::traits::input_parameter< const std::string& >::type rongpai(rongpaiSEXP);
    Rcpp::traits::input_parameter< const int >::type zhuangfeng(zhuangfengSEXP);
    Rcpp::traits::input_parameter< const int >::type menfeng(menfengSEXP);
    Rcpp::traits::input_parameter< const int >::type lizhi(lizhiSEXP);
    Rcpp::traits::input_parameter< const bool >::type yifa(yifaSEXP);
    Rcpp::traits::input_parameter< const bool >::type qianggang(qianggangSEXP);
    Rcpp::traits::input_parameter< const bool >::type lingshang(lingshangSEXP);
    Rcpp::traits::input_parameter< const int >::type haidi(haidiSEXP);
    Rcpp::traits::input_parameter< const int >::type tianhu(tianhuSEXP);
    Rcpp::traits::input_parameter< const int >::type changbang(changbangSEXP);
    Rcpp::traits::input_parameter< const int >::type lizhibang(lizhibangSEXP);
    rcpp_result_gen = Rcpp::wrap(get_defen(paistr, baopai, libaopai, list, rankPoints, hongpai, rongpai, zhuangfeng, menfeng, lizhi, yifa, qianggang, lingshang, haidi, tianhu, changbang, lizhibang));
    return rcpp_result_gen;
END_RCPP
}
// get_xiangting
std::vector<int> get_xiangting(const std::vector<std::string>& shoupai);
RcppExport SEXP _shikakusphere_get_xiangting(SEXP shoupaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const std::vector<std::string>& >::type shoupai(shoupaiSEXP);
    rcpp_result_gen = Rcpp::wrap(get_xiangting(shoupai));
    return rcpp_result_gen;
END_RCPP
}
// get_tingpai
Rcpp::List get_tingpai(const std::vector<std::string>& shoupai);
RcppExport SEXP _shikakusphere_get_tingpai(SEXP shoupaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const std::vector<std::string>& >::type shoupai(shoupaiSEXP);
    rcpp_result_gen = Rcpp::wrap(get_tingpai(shoupai));
    return rcpp_result_gen;
END_RCPP
}
// random_zhuangfeng
std::vector<std::string> random_zhuangfeng(const int n, const int zhuangfeng, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_zhuangfeng(SEXP nSEXP, SEXP zhuangfengSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const int >::type zhuangfeng(zhuangfengSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_zhuangfeng(n, zhuangfeng, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_menfeng
std::vector<std::string> random_menfeng(const int n, const int menfeng, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_menfeng(SEXP nSEXP, SEXP menfengSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const int >::type menfeng(menfengSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_menfeng(n, menfeng, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_fanpai
std::vector<std::string> random_fanpai(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_fanpai(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_fanpai(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_pinghe
std::vector<std::string> random_pinghe(const int n, const int zhuangfeng, const int menfeng, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_pinghe(SEXP nSEXP, SEXP zhuangfengSEXP, SEXP menfengSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const int >::type zhuangfeng(zhuangfengSEXP);
    Rcpp::traits::input_parameter< const int >::type menfeng(menfengSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_pinghe(n, zhuangfeng, menfeng, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_duanyaojiu
std::vector<std::string> random_duanyaojiu(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_duanyaojiu(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_duanyaojiu(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_yibeikou
std::vector<std::string> random_yibeikou(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_yibeikou(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_yibeikou(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_sansetongshun
std::vector<std::string> random_sansetongshun(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_sansetongshun(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_sansetongshun(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_yiqitongguan
std::vector<std::string> random_yiqitongguan(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_yiqitongguan(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_yiqitongguan(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_hunquandaiyaojiu
std::vector<std::string> random_hunquandaiyaojiu(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_hunquandaiyaojiu(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_hunquandaiyaojiu(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_qiduizi
std::vector<std::string> random_qiduizi(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_qiduizi(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_qiduizi(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_duiduihu
std::vector<std::string> random_duiduihu(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_duiduihu(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_duiduihu(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_sananke
std::vector<std::string> random_sananke(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_sananke(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_sananke(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_sangangzi
std::vector<std::string> random_sangangzi(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_sangangzi(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_sangangzi(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_sansetongke
std::vector<std::string> random_sansetongke(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_sansetongke(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_sansetongke(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_hunlaotou
std::vector<std::string> random_hunlaotou(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_hunlaotou(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_hunlaotou(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_xiaosanyuan
std::vector<std::string> random_xiaosanyuan(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_xiaosanyuan(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_xiaosanyuan(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_hunyise
std::vector<std::string> random_hunyise(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_hunyise(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_hunyise(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_chunquandaiyaojiu
std::vector<std::string> random_chunquandaiyaojiu(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_chunquandaiyaojiu(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_chunquandaiyaojiu(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_erbeikou
std::vector<std::string> random_erbeikou(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_erbeikou(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_erbeikou(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_qingyise
std::vector<std::string> random_qingyise(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_qingyise(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_qingyise(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_guoshiwushuang
std::vector<std::string> random_guoshiwushuang(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_guoshiwushuang(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_guoshiwushuang(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_sianke
std::vector<std::string> random_sianke(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_sianke(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_sianke(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_dasanyuan
std::vector<std::string> random_dasanyuan(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_dasanyuan(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_dasanyuan(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_xiaosixi
std::vector<std::string> random_xiaosixi(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_xiaosixi(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_xiaosixi(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_dasixi
std::vector<std::string> random_dasixi(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_dasixi(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_dasixi(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_ziyise
std::vector<std::string> random_ziyise(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_ziyise(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_ziyise(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_lvyise
std::vector<std::string> random_lvyise(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_lvyise(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_lvyise(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_qinglaotou
std::vector<std::string> random_qinglaotou(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_qinglaotou(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_qinglaotou(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_sigangzi
std::vector<std::string> random_sigangzi(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_sigangzi(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_sigangzi(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}
// random_jiulianbaodeng
std::vector<std::string> random_jiulianbaodeng(const int n, const std::size_t seed, Rcpp::List list, Rcpp::NumericVector rankPoints, Rcpp::IntegerVector hongpai);
RcppExport SEXP _shikakusphere_random_jiulianbaodeng(SEXP nSEXP, SEXP seedSEXP, SEXP listSEXP, SEXP rankPointsSEXP, SEXP hongpaiSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const int >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< Rcpp::List >::type list(listSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type rankPoints(rankPointsSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type hongpai(hongpaiSEXP);
    rcpp_result_gen = Rcpp::wrap(random_jiulianbaodeng(n, seed, list, rankPoints, hongpai));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_shikakusphere_to_svg_string", (DL_FUNC) &_shikakusphere_to_svg_string, 1},
    {"_shikakusphere_get_defen", (DL_FUNC) &_shikakusphere_get_defen, 17},
    {"_shikakusphere_get_xiangting", (DL_FUNC) &_shikakusphere_get_xiangting, 1},
    {"_shikakusphere_get_tingpai", (DL_FUNC) &_shikakusphere_get_tingpai, 1},
    {"_shikakusphere_random_zhuangfeng", (DL_FUNC) &_shikakusphere_random_zhuangfeng, 6},
    {"_shikakusphere_random_menfeng", (DL_FUNC) &_shikakusphere_random_menfeng, 6},
    {"_shikakusphere_random_fanpai", (DL_FUNC) &_shikakusphere_random_fanpai, 5},
    {"_shikakusphere_random_pinghe", (DL_FUNC) &_shikakusphere_random_pinghe, 7},
    {"_shikakusphere_random_duanyaojiu", (DL_FUNC) &_shikakusphere_random_duanyaojiu, 5},
    {"_shikakusphere_random_yibeikou", (DL_FUNC) &_shikakusphere_random_yibeikou, 5},
    {"_shikakusphere_random_sansetongshun", (DL_FUNC) &_shikakusphere_random_sansetongshun, 5},
    {"_shikakusphere_random_yiqitongguan", (DL_FUNC) &_shikakusphere_random_yiqitongguan, 5},
    {"_shikakusphere_random_hunquandaiyaojiu", (DL_FUNC) &_shikakusphere_random_hunquandaiyaojiu, 5},
    {"_shikakusphere_random_qiduizi", (DL_FUNC) &_shikakusphere_random_qiduizi, 5},
    {"_shikakusphere_random_duiduihu", (DL_FUNC) &_shikakusphere_random_duiduihu, 5},
    {"_shikakusphere_random_sananke", (DL_FUNC) &_shikakusphere_random_sananke, 5},
    {"_shikakusphere_random_sangangzi", (DL_FUNC) &_shikakusphere_random_sangangzi, 5},
    {"_shikakusphere_random_sansetongke", (DL_FUNC) &_shikakusphere_random_sansetongke, 5},
    {"_shikakusphere_random_hunlaotou", (DL_FUNC) &_shikakusphere_random_hunlaotou, 5},
    {"_shikakusphere_random_xiaosanyuan", (DL_FUNC) &_shikakusphere_random_xiaosanyuan, 5},
    {"_shikakusphere_random_hunyise", (DL_FUNC) &_shikakusphere_random_hunyise, 5},
    {"_shikakusphere_random_chunquandaiyaojiu", (DL_FUNC) &_shikakusphere_random_chunquandaiyaojiu, 5},
    {"_shikakusphere_random_erbeikou", (DL_FUNC) &_shikakusphere_random_erbeikou, 5},
    {"_shikakusphere_random_qingyise", (DL_FUNC) &_shikakusphere_random_qingyise, 5},
    {"_shikakusphere_random_guoshiwushuang", (DL_FUNC) &_shikakusphere_random_guoshiwushuang, 5},
    {"_shikakusphere_random_sianke", (DL_FUNC) &_shikakusphere_random_sianke, 5},
    {"_shikakusphere_random_dasanyuan", (DL_FUNC) &_shikakusphere_random_dasanyuan, 5},
    {"_shikakusphere_random_xiaosixi", (DL_FUNC) &_shikakusphere_random_xiaosixi, 5},
    {"_shikakusphere_random_dasixi", (DL_FUNC) &_shikakusphere_random_dasixi, 5},
    {"_shikakusphere_random_ziyise", (DL_FUNC) &_shikakusphere_random_ziyise, 5},
    {"_shikakusphere_random_lvyise", (DL_FUNC) &_shikakusphere_random_lvyise, 5},
    {"_shikakusphere_random_qinglaotou", (DL_FUNC) &_shikakusphere_random_qinglaotou, 5},
    {"_shikakusphere_random_sigangzi", (DL_FUNC) &_shikakusphere_random_sigangzi, 5},
    {"_shikakusphere_random_jiulianbaodeng", (DL_FUNC) &_shikakusphere_random_jiulianbaodeng, 5},
    {NULL, NULL, 0}
};

RcppExport void R_init_shikakusphere(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
