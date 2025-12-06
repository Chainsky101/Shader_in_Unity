Shader "Unlit/Lesson17"
{
    Properties
    {
    }
    SubShader
    {


        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            struct appdata
            {
                //顶点位置
                fixed4 postion : POSITION;
                //顶点的颜色
                fixed4 color : COLOR;
                //顶点的uv
                fixed2 uv : TEXCOORD0;
            };

            struct fdata
            {
                fixed4 postion : SV_POSITION;
                fixed4 color : COLOR;
                fixed2 uv : TEXCOORD0;
            };

            
            fdata vert(appdata data)
            {
                fdata f;
                f.postion = UnityObjectToClipPos(data.postion);
                f.color = data.color;
                f.uv = data.uv;
                return f;
            }
            
            fixed4 frag(fdata data) : SV_Target
            {
                return data.color;
            }
            ENDCG
        }
    }
}