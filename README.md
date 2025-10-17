# 🔌 Permanent Blackout Script for FiveM

This resource provides a **permanent blackout system** for FiveM servers, automatically disabling and enabling artificial lights depending on the player’s position. It includes **exclusion zones** where blackouts are disabled (e.g., for safe zones, cities, or mission areas).

Ideal for **survival or apocalypse-style servers**, this script adds an immersive, dark atmosphere to your world.

---

## 🧩 Features

- 🌑 Permanent blackout effect managed in a background thread  
- 🚫 Configurable "no blackout" zones  
- 💡 Dynamically toggles global artificial lighting  
- ⚙️ Lightweight and performance-friendly  

---

## 🗂️ Script Overview

The script starts a permanent blackout loop that:
1. Disables world lights (`Citizen.InvokeNative(0xE2B187C0939B3D32, 0)`).
2. Forces artificial lights on, excluding vehicles.
3. Runs continuously until a player enters a **No Blackout Zone**, defined in your `Config.NoBlackoutZones`.

When the player enters such a zone:
- The blackout loop stops.
- Artificial lights return to normal.
- Once the player exits the zone, the blackout loop automatically resumes.

---

## ⚙️ Configuration

This script relies on a `Config.NoBlackoutZones` table, which should be defined elsewhere in your resource (e.g., in `config.lua`):

```lua
Config.NoBlackoutZones = {
    {
        coords = vec3(200.0, -900.0, 30.0),
        radius = 100.0,
        distances = { inside = 0, outside = 150 }
    },
    {
        coords = vec3(-500.0, 300.0, 40.0),
        radius = 150.0,
        distances = { inside = 0, outside = 200 }
    }
}
