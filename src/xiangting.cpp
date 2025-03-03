﻿#include "xiangting.h"

#include <climits>

namespace cmajiang {

std::vector<int> shoupai_to_table(const Shoupai& shoupai) {
  auto& m = shoupai.bingpai('m');
  auto& p = shoupai.bingpai('p');
  auto& s = shoupai.bingpai('s');
  auto& z = shoupai.bingpai('z');
  // NOTE: m5, p5, s5の枚数にはhongpaiも含まれているので、足さなくてよい
  std::vector<int> ret;
  ret.reserve(m.size() + p.size() + s.size() + z.size() - 4);
  std::copy(m.begin() + 1, m.end(), std::back_inserter(ret));
  std::copy(p.begin() + 1, p.end(), std::back_inserter(ret));
  std::copy(s.begin() + 1, s.end(), std::back_inserter(ret));
  std::copy(z.begin() + 1, z.end(), std::back_inserter(ret));
  return ret;
}

// 一般形
int xiangting_yiban(const Shoupai& shoupai, const Calsht& calsht) {
  const std::vector<int> hand = shoupai_to_table(shoupai);
  auto [sht, mode] =
      calsht(hand, std::accumulate(hand.begin(), hand.end(), 0) / 3, 1);
  return sht;
}

// 国士無双形
int xiangting_guoshi(const Shoupai& shoupai, const Calsht& calsht) {
  if (shoupai.fulou_().size()) return INT_MAX;
  const std::vector<int> hand = shoupai_to_table(shoupai);
  auto [sht, mode] =
      calsht(hand, std::accumulate(hand.begin(), hand.end(), 0) / 3, 4);
  return sht;
}

// 七対子形
int xiangting_qidui(const Shoupai& shoupai, const Calsht& calsht) {
  if (shoupai.fulou_().size()) return INT_MAX;
  const std::vector<int> hand = shoupai_to_table(shoupai);
  auto [sht, mode] =
      calsht(hand, std::accumulate(hand.begin(), hand.end(), 0) / 3, 2);
  return sht;
}

// 実際のシャンテン数(一般形、国士無双形、七対子形の最小値)
std::pair<int, int> xiangting(const Shoupai& shoupai, const Calsht& calsht) {
  const std::vector<int> hand = shoupai_to_table(shoupai);
  auto [sht, mode] =
      calsht(hand, std::accumulate(hand.begin(), hand.end(), 0) / 3, 7);
  // 副露直後（手牌の末尾に","が付く）なら1を足す
  // NOTE: 副露の記法が省略されると`toString()`したとき無視されるため、意図した文字列にならない
  if (std::regex_search(shoupai.toString(), std::regex(",$"))) {
    sht++;
  }
  return std::pair<int, int>{sht, mode};
}

// 听牌(向聴数が減る牌)
std::vector<std::string> tingpai(
    const Shoupai& shoupai, const Calsht& calsht,
    const std::function<std::pair<int, int>(const Shoupai&, const Calsht& calsht)>& f_xiangting) {
  if (!shoupai.zimo_().empty()) throw std::runtime_error("zimo must be empty");

  const auto [n_xiangting, _] = f_xiangting(shoupai, calsht);
  Shoupai shoupai_ = shoupai.clone();

  std::vector<std::string> pai;
  for (const auto s : {'m', 'p', 's', 'z'}) {
    auto& bingpai = shoupai_._bingpai(s);
    for (std::size_t n = 1; n < bingpai.size(); n++) {
      if (bingpai[n] >= 4) continue;
      bingpai[n]++;
      const auto [sht, _] = f_xiangting(shoupai_, calsht);
      if (sht < n_xiangting) {
        pai.emplace_back(to_string(s, n));
      }
      bingpai[n]--;
    }
  }
  return pai;
}

}  // namespace cmajiang
