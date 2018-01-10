class BlogMailer < ApplicationMailer
    def blog_mail(blog)
     @blog = blog
     mail to: "sgrkmy0824", subject: "お問い合わせの確認メール"
    end
end
