source "https://supermarket.chef.io"

Dir.glob('/home/ubuntu/cookbooks/*').each do |path|
    cookbook File.basename(path), :path => path
end

