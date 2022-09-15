module ApplicationHelper

    def gravator_for(user, options= { size: 80})
        email_adress = user.email.downcase
        hash = Digest::MD5.hexdigest(email_adress)
        size = options[:size]
        gravator_url = "https://www.gravator.com/avatar/#{hash}?s=#{size}"
        image_tag(gravator_url, alt: user.username, class: "rounded shadow mx-auto d-block")
    end
end
