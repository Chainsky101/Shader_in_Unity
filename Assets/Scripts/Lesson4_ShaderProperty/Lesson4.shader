Shader "ShaderStudy/Unlit/Lesson4"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "red" {}//贴图纹理类型
        // value type : Int Float Range
        _MyInt("MyInt",Int) = 2
        _MyFloat("MyFloat",Float) = 2.3
        _MyRange("MyRange",Range(2,10)) = 3
        // color and vector type : Color Vector
        _MyColor("MyColor",Color) = (1,1,1,1)
        _MyVector("MyVector",Vector) = (12,21,41,25)
        //texture type: 2D 2DArray
        _My2D("My2D",2D) = "grey"{}
        _My2DArray("My2DArray",2DArray) = ""{}
        _MyCube("MyCube",Cube) = "white"{}
        _MyCubeArray("MyCubeArray",CubeArray) = "white"{}
        _My3D("My3D",3D) = ""{}
        
        
    }
    SubShader
    {
        
        //1.Tags
        Tags {
            "RenderType"="Transparent"
            "Queue"="Overlay-100"
            "DisableBatching"="True"
            "ForceNoShadowCasting"="True"
            "IgnoreProjector"="True"
            "CanUseSpriteAtlas"="False"
            "PreviewType"="SkyBox"
        }
        //2.States
        LOD 100
        Cull Off
        ZWrite On
//        ZTest Greater
//        ZTest NotEqual
//        Blend One One
        
        //3.Passes
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // sample the texture
                fixed4 col = tex2D(_MainTex, i.uv);
                // apply fog
                UNITY_APPLY_FOG(i.fogCoord, col);
                return col;
            }
            ENDCG
        }
    }
}
