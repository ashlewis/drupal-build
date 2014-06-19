;build-s8080.make

core = 7.x
api = 2
projects[drupal][version] = "7.28"
projects[s8080][type] = "profile"
projects[s8080][download][type] = "git"
projects[s8080][download][url] = "https://github.com/ashlewis/s8080.git"
;projects[s8080][download][branch] = "master"
projects[s8080][download][tag] = "v0.0.3"