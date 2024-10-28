#include "tinyxml2.h"
#include "svg.h"

std::string shoupai_to_svg_with_scale(const Shoupai& shoupai,
                                      const double scale) {
  tinyxml2::XMLDocument doc;

  tinyxml2::XMLError eResult = doc.Parse(get_svg().c_str());
  if (eResult != tinyxml2::XML_SUCCESS) {
    throw std::runtime_error(doc.ErrorName());
  }
  tinyxml2::XMLElement* svgElement = doc.RootElement();

  int x = 0;
  int height = 830;

  const auto use = [&doc, svgElement, &x](const std::string& pai) {
    tinyxml2::XMLElement* p = doc.NewElement("use");
    if (pai.back() == '+') {
      p->SetAttribute("xlink:href",
                      ("#" + pai.substr(0, pai.size() - 1) + "r").c_str());
      p->SetAttribute("x", x - 800);
      p->SetAttribute("y", -550);
    } else {
      p->SetAttribute("xlink:href", ("#" + pai).c_str());
      p->SetAttribute("x", x);
      p->SetAttribute("y", 0);
      x += pai.back() == 'r' ? 800 : 550;
    }
    svgElement->InsertEndChild(p);
  };

  for (const auto s : {'m', 'p', 's', 'z'}) {
    const auto& bingpai = shoupai.bingpai(s);
    int n_hongpai = bingpai[0];
    for (std::size_t n = 1; n < bingpai.size(); n++) {
      int n_pai = bingpai[n];
      if (to_string(s, n) == shoupai.zimo_()) n_pai--;
      if (n == 5 && to_string(s, 0) == shoupai.zimo_()) {
        n_pai--;
        n_hongpai--;
      }
      for (int i = 0; i < n_pai; i++) {
        std::string pai(1, s);
        if (n == 5 && n_hongpai > 0) {
          pai += '0';
          n_hongpai--;
        } else
          pai += std::to_string(n);

        use(pai);
      }
    }
  }

  if (!shoupai.zimo_().empty() && shoupai.zimo_().size() <= 2) {
    x += 100;
    use(shoupai.zimo_());
  }

  for (auto itr = shoupai.fulou_().rbegin(); itr != shoupai.fulou_().rend();
       ++itr) {
    x += 100;

    const auto& m = *itr;
    const auto s = m[0];
    const auto m_ = std::regex_replace(m, re_ling(), "5");
    // 暗槓
    if (std::regex_match(m_, re_angang())) {
      use("_");
      use(m.substr(0, 1) + m[3]);
      use(m.substr(0, 1) + m[4]);
      use("_");
    }
    // ポン、明槓
    else if (std::regex_match(m_, re_peng_gang())) {
      const auto jiagang = std::regex_search(m, re_jiagang());
      std::smatch match;
      std::regex_search(m, match, re_menqian());
      const auto d = match.str()[0];
      std::vector<std::string> pai;
      for (std::sregex_iterator it(m.begin(), m.end(), re_digit()), end;
           it != end; ++it) {
        pai.emplace_back(s + it->str());
      }
      std::vector<std::string> pai_r;
      if (jiagang) {
        // 加槓
        pai_r.emplace_back(pai[2] + 'r');
        pai_r.emplace_back(pai[3] + "+");
        height = 580 * 2 - 30;
      } else
        pai_r.emplace_back(pai.back() + 'r');
      std::vector<std::string> pai_l;
      if (!jiagang && pai.size() == 4) {
        pai_l.emplace_back(pai[1]);
        pai_l.emplace_back(pai[2]);
      } else
        pai_l.emplace_back(pai[1]);
      if (d == '+') {
        use(pai[0]);
        for (const auto& p : pai_l) use(p);
        for (const auto& p : pai_r) use(p);
      } else if (d == '=') {
        use(pai[0]);
        for (const auto& p : pai_r) use(p);
        for (const auto& p : pai_l) use(p);
      } else if (d == '-') {
        for (const auto& p : pai_r) use(p);
        use(pai[0]);
        for (const auto& p : pai_l) use(p);
      }
    }
    // チー
    else {
      std::smatch match;
      std::regex_search(m, match, re_chi1());
      use(s + match.str() + 'r');
      for (std::sregex_iterator it(m.begin(), m.end(), re_chi2()), end; it != end;
           ++it) {
        use(s + it->str());
      }
    }
  }

  x += 30;

  svgElement->SetAttribute("width", std::to_string(x / 10.0 * scale).c_str());
  svgElement->SetAttribute("height",
                           std::to_string(height / 10.0 * scale).c_str());
  svgElement->SetAttribute(
      "viewBox", ("0 " + std::to_string(-height) + " " + std::to_string(x) +
                  " " + std::to_string(height))
                     .c_str());
  doc.InsertEndChild(svgElement);

  tinyxml2::XMLPrinter printer(0, true);
  doc.Accept(&printer);

  return std::string{printer.CStr()};
}

std::string shoupai_to_svg(const Shoupai& shoupai) {
  return shoupai_to_svg_with_scale(shoupai, 0.6);
}
