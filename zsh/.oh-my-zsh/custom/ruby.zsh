eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

alias b='bundle'
alias bi='bundle install'
alias bu='bundle update'
alias be='bundle exec'
alias bo='bundle open'
alias bs='bundle show'
alias bake='bundle exec rake'
alias bspec='bundle exec rspec'
alias bspecs='bundle exec rspec spec'
alias raps='rake parallel:spec'
alias rapp='rake parallel:prepare'
alias radm='rake db:migrate'
alias radt='rake db:migrate db:test:prepare'
alias r='bundle exec rails'
alias z='zeus'
alias zake='zeus rake'
alias zspec='zeus rspec'
alias zs='zeus start'
alias zr='zeus rspec'
alias zc='zeus console'
alias mm='middleman'

last-migration() {
  ls db/migrate | sort -nk 1.1,1.14 | tail -n 1 | xargs -o -I migration $EDITOR db/migrate/migration
}
