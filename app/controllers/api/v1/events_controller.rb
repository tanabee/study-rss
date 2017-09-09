class Api::V1::EventsController < ApplicationController
  def index
    agent = Mechanize.new
    page = agent.get("https://techplay.jp/event/search?keyword=&pref=13&from=")
    event_list = page.search('.eventlist .title h3 a')

    @events = event_list.map do |event|
      {
        title: event.inner_text,
        link: event['href']
      }
    end

    respond_to do |format|
      format.rss { render layout: false }
    end
  end
end
