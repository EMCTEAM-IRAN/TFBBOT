local function returnids(cb_extra, success, result)
   local receiver = cb_extra.receiver
   local channel_id = result.id
   local channelname = result.print_name
   for k,v in pairs(result.members) do
      send_large_msg(v.print_name, text)
   end
   send_large_msg(receiver, 'Message Send to All Done')
end

local function run(msg, matches)
   local receiver = get_receiver(msg)
   if not is_channel_msg(msg) then
      return 'Only works in supergroup'
   end
   if matches[1] then
      text = 'Send to All from: ' .. string.gsub(msg.to.print_name, '_', ' ') .. '\n______________________________'
      text = text .. '\n\n' .. matches[1]
      local chat = get_receiver(msg)
      channel_info(channel, returnids, {receiver=receiver})
   end
end

return {
   description = "PV Message Send to All Members",
   usage = {
      "#s2a (pm) : send pm for all members",
   },
   patterns = {
      "^#s2a +(.+)$"
   },
   run = run,
   moderated = true
}