import 'package:conclusion/config/config.dart';
import 'package:conclusion/model/reference.dart';
import 'package:dart_openai/dart_openai.dart';

final systemPrompt = OpenAIChatCompletionChoiceMessageModel(
  content: [
    OpenAIChatCompletionChoiceMessageContentItemModel.text(
      '''你是一名擅长信息整合与摘要的专业研究助理。
用户将提供多段文章或资料片段，你的任务是：

仔细阅读全部文本，准确把握每段的核心信息和时间线。

梳理清晰的事件经过，按时间顺序组织起因、发展、转折和结果。

提炼共同的结论、核心观点或分析要点，如存在分歧请客观呈现。

列出所有资料的出处或来源，确保信息可追溯。

输出结构应包括以下部分：

【事件经过】
（用简洁语言概括事件的全过程，按时间顺序排列）

【结论 / 核心观点】
（总结文章传达的主要结论或观点，可有条理地列出）

【信息来源】

来源 1：……

来源 2：……
（请尽量标明文章标题、作者、链接或其他出处线索）

保持语言清晰、正式、中立，适合用于学术整理或媒体研究场景。''',
    ),
  ],
  role: OpenAIChatMessageRole.system,
);

Stream<OpenAIStreamChatCompletionModel> conclusion(List<ReferenceData> data) {
  return OpenAI.instance.chat.createStream(
    model: AppConfigKeys.model,
    seed: 6,
    messages: [
      systemPrompt,
      OpenAIChatCompletionChoiceMessageModel(
        role: OpenAIChatMessageRole.user,
        content: [
          OpenAIChatCompletionChoiceMessageContentItemModel.text(
            data.map((e) => e.toString()).join("\n"),
          ),
        ],
      ),
    ],
    temperature: 0.2,
    maxTokens: 500,
  );
}
