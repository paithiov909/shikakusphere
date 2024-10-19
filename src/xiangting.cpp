#include "xiangting.h"

#include <climits>

static const std::vector<int> zipai_n = { 1, 2, 3, 4, 5, 6, 7 };
static const std::vector<int> yaojiu_n = { 1, 9 };

int count_quadruplet(const Shoupai& shoupai) {
    const auto m = shoupai.m();
    const auto p = shoupai.p();
    const auto s = shoupai.s();
    const auto z = shoupai.z();
    return (
       std::count(m.begin(), m.end(), 4) +
       std::count(p.begin(), p.end(), 4) +
       std::count(s.begin(), s.end(), 4) +
       std::count(z.begin(), z.end(), 4)
    );
}

// 面子数、搭子数、孤立牌数からシャンテン数を計算する
int count_xiangting(int m, int d, int g, const bool j) {
    const auto n = j ? 4 : 5;
    if (m > 4) { d += m - 4; m = 4; }
    if (m + d > 4) { g += m + d - 4; d = 4 - m; }
    if (m + d + g > n) { g = n - m - d; }
    if (j) d++;
    return 13 - m * 3 - d * 2 - g;
}

// 搭子
std::tuple<std::array<int, 3>, std::array<int, 3>> dazi(const std::vector<int>& bingpai) {

    int n_pai = 0, n_dazi = 0, n_guli = 0;

    for (int n = 1; n <= 9; n++) {
        n_pai += bingpai[n];
        if (n <= 7 && bingpai[n + 1] == 0 && bingpai[n + 2] == 0) {
            n_dazi += n_pai >> 1;
            n_guli += n_pai % 2;
            n_pai = 0;
        }
    }
    n_dazi += n_pai >> 1;
    n_guli += n_pai % 2;

    return {
        {0, n_dazi, n_guli},
        {0, n_dazi, n_guli}
    };
}

// 面子
std::tuple<std::array<int, 3>, std::array<int, 3>> mianzi(std::vector<int> bingpai, const int n) {

    if (n > 9) return dazi(bingpai);

    auto [max_a, max_b] = mianzi(bingpai, n + 1);

    if (n <= 7 && bingpai[n] > 0 && bingpai[n + 1] > 0 && bingpai[n + 2] > 0) {
        bingpai[n]--; bingpai[n + 1]--; bingpai[n + 2]--;
        auto [a, b] = mianzi(bingpai, n);
        bingpai[n]++; bingpai[n + 1]++; bingpai[n + 2]++;
        a[0]++; b[0]++;
        if (a[2] < max_a[2]
            || (a[2] == max_a[2] && a[1] < max_a[1])) max_a = a;
        if (b[0] > max_b[0]
            || (b[0] == max_b[0] && b[1] > max_b[1])) max_b = b;
    }

    if (bingpai[n] >= 3) {
        bingpai[n] -= 3;
        auto [a, b] = mianzi(bingpai, n);
        bingpai[n] += 3;
        a[0]++; b[0]++;
        if (a[2] < max_a[2]
            || (a[2] == max_a[2] && a[1] < max_a[1])) max_a = a;
        if (b[0] > max_b[0]
            || (b[0] == max_b[0] && b[1] > max_b[1])) max_b = b;
    }

    return { max_a, max_b };
}

// 萬子、筒子、索子、字牌すべての組み合わせでシャンテン数を計算する
int mianzi_all(const Shoupai& shoupai, const bool jiangpai) {

    auto [m_a, m_b] = mianzi(shoupai.m());
    auto [p_a, p_b] = mianzi(shoupai.p());
    auto [s_a, s_b] = mianzi(shoupai.s());

    int z[] = {0, 0, 0};
    for (int n = 1; n <= 7; n++) {
        if (shoupai.z_(n) >= 3) z[0]++;
        else if (shoupai.z_(n) == 2) z[1]++;
        else if (shoupai.z_(n) == 1) z[2]++;
    }

    const int n_fulou = (int)shoupai.fulou_().size();

    int min = 13;

    for (auto& m : { m_a, m_b }) {
        for (auto& p : { p_a, p_b }) {
            for (auto& s : { s_a, s_b }) {
                int x[] = {n_fulou, 0, 0};
                for (int i = 0; i < 3; i++) {
                    x[i] += m[i] + p[i] + s[i] + z[i];
                }
                int n_xiangting = count_xiangting(x[0], x[1], x[2], jiangpai);
                if (n_xiangting < min) min = n_xiangting;
            }
        }
    }

    return min;
}

