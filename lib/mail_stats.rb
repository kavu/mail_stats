require "nokogiri"
require "base62"

require "mail_stats/engine"
require "mail_stats/base"
require "mail_stats/interceptors/interceptor_prototype"
require "mail_stats/interceptors/mail_stats_interceptor"

ActionMailer::Base.register_interceptor(MailStats::MailStatsInterceptor)
