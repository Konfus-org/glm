project "glm"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    if OutputIntermediateDir == nil or OutputTargetDir == nil then
        targetdir ("Build/bin/%{prj.name}/")
        objdir    ("Build/obj/%{prj.name}/")

    else
        targetdir ("../../../" .. OutputTargetDir .. "")
        objdir    ("../../../" .. OutputIntermediateDir .. "")
    end

    defines
    {
        "SPDLOG_COMPILED_LIB"
    }

    files
    {
        "glm/**.hpp",
        "glm/**.inl",
        "glm/glm.cpp",
        "./**.md",
        "./**.lua"
    }

    includedirs 
    { 
        "glm" 
    }
    
    filter "configurations:Debug"
        runtime "Debug"
        buildoptions { "/MDd" } 
        symbols "On"

    filter "configurations:Optimized"
        runtime "Release"
        buildoptions { "/MDd" } 
        optimize "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"
        buildoptions { "/MD" } 
        symbols "Off"