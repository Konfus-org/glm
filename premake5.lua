project "glm"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "Off"

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
    defines
    {
        "SPDLOG_COMPILED_LIB"
    }