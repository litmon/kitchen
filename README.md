# itamaeを使ってnginx + PHPな環境を作る

itamaeを使ってnginxとPHPをインストールしてみます。

## 環境

以下の環境に対して行っています。

* ruby 2.1.1
* itamae 1.2.19
* serverspec 2.17.0
* CentOS 7

## 要件

* nginx
  * document root: /var/www/
* php 5.5
* ruby ~> 2.0

## Usage

### before

なにはともあれgemのinstall

```
$ bundle install
```

### itamae

```
$ bundle exec itamae ssh --host 192.168.56.101 --user root recipe.rb
```

ね、簡単でしょう？
分かりやすいようにオプションはあえて短くしてません。

(デバッグ用) オプションたくさんバージョン+dry-runで環境を汚さない仕様

```
$ bundle exec itamae ssh --host 192.168.56.101 --user root --dry-run --port 22 -l debug recipe.rb
```

### serverspec

~/.ssh/configに設定書いておくと、自動的に読んでくれるみたい。
なので、以下のように書いてます。

(例) ~/.ssh/config

```
Host 192.168.56.101
  HostName 192.168.56.101
  Port 22
  User root
  IdentityFile ~/.ssh/id_rsa.pub
```

serverspecを起動するときはrakeから。

```
$ bundle exec rake
```

# 参考

[Github repository](https://github.com/itamae-kitchen/itamae)

[Itamae - Infra as Code 現状確認会](https://speakerdeck.com/ryotarai/itamae-infra-as-code-xian-zhuang-que-ren-hui)

[Itamaeチートシート](http://qiita.com/fukuiretu/items/170aa956731f2ffb5715)

[itamae-kitchen/itamae wiki](https://github.com/itamae-kitchen/itamae/wiki)

[クックパッドのサーバープロビジョニング事情](http://techlife.cookpad.com/entry/2015/05/12/080000)
