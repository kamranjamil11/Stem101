Shader "motorcycle" {
	Properties {
		_Color ("Color", Vector) = (1,1,1,1)
		_MainTex ("MainTex", 2D) = "" {}
		_MatCap ("MatCap", 2D) = "" {}
		_ReflTex ("ReflTex", 2D) = "" {}
		_Strenght ("Reflection Strenght", Range(0, 1)) = 0.5
		_SpecOffset ("Light", Vector) = (1,10,2,0)
		_Scroll ("Refl Scroll Speed", Float) = 1
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "Queve" = "Geometry" "RenderType" = "FORWARDBASE" }
		Pass {
			Tags { "IGNOREPROJECTOR" = "true" "Queve" = "Geometry" "RenderType" = "FORWARDBASE" }
			GpuProgramID 46808
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 _Color;
					uniform 	mediump vec4 _ReflTex_ST;
					uniform 	mediump vec4 _SpecOffset;
					uniform 	mediump float _Scroll;
					attribute mediump vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute mediump vec3 in_NORMAL0;
					attribute mediump vec2 in_TEXCOORD0;
					attribute mediump vec2 in_TEXCOORD1;
					varying mediump vec4 vs_COLOR0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump vec2 u_xlat16_10;
					float u_xlat12;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.xyz = _SpecOffset.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_14 = inversesqrt(u_xlat16_14);
					    u_xlat16_2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
					    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat16_2.xyz);
					    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
					    u_xlat16_0.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + vec3(0.300000012, 0.300000012, 0.300000012);
					    u_xlat16_0.w = 1.0;
					    vs_COLOR0 = u_xlat16_0 * _Color;
					    u_xlat16_2.xy = in_TEXCOORD1.xy * _ReflTex_ST.xy + _ReflTex_ST.zw;
					    u_xlat16_10.xy = vec2(_Scroll) * vec2(-1.0, 1.0);
					    u_xlat1.xy = u_xlat16_10.xy * _Time.yy + u_xlat16_2.xy;
					    vs_TEXCOORD1.xy = u_xlat1.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat3.xyz;
					    u_xlat1.y = dot(u_xlat3.xyz, in_NORMAL0.xyz);
					    vs_TEXCOORD2.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    vs_TEXCOORD3 = in_COLOR0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump float _Strenght;
					uniform mediump sampler2D _MainTex;
					uniform lowp sampler2D _MatCap;
					uniform lowp sampler2D _ReflTex;
					varying mediump vec4 vs_COLOR0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					lowp vec4 u_xlat10_2;
					mediump vec4 u_xlat16_3;
					void main()
					{
					    u_xlat10_0 = texture2D(_MatCap, vs_TEXCOORD2.xy);
					    u_xlat0 = u_xlat10_0 * vs_TEXCOORD3.xxxx;
					    u_xlat1 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_2 = vs_COLOR0 * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat16_3 * u_xlat16_2 + u_xlat1;
					    u_xlat10_2 = texture2D(_ReflTex, vs_TEXCOORD1.xy);
					    u_xlat2 = u_xlat10_2 * vs_TEXCOORD3.yyyy;
					    u_xlat16_1 = vec4(vec4(_Strenght, _Strenght, _Strenght, _Strenght)) * u_xlat2 + u_xlat16_1;
					    u_xlat16_2 = vec4(vec4(_Strenght, _Strenght, _Strenght, _Strenght)) * u_xlat2 + u_xlat16_3;
					    u_xlat16_0 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_2;
					    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_1;
					    SV_Target0 = u_xlat16_3.wwww * u_xlat16_1 + u_xlat16_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 _Color;
					uniform 	mediump vec4 _ReflTex_ST;
					uniform 	mediump vec4 _SpecOffset;
					uniform 	mediump float _Scroll;
					attribute mediump vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute mediump vec3 in_NORMAL0;
					attribute mediump vec2 in_TEXCOORD0;
					attribute mediump vec2 in_TEXCOORD1;
					varying mediump vec4 vs_COLOR0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump vec2 u_xlat16_10;
					float u_xlat12;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.xyz = _SpecOffset.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_14 = inversesqrt(u_xlat16_14);
					    u_xlat16_2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
					    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat16_2.xyz);
					    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
					    u_xlat16_0.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + vec3(0.300000012, 0.300000012, 0.300000012);
					    u_xlat16_0.w = 1.0;
					    vs_COLOR0 = u_xlat16_0 * _Color;
					    u_xlat16_2.xy = in_TEXCOORD1.xy * _ReflTex_ST.xy + _ReflTex_ST.zw;
					    u_xlat16_10.xy = vec2(_Scroll) * vec2(-1.0, 1.0);
					    u_xlat1.xy = u_xlat16_10.xy * _Time.yy + u_xlat16_2.xy;
					    vs_TEXCOORD1.xy = u_xlat1.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat3.xyz;
					    u_xlat1.y = dot(u_xlat3.xyz, in_NORMAL0.xyz);
					    vs_TEXCOORD2.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    vs_TEXCOORD3 = in_COLOR0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump float _Strenght;
					uniform mediump sampler2D _MainTex;
					uniform lowp sampler2D _MatCap;
					uniform lowp sampler2D _ReflTex;
					varying mediump vec4 vs_COLOR0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					lowp vec4 u_xlat10_2;
					mediump vec4 u_xlat16_3;
					void main()
					{
					    u_xlat10_0 = texture2D(_MatCap, vs_TEXCOORD2.xy);
					    u_xlat0 = u_xlat10_0 * vs_TEXCOORD3.xxxx;
					    u_xlat1 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_2 = vs_COLOR0 * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat16_3 * u_xlat16_2 + u_xlat1;
					    u_xlat10_2 = texture2D(_ReflTex, vs_TEXCOORD1.xy);
					    u_xlat2 = u_xlat10_2 * vs_TEXCOORD3.yyyy;
					    u_xlat16_1 = vec4(vec4(_Strenght, _Strenght, _Strenght, _Strenght)) * u_xlat2 + u_xlat16_1;
					    u_xlat16_2 = vec4(vec4(_Strenght, _Strenght, _Strenght, _Strenght)) * u_xlat2 + u_xlat16_3;
					    u_xlat16_0 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_2;
					    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_1;
					    SV_Target0 = u_xlat16_3.wwww * u_xlat16_1 + u_xlat16_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 _Color;
					uniform 	mediump vec4 _ReflTex_ST;
					uniform 	mediump vec4 _SpecOffset;
					uniform 	mediump float _Scroll;
					attribute mediump vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute mediump vec3 in_NORMAL0;
					attribute mediump vec2 in_TEXCOORD0;
					attribute mediump vec2 in_TEXCOORD1;
					varying mediump vec4 vs_COLOR0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump vec2 u_xlat16_10;
					float u_xlat12;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.xyz = _SpecOffset.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_14 = inversesqrt(u_xlat16_14);
					    u_xlat16_2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
					    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat16_2.xyz);
					    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
					    u_xlat16_0.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + vec3(0.300000012, 0.300000012, 0.300000012);
					    u_xlat16_0.w = 1.0;
					    vs_COLOR0 = u_xlat16_0 * _Color;
					    u_xlat16_2.xy = in_TEXCOORD1.xy * _ReflTex_ST.xy + _ReflTex_ST.zw;
					    u_xlat16_10.xy = vec2(_Scroll) * vec2(-1.0, 1.0);
					    u_xlat1.xy = u_xlat16_10.xy * _Time.yy + u_xlat16_2.xy;
					    vs_TEXCOORD1.xy = u_xlat1.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat3.xyz;
					    u_xlat1.y = dot(u_xlat3.xyz, in_NORMAL0.xyz);
					    vs_TEXCOORD2.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    vs_TEXCOORD3 = in_COLOR0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump float _Strenght;
					uniform mediump sampler2D _MainTex;
					uniform lowp sampler2D _MatCap;
					uniform lowp sampler2D _ReflTex;
					varying mediump vec4 vs_COLOR0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					lowp vec4 u_xlat10_2;
					mediump vec4 u_xlat16_3;
					void main()
					{
					    u_xlat10_0 = texture2D(_MatCap, vs_TEXCOORD2.xy);
					    u_xlat0 = u_xlat10_0 * vs_TEXCOORD3.xxxx;
					    u_xlat1 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_2 = vs_COLOR0 * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat16_3 * u_xlat16_2 + u_xlat1;
					    u_xlat10_2 = texture2D(_ReflTex, vs_TEXCOORD1.xy);
					    u_xlat2 = u_xlat10_2 * vs_TEXCOORD3.yyyy;
					    u_xlat16_1 = vec4(vec4(_Strenght, _Strenght, _Strenght, _Strenght)) * u_xlat2 + u_xlat16_1;
					    u_xlat16_2 = vec4(vec4(_Strenght, _Strenght, _Strenght, _Strenght)) * u_xlat2 + u_xlat16_3;
					    u_xlat16_0 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_2;
					    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_1;
					    SV_Target0 = u_xlat16_3.wwww * u_xlat16_1 + u_xlat16_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	mediump vec4 _Color;
					uniform 	mediump vec4 _ReflTex_ST;
					uniform 	mediump vec4 _SpecOffset;
					uniform 	mediump float _Scroll;
					attribute mediump vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute mediump vec3 in_NORMAL0;
					attribute mediump vec2 in_TEXCOORD0;
					attribute mediump vec2 in_TEXCOORD1;
					varying mediump vec4 vs_COLOR0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec2 vs_TEXCOORD2;
					varying highp float vs_TEXCOORD7;
					varying mediump vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump vec2 u_xlat16_10;
					float u_xlat12;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD7 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.xyz = _SpecOffset.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_14 = inversesqrt(u_xlat16_14);
					    u_xlat16_2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
					    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat16_2.xyz);
					    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
					    u_xlat16_0.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + vec3(0.300000012, 0.300000012, 0.300000012);
					    u_xlat16_0.w = 1.0;
					    vs_COLOR0 = u_xlat16_0 * _Color;
					    u_xlat16_2.xy = in_TEXCOORD1.xy * _ReflTex_ST.xy + _ReflTex_ST.zw;
					    u_xlat16_10.xy = vec2(_Scroll) * vec2(-1.0, 1.0);
					    u_xlat1.xy = u_xlat16_10.xy * _Time.yy + u_xlat16_2.xy;
					    vs_TEXCOORD1.xy = u_xlat1.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat3.xyz;
					    u_xlat1.y = dot(u_xlat3.xyz, in_NORMAL0.xyz);
					    vs_TEXCOORD2.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    vs_TEXCOORD3 = in_COLOR0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump vec4 unity_FogColor;
					uniform 	mediump float _Strenght;
					uniform mediump sampler2D _MainTex;
					uniform lowp sampler2D _MatCap;
					uniform lowp sampler2D _ReflTex;
					varying mediump vec4 vs_COLOR0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec2 vs_TEXCOORD2;
					varying highp float vs_TEXCOORD7;
					varying mediump vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					lowp vec4 u_xlat10_2;
					vec3 u_xlat3;
					mediump vec4 u_xlat16_3;
					float u_xlat15;
					void main()
					{
					    u_xlat10_0 = texture2D(_MatCap, vs_TEXCOORD2.xy);
					    u_xlat0 = u_xlat10_0 * vs_TEXCOORD3.xxxx;
					    u_xlat1 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_2 = vs_COLOR0 * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat16_3 * u_xlat16_2 + u_xlat1;
					    u_xlat10_2 = texture2D(_ReflTex, vs_TEXCOORD1.xy);
					    u_xlat2 = u_xlat10_2 * vs_TEXCOORD3.yyyy;
					    u_xlat16_1 = vec4(vec4(_Strenght, _Strenght, _Strenght, _Strenght)) * u_xlat2 + u_xlat16_1;
					    u_xlat16_2 = vec4(vec4(_Strenght, _Strenght, _Strenght, _Strenght)) * u_xlat2 + u_xlat16_3;
					    u_xlat16_0 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_2;
					    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_3.wwww * u_xlat16_1 + u_xlat16_0;
					    u_xlat3.xyz = u_xlat16_0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.w = u_xlat16_0.w;
					    u_xlat15 = vs_TEXCOORD7;
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat3.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	mediump vec4 _Color;
					uniform 	mediump vec4 _ReflTex_ST;
					uniform 	mediump vec4 _SpecOffset;
					uniform 	mediump float _Scroll;
					attribute mediump vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute mediump vec3 in_NORMAL0;
					attribute mediump vec2 in_TEXCOORD0;
					attribute mediump vec2 in_TEXCOORD1;
					varying mediump vec4 vs_COLOR0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec2 vs_TEXCOORD2;
					varying highp float vs_TEXCOORD7;
					varying mediump vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump vec2 u_xlat16_10;
					float u_xlat12;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD7 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.xyz = _SpecOffset.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_14 = inversesqrt(u_xlat16_14);
					    u_xlat16_2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
					    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat16_2.xyz);
					    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
					    u_xlat16_0.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + vec3(0.300000012, 0.300000012, 0.300000012);
					    u_xlat16_0.w = 1.0;
					    vs_COLOR0 = u_xlat16_0 * _Color;
					    u_xlat16_2.xy = in_TEXCOORD1.xy * _ReflTex_ST.xy + _ReflTex_ST.zw;
					    u_xlat16_10.xy = vec2(_Scroll) * vec2(-1.0, 1.0);
					    u_xlat1.xy = u_xlat16_10.xy * _Time.yy + u_xlat16_2.xy;
					    vs_TEXCOORD1.xy = u_xlat1.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat3.xyz;
					    u_xlat1.y = dot(u_xlat3.xyz, in_NORMAL0.xyz);
					    vs_TEXCOORD2.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    vs_TEXCOORD3 = in_COLOR0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump vec4 unity_FogColor;
					uniform 	mediump float _Strenght;
					uniform mediump sampler2D _MainTex;
					uniform lowp sampler2D _MatCap;
					uniform lowp sampler2D _ReflTex;
					varying mediump vec4 vs_COLOR0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec2 vs_TEXCOORD2;
					varying highp float vs_TEXCOORD7;
					varying mediump vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					lowp vec4 u_xlat10_2;
					vec3 u_xlat3;
					mediump vec4 u_xlat16_3;
					float u_xlat15;
					void main()
					{
					    u_xlat10_0 = texture2D(_MatCap, vs_TEXCOORD2.xy);
					    u_xlat0 = u_xlat10_0 * vs_TEXCOORD3.xxxx;
					    u_xlat1 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_2 = vs_COLOR0 * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat16_3 * u_xlat16_2 + u_xlat1;
					    u_xlat10_2 = texture2D(_ReflTex, vs_TEXCOORD1.xy);
					    u_xlat2 = u_xlat10_2 * vs_TEXCOORD3.yyyy;
					    u_xlat16_1 = vec4(vec4(_Strenght, _Strenght, _Strenght, _Strenght)) * u_xlat2 + u_xlat16_1;
					    u_xlat16_2 = vec4(vec4(_Strenght, _Strenght, _Strenght, _Strenght)) * u_xlat2 + u_xlat16_3;
					    u_xlat16_0 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_2;
					    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_3.wwww * u_xlat16_1 + u_xlat16_0;
					    u_xlat3.xyz = u_xlat16_0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.w = u_xlat16_0.w;
					    u_xlat15 = vs_TEXCOORD7;
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat3.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	mediump vec4 _Color;
					uniform 	mediump vec4 _ReflTex_ST;
					uniform 	mediump vec4 _SpecOffset;
					uniform 	mediump float _Scroll;
					attribute mediump vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute mediump vec3 in_NORMAL0;
					attribute mediump vec2 in_TEXCOORD0;
					attribute mediump vec2 in_TEXCOORD1;
					varying mediump vec4 vs_COLOR0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec2 vs_TEXCOORD2;
					varying highp float vs_TEXCOORD7;
					varying mediump vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump vec2 u_xlat16_10;
					float u_xlat12;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD7 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.xyz = _SpecOffset.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_14 = inversesqrt(u_xlat16_14);
					    u_xlat16_2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
					    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat16_2.xyz);
					    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
					    u_xlat16_0.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + vec3(0.300000012, 0.300000012, 0.300000012);
					    u_xlat16_0.w = 1.0;
					    vs_COLOR0 = u_xlat16_0 * _Color;
					    u_xlat16_2.xy = in_TEXCOORD1.xy * _ReflTex_ST.xy + _ReflTex_ST.zw;
					    u_xlat16_10.xy = vec2(_Scroll) * vec2(-1.0, 1.0);
					    u_xlat1.xy = u_xlat16_10.xy * _Time.yy + u_xlat16_2.xy;
					    vs_TEXCOORD1.xy = u_xlat1.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat1.xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat3.xyz;
					    u_xlat1.y = dot(u_xlat3.xyz, in_NORMAL0.xyz);
					    vs_TEXCOORD2.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    vs_TEXCOORD3 = in_COLOR0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump vec4 unity_FogColor;
					uniform 	mediump float _Strenght;
					uniform mediump sampler2D _MainTex;
					uniform lowp sampler2D _MatCap;
					uniform lowp sampler2D _ReflTex;
					varying mediump vec4 vs_COLOR0;
					varying mediump vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying mediump vec2 vs_TEXCOORD2;
					varying highp float vs_TEXCOORD7;
					varying mediump vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					lowp vec4 u_xlat10_2;
					vec3 u_xlat3;
					mediump vec4 u_xlat16_3;
					float u_xlat15;
					void main()
					{
					    u_xlat10_0 = texture2D(_MatCap, vs_TEXCOORD2.xy);
					    u_xlat0 = u_xlat10_0 * vs_TEXCOORD3.xxxx;
					    u_xlat1 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_2 = vs_COLOR0 * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat16_3 * u_xlat16_2 + u_xlat1;
					    u_xlat10_2 = texture2D(_ReflTex, vs_TEXCOORD1.xy);
					    u_xlat2 = u_xlat10_2 * vs_TEXCOORD3.yyyy;
					    u_xlat16_1 = vec4(vec4(_Strenght, _Strenght, _Strenght, _Strenght)) * u_xlat2 + u_xlat16_1;
					    u_xlat16_2 = vec4(vec4(_Strenght, _Strenght, _Strenght, _Strenght)) * u_xlat2 + u_xlat16_3;
					    u_xlat16_0 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat16_2;
					    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_3.wwww * u_xlat16_1 + u_xlat16_0;
					    u_xlat3.xyz = u_xlat16_0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.w = u_xlat16_0.w;
					    u_xlat15 = vs_TEXCOORD7;
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat3.xyz;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES"
				}
			}
		}
	}
}