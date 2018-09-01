# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180901131717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bets", force: :cascade do |t|
    t.string "bettype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "fixture_id"
    t.integer "result"
    t.integer "homescore"
    t.integer "awayscore"
    t.index ["fixture_id", "user_id"], name: "index_bets_on_fixture_id_and_user_id", unique: true
  end

  create_table "fixtures", force: :cascade do |t|
    t.text "fixturenotes"
    t.string "hometeam"
    t.string "awayteam"
    t.integer "result"
    t.integer "homescore"
    t.integer "awayscore"
    t.datetime "due"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "leaderboards", force: :cascade do |t|
    t.string "username"
    t.string "point"
    t.string "match"
    t.datetime "due"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "timestamps"
    t.string "password_digest"
    t.string "usertype"
    t.string "useradmin"
    t.boolean "adminflag", default: false
  end


  create_view "otherbets",  sql_definition: <<-SQL
      SELECT users.username,
      fixtures.description,
      bets.bettype,
      bets.result,
      bets.homescore,
      bets.awayscore,
      fixtures.due
     FROM ((bets
       JOIN users ON ((bets.user_id = users.id)))
       JOIN fixtures ON ((fixtures.id = bets.fixture_id)))
    WHERE (fixtures.due < ("left"(((CURRENT_TIMESTAMP)::character varying)::text, 19))::timestamp without time zone)
    ORDER BY fixtures.due DESC
   LIMIT 82;
  SQL

  create_view "tabelas",  sql_definition: <<-SQL
      WITH cte(usercode, betuser, matchname, bettype, bettedresult, bettedhomesocre, bettedawayscore, matchresult, homescore, awayscore, points) AS (
           SELECT users.id AS usercode,
              users.username AS betuser,
              fixtures.description AS matchname,
              bets.bettype,
              bets.result AS bettedresult,
              bets.homescore AS bettedhomesocre,
              bets.awayscore AS bettedawayscore,
              fixtures.result AS matchresult,
              fixtures.homescore,
              fixtures.awayscore,
                  CASE
                      WHEN (((bets.bettype)::text = 'Score'::text) AND ((bets.bettype)::text <> 'Result'::text) AND (bets.homescore = fixtures.homescore) AND (bets.awayscore = fixtures.awayscore)) THEN 5
                      WHEN (((bets.bettype)::text = 'Result'::text) AND ((bets.bettype)::text <> 'Score'::text) AND (bets.result = fixtures.result)) THEN 2
                      ELSE 0
                  END AS points
             FROM ((bets
               JOIN users ON ((users.id = bets.user_id)))
               JOIN fixtures ON ((fixtures.id = bets.fixture_id)))
          ), cte2 AS (
           SELECT cte.betuser,
                  CASE
                      WHEN ((cte.betuser)::text = ANY ((ARRAY['n.ceceli'::character varying, 'yasin'::character varying, 'MKirazci'::character varying])::text[])) THEN (sum(cte.points) + 6)
                      ELSE sum(cte.points)
                  END AS sum
             FROM cte
            GROUP BY cte.betuser
          )
   SELECT row_number() OVER (ORDER BY cte2.sum DESC) AS rowno,
      cte2.betuser,
      cte2.sum
     FROM cte2;
  SQL

end
