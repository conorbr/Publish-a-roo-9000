Shoes.app(title: "Publish-a-roo 9000", width: 280) do
  stack(margin: 40) do
    @locale = para " ", hidden: true
    @bids = para " ", hidden: true
    @destination = para " ", hidden: true

    para "Enter Locale:"
    @input_1 = edit_line do |a|
      @locale.text = @input_1.text
    end

    flow do
      @multi_locale = radio
      para "multiple locales"
    end
     para "Enter BIDs"
     @input_2 = edit_box do |b|
      @bids.text = @input_2.text
    end

     para "Choose a destination:"
    @input_3 = list_box items: ["global settings", "market data", "bundle data", "assets", "product storytelling", "pdp storytelling", "pdp history", "pdp history" , "broadcast tempalte", "preview", "publishing", "notes" ] do |c|
      where_to = @input_3.text
      case where_to
      when "global settings"
        @destination.text = "global"
      when "market data"
        @destination.text = "market"
      when "bundle data"
        @destination.text = "bundle"
      when "assets"
        @destination.text = "assets"
      when "product storytelling"
        @destination.text = "details"
      when "pdp storytelling"
        @destination.text = "storytelling"
      when "pdp history"
        @destination.text = "history"
      when "broadcast tempalte"
        @destination.text = "broadcasting"
      when "preview"
        @destination.text = "preview"
      when "publishing"
        @destination.text = "publish"
      when "notes"
        @destination.text = "notes"
      else
        @destination.text = "storytelling"
      end
    end

    @button = button("open link", margin: 40) do
      if @multi_locale.checked?
        locales = @locale.text.split(" ")
        locales.each do |locale|
          bid = @bids.text.to_s
          destination = @destination.text.to_s
        #system("start https://www.microsoft.com/#{locale}/#{bid}/b/#{destination}")
        system("start https://sftools.trafficmanager.net/store/#{locale}/products/#{bid}/#{destination}")
          end
      else
      bids = @bids.text.split(" ")
      bids.each do |bid|
        locale = @locale.text.to_s
        destination = @destination.text.to_s
      #system("start https://www.microsoft.com/#{locale}/#{bid}/b/#{destination}")
      system("start https://sftools.trafficmanager.net/store/#{locale}/products/#{bid}/#{destination}")
        end
      end
    end
  end
end
