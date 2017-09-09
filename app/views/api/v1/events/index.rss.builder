#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss("version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/") do
  xml.channel do
    xml.title "techplay"
    xml.description "techplay events"
    xml.link "https://techplay.jp/event/search?keyword=&pref=13&from="
    @events.each do |event|
      xml.item do
        xml.title event[:title]
        xml.link event[:link]
        #xml.description do
        #  xml.cdata! HTML_Truncator.truncate(event.to_html, 1).html_safe
        #end
      end
    end
  end
end
