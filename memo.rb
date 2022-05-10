require "csv"

input_number = ""
puts "1(新規でメモを作成) 2(既存のメモ編集する)"

while input_number == ""
    memo_type = gets.to_s
    input_value = memo_type.chomp
    if ["1", "2"].include?(input_value)
       input_number = input_value
    else
        puts "1か2の数字を入れてください"
    end
end

if input_number == "1"
    puts "拡張子を除いたファイル名を入力してください"
    file_name = gets.chomp

    puts "メモしたい内容を記入してください"
    puts "完了したらCtrl+Dをおします"
    input_memo_new = STDIN.read
    CSV.open("#{file_name}.csv", "w") do |csv|
       csv << ["#{input_memo_new}"]
    end

elsif input_number == "2"
    puts "編集するファイルの名前を入力してください"
    edit_file_name = gets.chomp

    puts "メモしたい内容を記入してください"
    puts "完了したらCtrl+Dをおします"
    input_memo_edit = STDIN.read
    CSV.open("#{edit_file_name}.csv", "a") do |csv|
       csv << ["#{input_memo_edit}"]
    end
end