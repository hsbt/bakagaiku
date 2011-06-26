xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "バカが征く on Rails"
    xml.description "バカが征く on Rails"
    xml.link entry_index_path

    @entries.each do |entry|
      xml.item do
        xml.title entry.bakaid
        xml.description "<pre>#{entry.text}</pre>"
        xml.pubDate entry.updated_at.to_s(:rfc822)
        xml.link entry_path(entry.bakaid)
        xml.guid entry_path(entry.bakaid)
      end
    end
  end
end
