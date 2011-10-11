require "mail_stats/engine"
require "mail_stats/base"
require "mail_stats/interceptors/interceptor_prototype"
require "mail_stats/interceptors/mail_stats_interceptor"
require "mail_stats/interceptors/mail_links_interceptor"
require "mail_stats/interceptors/mail_pixel_interceptor"

require "nokogiri"
require "base62"

ActionMailer::Base.register_interceptor(MailStats::MailStatsInterceptor)
