module:depends("muc");

local random = require "util.random";

local function generate_random_password()
    return random.string(8);
end

local function on_muc_room_created(event)
    local room = event.room;
    local password = generate_random_password();
    room:set_password(password);
    module:log("info", "Установлен случайный пароль для комнаты %s: %s", room.jid, password);
end

module:hook("muc-room-created", on_muc_room_created);

return true;