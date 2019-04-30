eval "$(rbenv init -)"

alias b='bundle'
alias bu='bundle update'
alias be='bundle exec'
alias bo='bundle open'
alias bs='bundle show'
alias bake='bundle exec rake'
spec() {
  if [ -z "$1" ]; then
    spec='spec' # run the spec directory
  else
    spec="$1"
  fi
  bundle exec rspec $spec
}
alias r='bundle exec rails'
alias rac='bundle exec rails console'
alias rag='bundle exec rails generate'
alias ras='bundle exec rails server'
alias ram='bundle exec rails db:migrate'
alias rads='bundle exec rails db:setup'
alias radl='bundle exec rails db:schema:load'
alias radc='bundle exec rails db:create'
alias radd='DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:drop'
alias radt='bundle exec rails db:test:prepare'
alias raps='rake parallel:spec'
alias rapp='rake parallel:prepare'
alias fors='bundle exec foreman start'
alias mm='bundle exec middleman'

last-migration() {
  ls db/migrate | sort -nk 1.1,1.14 | tail -n 1 | xargs -o -I migration $EDITOR db/migrate/migration
}
