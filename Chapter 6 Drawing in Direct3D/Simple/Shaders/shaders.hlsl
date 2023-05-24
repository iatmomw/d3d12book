//*********************************************************
//
// Copyright (c) Microsoft. All rights reserved.
// This code is licensed under the MIT License (MIT).
// THIS CODE IS PROVIDED *AS IS* WITHOUT WARRANTY OF
// ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING ANY
// IMPLIED WARRANTIES OF FITNESS FOR A PARTICULAR
// PURPOSE, MERCHANTABILITY, OR NON-INFRINGEMENT.
//
//*********************************************************

cbuffer cbPerObject : register(b0)
{
    float4x4 gWorldViewProj;
};

struct VertexIn
{
    float3 PosL : POSITION;
    float4 Color : COLOR;
};

struct VertexOut
{
    float4 PosH : SV_POSITION;
    float4 Color : COLOR;
};

VertexOut VS(VertexIn vin)
{
    VertexOut vout;
	
	// Transform to homogeneous clip space.
    vout.PosH = float4(vin.PosL, 1.0f); //    mul(float4(vin.PosL, 1.0f), gWorldViewProj);
	
	// Just pass vertex color into the pixel shader.
    vout.Color = vin.Color;
    
    return vout;
}

float4 PS(VertexOut pin) : SV_Target
{
    return pin.Color;
}

//struct PSInput
//{
//    float4 position : SV_POSITION;
//    float2 uv : TEXCOORD;
//};

//Texture2D g_texture : register(t0);
//SamplerState g_sampler : register(s0);

//PSInput VSMain(float4 position : POSITION, float4 uv : TEXCOORD)
//{
//    PSInput result;

//    result.position = position;
//    result.uv = uv;

//    return result;
//}

//float4 PSMain(PSInput input) : SV_TARGET
//{
//    return g_texture.Sample(g_sampler, input.uv);
//}
