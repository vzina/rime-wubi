function date_translator(input, seg)
   if (input == "date") then
      --- Candidate(type, start, end, text, comment)
      yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
      yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), ""))
      yield(Candidate("date", seg.start, seg._end, os.date("%m-%d"), ""))
      yield(Candidate("date", seg.start, seg._end, os.date("%Y%m%d"), ""))
      yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d"), ""))
   end

   if (input == "time") then
      --- Candidate(type, start, end, text, comment)
      yield(Candidate("time", seg.start, seg._end, os.date("%Y-%m-%d %H:%M:%S"), ""))
      yield(Candidate("time", seg.start, seg._end, os.time(), "时间戳"))
      yield(Candidate("time", seg.start, seg._end, os.date("%Y%m%d%H%M%S"), ""))
   end

   if (input == "week") then
      local weakTab = {'日', '一', '二', '三', '四', '五', '六'}
      yield(Candidate("week", seg.start, seg._end, "周"..weakTab[tonumber(os.date("%w")+1)], ""))
      yield(Candidate("week", seg.start, seg._end, "星期"..weakTab[tonumber(os.date("%w")+1)], ""))
   end

   if (input == "month") then
      yield(Candidate("month", seg.start, seg._end, os.date("%Y-%m"), ""))
      yield(Candidate("month", seg.start, seg._end, os.date("%Y%m"), ""))
   end
end

--- 过滤器：单字在先
function single_char_first_filter(input)
   local l = {}
   for cand in input:iter() do
      if (utf8.len(cand.text) == 1) then
         yield(cand)
      else
         table.insert(l, cand)
      end
   end
   for i, cand in ipairs(l) do
      yield(cand)
   end
end