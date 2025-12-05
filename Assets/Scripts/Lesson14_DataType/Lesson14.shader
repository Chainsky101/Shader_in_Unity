Shader "Unlit/Lesson14"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
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

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                UNITY_TRANSFER_FOG(o,o.vertex);
                //basic datatype in CG
                uint i1 = 2;
                int i2 = 3;
                float f1 = 2.1f;
                half f2 = 2.3h;
                fixed f3 = 2.4;
                bool b = true;
                string str = "123";

                sampler sam;

                int arr[2]={1,2};
                int arr1[2][3] = {{2,2,1},{1,2,4}};

                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // sample the texture
                fixed4 col = tex2D(_MainTex, i.uv);
                // apply fog
                UNITY_APPLY_FOG(i.fogCoord, col);

                //special data type in CG
                half2 h = half2(2,31);
                half2x3 half2x3 ={
                    2,3,4,
                    5,6,7};
                fixed4x4 f4x4 = {
                    1.2,2,3,4,
                    5,6,7,8,
                    9,10,11,12,
                    13,14,15,16
                    };
                return col;
            }
            ENDCG
        }
    }
}
