Shader "Unlit/Lesson18"
{
    Properties
    {
        _MyInt("MyInt",int)= 3
        _MyFloat("MyFloat",Float) = 3.2
        _MyRange("MyRange",Range(2,4)) = 2
        
        _MyColor("MyColor",Color) = (1,1,1,1)
        _MyVector("MyVector",Vector) = (0,0,0,0)
        
        _My2D("My2D",2D) = "white"{}
        _MyCube("MyCube",Cube) = "white"{}
        _MyCubeArray("MyCubeArray",CubeArray) = ""{}
        _My3D("My3D",3D) = "white"{}
        _My2DArray("My2DArray",2DArray) = ""{}
        
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
            fixed _MyInt;
            fixed _MyFloat;
            fixed _MyRange;

            fixed4 _MyColor;
            float4 _MyVector;

            sampler2D _My2D;
            sampler3D _My3D;
            samplerCUBE _MyCube;
            
            
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
                return _MyColor;
            }
            ENDCG
        }
    }
}