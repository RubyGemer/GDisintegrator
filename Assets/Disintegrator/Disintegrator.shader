Shader "Disintegrator"
{
    Properties
    {
        [Header(Base Properties)]
        _Color("Albedo", Color) = (0, 0, 0, 0)
        _SpecColor("Specular", Color) = (1, 1, 1)
        _Glossiness("Smoothness", Range(0, 1)) = 0

        [Header(Effect Properties)]
        _Color2("Albedo", Color) = (0, 0, 0, 0)
        _SpecColor2("Specular", Color) = (1, 1, 1)
        _Glossiness2("Smoothness", Range(0, 1)) = 0

        [Header(Edge Properteis)]
        [HDR] _EdgeColor("Color", Color) = (1, 0, 0)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        Cull Off
        Pass
        {
            Tags { "LightMode"="Deferred" }
            CGPROGRAM
            #pragma vertex Vertex
            #pragma geometry Geometry
            #pragma fragment Fragment
            #include "Disintegrator.cginc"
            ENDCG
        }
        Pass
        {
            Tags { "LightMode"="ShadowCaster" }
            CGPROGRAM
            #pragma vertex Vertex
            #pragma geometry Geometry
            #pragma fragment Fragment
            #define DISINTEGRATOR_SHADOW_CASTER
            #include "Disintegrator.cginc"
            ENDCG
        }
    }
}
