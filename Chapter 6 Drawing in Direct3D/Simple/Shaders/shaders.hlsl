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
    float4 position : POSITION;
    float2 uv : TEXCOORD;
};

struct VertexOut
{
    float4 position : SV_POSITION;
    float2 uv : TEXCOORD;
};

Texture2D g_texture : register(t0);
SamplerState g_sampler : register(s0);

VertexOut VS(VertexIn vin)
{
    VertexOut vout;
	
    vout.position = vin.position;
    //vout.position = mul(vin.position, gWorldViewProj);
    vout.uv = vin.uv;
    
    return vout;
}

float4 PS(VertexOut pin) : SV_Target
{
    //return float4(pin.uv, 0.0f,0.0f);
    return g_texture.Sample(g_sampler, pin.uv);
    }