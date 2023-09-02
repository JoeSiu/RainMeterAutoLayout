function Initialize()
   -- Settings
   onLoadDelayTime = tonumber(SKIN:GetVariable('OnLoadDelayTime'))
   enableDefaultLayout = (tonumber(SKIN:GetVariable('EnableDefaultLayout')) == 1)
   defaultLayout = SKIN:GetVariable('DefaultLayout')
   layoutMapStr = SKIN:GetVariable('LayoutMap')
   layoutMapDelimiter = SKIN:GetVariable('LayoutMapDelimiter')

   -- Convert LayoutMap string to table
   layoutMap = {}
   for k, v in string.gmatch(layoutMapStr, "(%d+x%d+)=(%w+)" .. layoutMapDelimiter) do
      layoutMap[k] = v
   end

   -- Internal
   startTime = os.time()
   isStarted = false
   lastvw = -1
   lastvh = -1
end

function Update()
   -- Delay to prevent instant layout change
   if not isStarted then
      currentTime = os.time()
      elapsedTime = currentTime - startTime

      if elapsedTime < onLoadDelayTime then
         message = "Starting resolution monitoring in " .. tostring(onLoadDelayTime - elapsedTime) .. " seconds..."
         return message
      else
         isStarted = true
         message = "Started resolution monitoring..."
         SKIN:Bang("!Log", message)
      end
   end

   -- Check resolution
   vw = tonumber(SKIN:GetMeasure('MeasureVW'):GetStringValue())
   vh = tonumber(SKIN:GetMeasure('MeasureVH'):GetStringValue())

   -- Update layout on resolution changes
   if ((lastvw ~= -1 and lastvh ~= -1) and (vw ~= lastvw or vh ~= lastvh)) then
      resolution = tostring(vw) .. "x" .. tostring(vh)
      layout = layoutMap[resolution]

      -- Use default layout if no resolution matches
      if layout == nil and enableDefaultLayout then
         layout = layoutMap[defaultLayout]
      end

      -- Load layout
      if layout ~= nil then
         message = "Loading layout '" .. layout .. "'..."
         SKIN:Bang("!Log", message)
         SKIN:Bang("!LoadLayout", layout)
         return message
      end

      -- No matching resolution and default layout is not enabled
      message = "Detected resolution changes from " .. tostring(lastvw) .. "x" .. tostring(lastvh) .. " to " .. tostring(vw) .. "x" .. tostring(vh) .. ", but no matching layout found. "
      SKIN:Bang("!Log", message)
      lastvw = vw
      lastvh = vh
      return message
   end

   lastvw = vw
   lastvh = vh
   message = "Last resolution: " .. tostring(vw) .. "x" .. tostring(vh)
   return message
end