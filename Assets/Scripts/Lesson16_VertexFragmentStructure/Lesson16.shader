// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "ShaderStudy/Unlit/Lesson16"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags
        {
            "RenderType"="Opaque"
        }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex myVertex
            #pragma fragment myFragment

            fixed4 myVertex(fixed4 pos : POSITION):SV_POSITION
            {
                return UnityObjectToClipPos(pos);
            }

            fixed4 myFragment() : SV_Target
            {
                return fixed4(0,0,1,1);
            }
            
            ENDCG
        }
    }
}