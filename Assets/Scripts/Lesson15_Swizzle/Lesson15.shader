Shader "Unlit/Lesson15"
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

            v2f vert(appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                UNITY_TRANSFER_FOG(o, o.vertex);

                
                fixed4 f4 = fixed4(1,2,3,4);
                f4 = f4.rgba;
                f4 = f4.xzwy;
                fixed2 f2_2 = f4.ba;
                fixed2 f2 = f4;
                fixed2x2 f2x2= {f2,f2};

                fixed3x3 f3x3 = {
                1,2,3,
                4,5,6,
                7,8,9};

                fixed4x4 f4x4 = {
                fixed4(f3x3[0],10),
                fixed4(f3x3[1],10),
                fixed4(f3x3[2],10),
                fixed4(10,10,10,10)};
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
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