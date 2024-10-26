#pragma once

#include "shoupai.h"

#include <tuple>
#include <array>

int xiangting_yiban(const Shoupai& shoupai, const Calsht& calsht);
int xiangting_guoshi(const Shoupai& shoupai, const Calsht& calsht);
int xiangting_qidui(const Shoupai& shoupai, const Calsht& calsht);
int xiangting(const Shoupai& shoupai, const Calsht& calsht);
std::vector<std::string> tingpai(
    const Shoupai& shoupai, const Calsht& calsht,
    const std::function<int(const Shoupai&, const Calsht& calsht)>& f_xiangting);
