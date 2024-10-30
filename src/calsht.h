#ifndef CALSHT_HPP
#define CALSHT_HPP

#define R_NO_REMAP
#define STRICT_R_HEADERS

#include <Rcpp.h>

#include <cstdint>
// #include <filesystem>
#include <tuple>
#include <vector>

class Calsht {
private:
  using LVec = Rcpp::IntegerVector; // std::vector<int32_t>;
  using RVec = Rcpp::IntegerVector; // std::vector<int8_t>;
  using Iter = std::vector<RVec>::iterator;

  Rcpp::IntegerMatrix mp1; // std::vector<RVec> mp1;
  Rcpp::IntegerMatrix mp2; // std::vector<RVec> mp2;

#ifdef THREE_PLAYER
  RVec index1(int n) const;
#endif
  void add1(LVec& lhs, const RVec& rhs, int m) const;
  void add2(LVec& lhs, const RVec& rhs, int m) const;
  // Iter read_file(Iter first, Iter last, std::filesystem::path file) const;

public:
  Calsht(const Rcpp::IntegerMatrix& index_s, const Rcpp::IntegerMatrix index_h) : mp1(index_s), mp2(index_h) {}
  Calsht(Rcpp::IntegerMatrix&& index_s, Rcpp::IntegerMatrix&& index_h) : mp1(index_s), mp2(index_h) {}
  int calc_lh(const int* t, int m) const;
  int calc_sp(const int* t) const;
  int calc_to(const int* t) const;
  std::tuple<int, int> operator()(const std::vector<int>& t, int m, int mode) const;
};

#endif
