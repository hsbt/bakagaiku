* セットアップ

 cp config/database.example.yml config/database.yml

 環境に合わせて config/database.yml を設定する。

 mysql> create database bakagaiku_development
 mysql> create database bakagaiku_test

 rake migrate
 rake (test を実行する場合)
 ruby script/server


* 本家サイトよりデータを取得

 ruby cron.rb

 例） crontab -e

   0 * * * * $HOME/ruby/bin/ruby $HOME/bakagaiku/cron.rb >> $HOME/pockets/log/cron.log
