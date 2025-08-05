import 'package:conclusion/llm.dart';
import 'package:conclusion/model/reference.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: "Search...",
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
              ),
              onSubmitted: (value) {
                var stream = conclusion([
                  ReferenceData(
                    title: "你把梦想交给AdventureX，他们却转手卖了9万块",
                    url: "https://news.qq.com/rain/a/20250726A00JBV00",
                    body:
                        "4 天之前 · 这种行为在圈子里屡见不鲜，但AdventureX是我见过第一个，敢把“出卖用户隐私”这件事公开拿出来，甚至在采访里当作“商业化成果”洋洋自得地写进稿子里的组织。 这种对法律的蔑视和对参与者的背叛，令人不寒而栗。 如果说公",
                  ),
                  ReferenceData(
                    title: "前成员指控黑客松 AdventureX 非法出售选手信息",
                    url: "https://kongyu.xin/archives/27064",
                    body: '''前成员指控黑客松 AdventureX 非法出售选手信息

近日，一场名为 AdventureX 的黑客马拉松活动陷入争议。据其前组织成员 Max 公开发文指控，该活动组织方将含有选手简历、联系方式等个人信息的“梦想家数据库”，打包出售给赞助商以实现商业化。

该指控文章详述，AdventureX 的行为涉嫌多项违法，包括未获“单独同意”处理敏感信息、非法跨境提供个人数据等，可能违反了《个人信息保护法》。此外，文章还提及活动创始人存在个人品行问题，并呼吁组织方公开财务账目，回应外界质疑。''',
                  ),
                ]);
                var local = "";
                stream.listen((event) {
                  local += (event.choices.first.delta.content?.first?.text)
                      .toString();
                }, onDone: () => print(local));
              },
            ),
          ],
        ),
      ),
    );
  }
}
