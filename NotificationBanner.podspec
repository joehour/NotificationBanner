Pod::Spec.new do |s|
s.name = "NotificationBanner"
s.version = "1.0.4"
s.license = "MIT"
s.summary = "A foreground notification banner library, easy to use and customizable."
s.homepage = "https://github.com/joehour/NotificationBanner"
s.authors = { "joe" => "joemail168@gmail.com" }
s.source = { :git => "https://github.com/joehour/NotificationBanner.git", :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = "8.0"
s.source_files = "NotificationBanner/*.{swift}"
s.resources = "NotificationBanner/*.{png}"
end