// 一般形
int xiangting_yiban(const Shoupai& shoupai) {
    auto shoupai_ = shoupai;
    int min = mianzi_all(shoupai_, false);

    for (auto s : { 'm', 'p', 's', 'z' }) {
        auto& bingpai = shoupai_._bingpai(s);
        for (int n = 1; n < bingpai.size(); n++) {
            if (bingpai[n] >= 2) {
                bingpai[n] -= 2;
                int n_xiangting = mianzi_all(shoupai_, (bingpai[n] != 2));
                bingpai[n] += 2;
                if (n_xiangting < min) min = n_xiangting;
            } else {
                continue;
            }
        }
    }
    if (min == -1 && !shoupai_.zimo_().empty() && shoupai_.zimo_().size() > 2) {
        min++;
    }
    return min;
}

// 国士無双形
int xiangting_guoshi(const Shoupai& shoupai) {
    if (shoupai.fulou_().size()) return INT_MAX;

    int n_yaojiu = 0;
    int n_duizi = 0;

    for (const auto s : { 'm', 'p', 's', 'z' }) {
        const auto& bingpai = shoupai.bingpai(s);
        for (const auto n : (s == 'z') ? zipai_n : yaojiu_n) {
            if (bingpai[n] >= 1) n_yaojiu++;
            if (bingpai[n] >= 2) n_duizi++;
        }
    }

    return n_duizi ? 12 - n_yaojiu : 13 - n_yaojiu;
}

// 七対子形
int xiangting_qidui(const Shoupai& shoupai) {

    if (shoupai.fulou_().size()) return INT_MAX;

    int n_duizi = 0;
    int n_guli = 0;

    for (const auto s : { 'm', 'p', 's', 'z' }) {
        const auto& bingpai = shoupai.bingpai(s);
        for (int n = 1; n < bingpai.size(); n++) {
            if (bingpai[n] >= 2) n_duizi++;
            else if (bingpai[n] == 1) n_guli++;
        }
    }

    if (n_duizi > 7) n_duizi = 7;
    if (n_duizi + n_guli > 7) n_guli = 7 - n_duizi;

    return 13 - n_duizi * 2 - n_guli;
}

// 実際のシャンテン数(一般形、国士無双形、七対子形の最小値)
int xiangting(const Shoupai& shoupai) {
    int min_yiban = xiangting_yiban(shoupai);
    // FIXME: これであっているのかわからない
    if (count_quadruplet(shoupai) > 2) {
        Shoupai tmp = shoupai.clone();
        auto tp = !shoupai.zimo_().empty()
            ? tingpai(tmp.dapai(shoupai.zimo_()), xiangting_yiban)
            : tingpai(tmp, xiangting_yiban);
        if (tp.empty()) min_yiban++;
    }
    return std::min({min_yiban,
        xiangting_guoshi(shoupai),
        xiangting_qidui(shoupai)
    });
}

// 听牌(向聴数が減る牌)
std::vector<std::string> tingpai(const Shoupai& shoupai, const std::function<int(const Shoupai&)>& f_xiangting) {
    if (!shoupai.zimo_().empty()) throw std::runtime_error("zimo must be empty");

    auto shoupai_ = shoupai;
    std::vector<std::string> pai;
    const int n_xiangting = f_xiangting(shoupai_);
    for (const auto s : { 'm', 'p', 's', 'z' }) {
        auto& bingpai = shoupai_._bingpai(s);
        for (int n = 1; n < bingpai.size(); n++) {
            if (bingpai[n] >= 4) continue;
            bingpai[n]++;
            if (f_xiangting(shoupai_) < n_xiangting) pai.emplace_back(to_string(s, n));
            bingpai[n]--;
        }
    }
    return pai;
}
