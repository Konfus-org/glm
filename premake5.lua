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
        "./**.lua",
    }

    includedirs { "glm" }

    filter "configurations:Debug"
        runtime "Debug"
        linkoptions { "/MDd" }  -- Enable Link Time Code Generation and Incremental linking
        symbols "on"

    filter "configurations:Optimized"
        runtime "Release"
        linkoptions { "/MDd" }  -- Enable Link Time Code Generation and Incremental linking
        optimize "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
        linkoptions { "/MD" }  -- Enable Link Time Code Generation and Incremental linking
        symbols "off"