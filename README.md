# Ruby on Rails Tutorial sample application

 
参考版见<git@bitbucket.org:railstutorial/sample_app_4th_ed.git>  
used name is  **sample_app**  
因为本版本在bitbucket为origin,所以github远程主版本改为github,提交时用命令  
`git push github master`  

This is the sample application for
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/). 
## License

All source code in the [Ruby on Rails Tutorial](http://railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

For more information, see the
[*Ruby on Rails Tutorial* book](http://www.railstutorial.org/book).

heroku 操作数据库  
```
heroku run cosole
User.all
e = User.find(5)
e.destroy
```
调试邮箱感言  
昨晚用本教程的调试,测到00:30,无果  
因为技术是复杂的  
今早用了一个早上,google搜索,[https://kelby.gitbooks.io/rails-beginner-s-guide/content/actionmailer/]  
调试方法:google, copy代码放置到响应的文件, !rails server重启!  
rails mail ,先用gem 'mail'在controler调通了126邮箱,成功一小步,  
后用Action Mailer 改善,根据报错,不断调试,终于他娘的OK了,12:24了,去吃饭了  
ps,报错host,通过google修改后仍然保持, !!rails server重启!!OK了  
git push heroku时报错,坑是production.rb里复制的时候多了个},经验:仔细看报错提示,可以提交后,测试时,注册后页面报错Application error,待以后验证

命令统计  
生成控制器(不生成测试)  
`rails generate controller PasswordResets new edit --no-test-framework`  
生成迁移字段  
`rails generate migration add_reset_to_users reset_digest:string`   `reset_sent_at:datetime`  
生成模型belongs_to :user  
`rails generate model Micropost content:text user:references`
  
`rails test:models`
