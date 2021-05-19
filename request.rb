require "net/http"
require "uri"
require "nokogiri"


# Get <a> class abutton is-success is-fullwidth
def request (url, tiktokURL)
    uri = URI.parse(url)

    # Shortcut
    response = Net::HTTP.post_form(uri, {"url" => tiktokURL, "per_page" => "50"})

    return response.body

end


def getUrls(string)
    response = Nokogiri::HTML(string)
    description = response.css("a").each {|nd| puts nd['href'] }
    return description
end


def urlsFromString(string)

    URI.extract(string, ['http', 'https'])[3]
end

def write(text)

    simpleFile = File.new("test.txt", "r+")
    if simpleFile
    data = simpleFile.syswrite(text)
    puts data
    else
    puts "Not able to access the file"
    end
end

def getArgs()

    return ARGV[0]
end
  
    
if __FILE__ == $0
    args = getArgs()
    response = request("https://snaptik.app/action.php", args.to_s)
    urls = getUrls(response)
    url = urlsFromString(urls.to_s)
    write(url)


end