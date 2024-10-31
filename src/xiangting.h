#pragma once

#include "shoupai.h"

#include <tuple>
#include <array>

namespace cmajiang {

int xiangting_yiban(const Shoupai& shoupai, const Calsht& calsht);
int xiangting_guoshi(const Shoupai& shoupai, const Calsht& calsht);
int xiangting_qidui(const Shoupai& shoupai, const Calsht& calsht);
std::pair<int, int> xiangting(const Shoupai& shoupai, const Calsht& calsht);
std::vector<std::string> tingpai(
    const Shoupai& shoupai, const Calsht& calsht,
    const std::function<int(const Shoupai&, const Calsht& calsht)>& f_xiangting);

inline std::vector<int> shoupai_to_table(const Shoupai& shoupai) {
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

}  // namespace cmajiang
