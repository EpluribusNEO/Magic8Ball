# coding: UTF-8
require 'telegram/bot'
# 102
TOKEN = '' # <<--<<--<<--<<--<<--<<--<<--<<--<<--<<--<< Добавить токен бота

ANSWERS = [
  #Положительные
  "Бесспорно",
  "Предрешено",
  "Никаких сомнений",
  "Определённо да",
  "Можешь быть уверен в этом",
  #Нерешительно положительные
  "Мне кажется - «да»",
  "Вероятнее всего",
  "Хорошие перспективы",
  "Знаки говорят - «да»",
  "Да",
  #Нейтральные
  "Пока не ясно, попробуй снова",
  "Спроси позже",
  "Лучше не рассказывать",
  "Сейчас нельзя предсказать",
  "Сконцентрируйся и спроси опять",
  #Отрицательные
  "Даже не думай",
  "Мой ответ - «нет»",
  "По моим данным - «нет»",
  "Перспективы не очень хорошие",
  "Весьма сомнительно"
]

#запускаем бота
Telegram::Bot::Client.run(TOKEN) do |bot|
  #метод заставляет перейти бота в режим прослушивания сообщений
  bot.listen do |message|
    case message.text
    when '/start', '/start start'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Здравствуй, #{message.from.first_name}"
      )
    when '/whoami'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "#{message.from.first_name}"
      )
    when '/whoau'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Неужто не ясно? Я бот - программа такая, задавай свои дурацкие вопросы, а я буду отвечать!"
      )
    when '/about'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Created by Hikaru (aka EPluribusNEO)\n30 August 2018"
      )
    when '/help'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Всё просто. Задавай вопросы на \"да\" или \"нет\" и получишь ответ.
                \nСистемные команды:\n/start - для старта. \n/whoami - вывести имя пользователя.
                \n/help - помощь.\n/about - о программе.\n/rand или /random - сгенерировать случайное число.
                \n/coin - подбросить монетку.
                \n/version или /v - версия."
      )
    when '/rand', '/random'
      rnd = Random.rand(1001)
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "#{rnd}"
      )
    when '/coin'
      rnd = Random.rand(1001)
      msg = "Ребро"
      if(rnd%2 == 0)
        msg = "Орёл"
      else
        msg ="Решка"
      end
      bot.api.send_message(
        chat_id: message.chat.id,
        text: msg
      )

    when '/version', '/v', '/-v', '/-version'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "v1.0.1; 09_sep_2018"
      )

    else
      bot.api.send_message(
        chat_id: message.chat.id,
        text: ANSWERS.sample
      )
    end
  end
end

