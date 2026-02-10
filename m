Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAUzNMfrimlEOwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 09:26:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A54E1183E1
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 09:26:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226122.1532662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpj4o-0007Vp-AG; Tue, 10 Feb 2026 08:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226122.1532662; Tue, 10 Feb 2026 08:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpj4o-0007UI-6q; Tue, 10 Feb 2026 08:26:30 +0000
Received: by outflank-mailman (input) for mailman id 1226122;
 Tue, 10 Feb 2026 08:26:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjf6=AO=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpj4n-0007UC-66
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 08:26:29 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31350a9e-065a-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 09:26:28 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB5526.namprd03.prod.outlook.com (2603:10b6:5:2cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 08:26:24 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 08:26:23 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 31350a9e-065a-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FN0dkTwHHaWhXp5T6AvjxO4HBgUrA6WBoIo0o0a0Lfwkx+dSDHz2TXL8FcKtNF8C+PYA4iDBr1ynxsvf//9smLRLb7jOp6gDBeY38VYQiwBxvvSUV2fuRvIuKxDAHQ9D34Grm7T4YTeFGaHsCVhGVosY9DVtLOLSu5rMZI+LNw70ArNum8ueI+Rjv1npXIdCso9wNQ+vOJv2xaruR8Cwha+IyaGm2WIobECmuSX1obPvvt4vz/FmoGpqSZzJYu5tDR55EutaEYPSHJBuJGkvoWD6HX45Z2eE8lDMnUvX9Rwgy2+uW/YgRiQ84L3+p/gJyImuPN8KF1/lbJcbveGAlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjSN/Rlu0A1f/HskoZbZyNfLTMUksjbEaTD7vOqqY/U=;
 b=yEVF2ooxszeRDy6Xvn902mt4+L9T6XotVs4QQ8mKQDWX/jA+/Rc0phwd0Z83Jjr6EchyY5gudoWl5TZIfzwjGi5+F3d79pPZhFVXrAzeWtxXNAekCwIDcVfPkuiBb9/YbMKPsFtZrPyFXpsFczTwOTfwehV42i/8zSPZx9aNM9LcK2MYg0YuZ8ByrsJzIt0CM0p3KIm7ND+1kClg0mqnQrMVNBk5ICAwPnhtr/W5qKyas36e1rU9gGU2XB3uF03/D/0HlGmQSumkd/Z+SkfGQkB2HIV1fyAw4qJEjsRHU7av3L3iCFE3ZO0UGPLMPlFnZoIh+LqmE5K+ntNn/fxkew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjSN/Rlu0A1f/HskoZbZyNfLTMUksjbEaTD7vOqqY/U=;
 b=NY7ezx536smHwTT/LO5kzKHn8pwQSJ9eTDq/J5oZL9mSZ1CC/lwuE1jh3rewjbdmzxMBK+le6MCxiFGyOEOjdVljcEJBGAGL9tsAYg8/JNS7sB50Pu807D0aEmJTuFZeE4QIUd99aZpXWaaNMlONaEwOk8sWwIcPi+fmOLbC/r8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 10 Feb 2026 09:26:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 02/12] x86: Add more granularity to the vendors in Kconfig
Message-ID: <aYrrrLuDXuOffsgx@Mac.lan>
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260206161539.209922-3-alejandro.garciavallejo@amd.com>
X-ClientProxiedBy: MA3P292CA0022.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB5526:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f792871-5b06-4b1a-1a39-08de687e1394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3RmZHRYY29rc0RYb1Z4SUcrUVYzQllyMUZTa1JFbHBFT3JsRzdnemFTcXM0?=
 =?utf-8?B?N1JlTE5rejQ2VC9hTWVVNHpia1pvL3lMQTVLTHhzR2d3SGJleGxnTUt4OUFr?=
 =?utf-8?B?OWVZU24vU1E4aVdNMzJJcnhsd2FLbC9qdjBDQXBXSVhTKy9WSDJqVkltTGpJ?=
 =?utf-8?B?bnVNRUQ4Z1BVZ0dONVBoLzVoQWV4aVplVFVEQldXZzAxY2JkMjBxdVlwU1c0?=
 =?utf-8?B?YmlQYzU4NHEyc1FwTzdjVDNlL1F1SWxQM0VPaG83Y094MDFuNlkzQnYyQlBY?=
 =?utf-8?B?dTNqV0RxVzNBU2ZVUUVKUVNsVTE2Z01XbVZIRW9IdE1neHRSVHJYU0lMVGZC?=
 =?utf-8?B?NEt3TkF6a05kdTAydk85Ym1OeDdoUC84YTRpWDhSaTg0UC9HWDJudnFWZHlM?=
 =?utf-8?B?cm94dWc4M2VWMzczc2kyc3dZNlc5K1Y0U3ZWVlhVSGtvcjlTdVlyVjYrdktU?=
 =?utf-8?B?VHJld3V5SVowaEZYOG9JNTJaSVpVelNpWURtUEpYR1ZaYlFTZDhVazJpcHJl?=
 =?utf-8?B?RTlmUTBhZjZoS1RTMnY2UjdYTTkrWHpVVFlscklSRVRKWDIxczVVZGI2L1Nw?=
 =?utf-8?B?cWpuMzhvcnk1VXI0NmlmRUlkRXRlb2JxWWJaZ3pUUGhXSFZxS2tSUlVSM1dM?=
 =?utf-8?B?VWo3MDQ3Yk4vclJ0WWRUUzdEdGFLTkFtZDdrTk9VL2lpWEZtb0JURDBISlor?=
 =?utf-8?B?S3FPam9JZy9yWVh3ZDBFSWx6SEZ6UmFkTmxJRTlLWTBXMUk0d1JaY2dmMHda?=
 =?utf-8?B?ZU1Pc282R1p4NFE5MzhJUm02OTQzcDd4dFBsN2lHVTdtMS9PcHZST1MrOHlv?=
 =?utf-8?B?dHJENHhsb1JXZisyVGlyUFlCZE5WczBXQ0orMVQxa25hM2x3bTdTT01VblN0?=
 =?utf-8?B?U0FVQTAxY2RqUHcwbERWZ2ZoNUlHTS9rMGFpSUpnaGYrVThWeDZhVkxTRDVs?=
 =?utf-8?B?UHZubDd6WTlGLzd2UGVhcVZ2UUpIcEswQTBRdkpLVGZTQ092dEE0Sk0yeUtJ?=
 =?utf-8?B?a3RHU0xEeG5pUE90UVJLS2pCQUREdEhNYUlFT1ZoYjFwQnFYbXNtT3hPTitW?=
 =?utf-8?B?U3dDYzcwbS9JOHdZSytqVFI3STM3M25GMEpiTTdha0JCeUxwaEZXQXVSWHJC?=
 =?utf-8?B?VFNwVHEyM0pZOXBZOGd5Z01HUFFaR2ZWZklRV2ZVMXFNelBrMU5JSXJOZ2Ns?=
 =?utf-8?B?N3lRb1Npc0NGOXIwSWJPRW01ZmU2ODBGdGRmdmtzZkhDSFhEWjFra0Robzl5?=
 =?utf-8?B?czNBQk1CQXZPUVdjdkc4Z0ZyeTZZdXNvOTBFc1ZyMVQ3NEVQL2xGQ3hDcFR0?=
 =?utf-8?B?ZHVDMkF4V1FVdUp1TlFOdWpldUp1YzBXUEUvaTUrcmoxY0NmN3NpQ2IxUC8w?=
 =?utf-8?B?c2dFa0p3aCtZbzhZdGtjYmRUYVpBdFQ1MlF0dmd5N0pxblBjWWxzU0FLQzc2?=
 =?utf-8?B?cjV3ZWJJV2NOZENReVlhY1BYWTlqS09WbHQ5dHFpTi9LVk41VU93M1ZUZVFZ?=
 =?utf-8?B?bjE0RzRob25UTSs0NlNEUW84b1g3UFJRY2tabXhVK28reWVWTHNLdlN1Y0M2?=
 =?utf-8?B?NUJQZmJyQmk2VDJ2UHl6UWkzWG16RGJXdmRWdDc2ajFsbnlSMllaYUdodmNz?=
 =?utf-8?B?Q3RVQzQ0aU9ybHgraFhEUjV3TEEyaWh3R0hkWjRWcHV6TzNBbEtXN0VkMVla?=
 =?utf-8?B?d2VKTm1kNDFHdDN0cVVYSFZIcDNIcVBBdzRSM3V0cnNGb083WFN5SU1Pb0ZB?=
 =?utf-8?B?cDg0YTFGb1JBYlNDTlQ3ZFMrenNQcXV3TXdkMzdoR21EVGZ4cEw1WGhMcm4r?=
 =?utf-8?B?R3ZGdHRWek5LczVGV3hhRTlSeXczYkNnSXFsS3F5YzN5ZmRhVXBad2hOUmxP?=
 =?utf-8?B?ejgrenpIUWV5TVhSOFUrckdpdS9uM2tpRTROdUlKT2lzSFZBWGZuaFA4SXFB?=
 =?utf-8?B?eXFvWUhMaGFLZEptUzNGTEJqV0FIdGt4T1lSUzN3L2ovYXZwY1hoc1JhRTBu?=
 =?utf-8?B?L1ZkVWZscEI2MFVyVmdxV1VNNzI4Rzg4c0xDK1lyY0VDZDlEK0xKMWE2SkxN?=
 =?utf-8?B?MzhNaGlVbUJGaHZwK0lDTnhNbVRYWWlRcWJUVFY5QVYxY2pxZ2NDRkZFL0d0?=
 =?utf-8?Q?yndo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGhiTEkxTDdUcWpka1FMNlBpN24zMnJobXJUUllsNGtOemdVTTB5dWNWd1NH?=
 =?utf-8?B?VS8zK0JVRkNueEZTVCthVmxNNjljcnM1cnpmNXZEZ3A5SXN4NTlseFdUWXVZ?=
 =?utf-8?B?eDUyTVRHR2R2TDdwc1dkWE85YXZzQWM3d2pYblpkTHdHVVpiUlhzSFVBMHlu?=
 =?utf-8?B?Y2hXeUJxZzJsZzUyVXJkSERNTldRNVZ1dHRRWVhRTHNHYUpxOFpSTkxPR0xK?=
 =?utf-8?B?NUR6ZGo5NkdpdlFrU212YzR4STJnODRjWFFsSXl5RmVQbzlEZThDLzVaNjFF?=
 =?utf-8?B?L25vczlIU1ZycHkwTDRlMjh5aXhiSjZtK2RvbHF6VkQzWXBwd0ZtV1QrRVlS?=
 =?utf-8?B?cUlROVMwWnl4S01yR0JjSlhDSXVtLy85bVQ5QkRGMHF3STZiQ1h5Ny9KZlpv?=
 =?utf-8?B?VndXM2N2QjZHMmIvNUkvclBTWUExUTl3d2lxRXFvUUxVZGVhTExvb1cyS1BJ?=
 =?utf-8?B?bUJWblN5T29WQ0RrWG1mZEhIRzBZMnVEV012K1FySFJOakVuMkQyMkFFbnlE?=
 =?utf-8?B?ZUJUdlAvSmloMUxwSjdzOHNFVmJCOUxwTG5LOTlLS0x5dHZRaENTM21NbjdE?=
 =?utf-8?B?LzFBL1hBa1JZOGI5Tjc0MFAzK25KZGM0cHNOMDkyNk4xTmo5aTVoK0piRnFV?=
 =?utf-8?B?aUNkVTl2cm0xaEYxNnFtQ3YxYVFtelpKb2tUV0JFUmxyeDJ4TTBST3l3NGQ5?=
 =?utf-8?B?bHNEYldjN2xSVlo1ZEk3S2pyejd6WWYvRU9oYjc4cXk2eU5RQXMwUFE1MXFF?=
 =?utf-8?B?MkQzMkpIcFJ6M1o3REQ4WG5OOCtmd04zLzgxN2RaQ21ETFp2QzFuc1hBd3pD?=
 =?utf-8?B?Ykt1K2ZPZE01VDNRL2thMXZHZ1cvMlJ2Qmo2WFlJN1lNQUZpeXAvc0xlT3ZZ?=
 =?utf-8?B?T0ZDWXZVajYzRXVEWUhIT3A5VkZZNXN6QTlJOUNEN0dRRTZkTkZaVmJMQjIv?=
 =?utf-8?B?OHgxcVZvamRXMzk0MlJpYkNQTTNKcW0vcUR2a0lXblRBRFpkWlhDbXlHNGNq?=
 =?utf-8?B?NndhSGtjSTQ3dTVWMHdiTXgweHpJYWhpRTJ4RXE0ZmoxdSttdURoV3JlY3Zz?=
 =?utf-8?B?RmM4MFBIbHIxUGs1N0ZXUHY3clZHcjFrL3ZlYi84eVlPc2l5Yk8rbEdReU9a?=
 =?utf-8?B?emNlVGhadkJXTWdDUzVoekJhNkl3eC8yVjByMjU3K3krMWMwTkNHT3h1YTNh?=
 =?utf-8?B?WnVCSEdWSTFwcmtyQmdPM0tpdXZxcTJERENoSU81dmxRcDl2L3k3R0VsZnB2?=
 =?utf-8?B?K0xPQXg4eEZ5V3NyU1JCeXBOLzk0MVU4bmFucnBnbWRoem1VTjhLS1UrNk1T?=
 =?utf-8?B?MisvWmhmdUlzMGlGV1hTZXFiSnhaUlQwWGpzMnUyakswNkxJOTlvSVlwc1dN?=
 =?utf-8?B?OW1xVFJxeTFCbDFVWmROU3lhNlJKTytlSHhEQ2tiODFxWWk3VFM1SFpJK3Rj?=
 =?utf-8?B?SXFONjlBNXF4UlRjZmxnRFY2RURTbzVoeml3bGNYVU1vTGF5blBjaDVROXhI?=
 =?utf-8?B?V1VHTXkxV29Yc3FDV0hGWWxPVHpHTXdOT2pUc3FFYzV5eFhRbStKZmFUQ0F2?=
 =?utf-8?B?T1RuVUpMTHBjb05mUU1aK3Z1bHUyd1p1NHY3Nk8wVHBZa1FkcWU4MFFKYmFN?=
 =?utf-8?B?OWx5SDdQTGhSM3F5THB6VDJRV0h0SXpESkFoeUdHK3BKelkzcEFPNEN6ckJ2?=
 =?utf-8?B?U2Y1WWlBZVVtVVdreGNlTDZlZEZlQzQ1aGdQbG9oaXVBVkFzZjNrN0hvTFNQ?=
 =?utf-8?B?SmRZRkJuU0RHZFNQOFd0TDk1OXgwYk5NNVM2bEVPR3d3bkZTd0VGeFlhRlV6?=
 =?utf-8?B?dVpmOFVmL0h0SGtXM2pETVNaUFRSTEtBMGFSTnZiNzgrNmc1TTdzdHZNOWV6?=
 =?utf-8?B?RURPY29IQVFkNEdkM2p6cFlRcVVKc3U0QTVZZHRqTklaOFpxMFJodndrV0Jh?=
 =?utf-8?B?akhlY1hhKzdyc0ZHR08rUGxYMERLUytxSXFlNEZQMGVEMEVhOTViTzRXWDhK?=
 =?utf-8?B?anpvZmtVUzJScTZKTU9LRWVvYmw0SHNMcGYrM2w0MkZMT25YRm1FWldQQVlL?=
 =?utf-8?B?cFpCc2lpd1d6a2E1K0dDTHFtUnZQeGozaWtjS2FXMGlJWnREa1VNNjhiTVFH?=
 =?utf-8?B?cnA0eGdXQ2wxRi92QTA5eTBpRE9nRml2TzViemR0cUVYT0FSV0ltamV3RDBS?=
 =?utf-8?B?c3JUaHRsaDR2eUhoTGl0Y2s0Nk5PcE9OYjNiRWpFK2s3OXFYMEV6MElTc21D?=
 =?utf-8?B?ZEw3V2VrQUR4eHhaeEJ2bCtHQ1pYbWoyQjVQeEN3UFRpYXZMcEpEaEFsU1h0?=
 =?utf-8?B?QjAzemJYWUJHN1Arb3VFYTgrb0J3end0Mk1EazltakRKTjluYVZmQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f792871-5b06-4b1a-1a39-08de687e1394
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 08:26:23.8578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZov2z+DjhBJZMVIjlOzgL/5cDsyvm3LSR7ATx1kmbJdziW9SG+kqTOg7IeHEzmRmtRHZBB/XU37z9U0gtRqOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5526
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,Mac.lan:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1A54E1183E1
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 05:15:24PM +0100, Alejandro Vallejo wrote:
> This enables very aggressive DCE passes on single-vendor builds in later
> patches, as it will allow most vendor checks to become statically chosen
> branches. A lot of statics go away and a lot more inlining will be allowed.
> 
> A prerequisite for such optimisation is to expand Kconfig to have the
> full set of vendors. Adds Hygon, Centaur, Shanghai and the unknown-vendor
> path. Have Hygon select AMD, and Centaur|Shanghai select Intel.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
> rfc -> v1:
>   * s/depends on/select/
>   * s/UNKNOWN_CPU/UNKNOWN_CPU_VENDOR/
>   * Removed "if unsure, say Y"
> ---
>  xen/arch/x86/Kconfig.cpu  | 43 +++++++++++++++++++++++++++++++++++++++
>  xen/arch/x86/cpu/Makefile |  6 +++---
>  2 files changed, 46 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/Kconfig.cpu b/xen/arch/x86/Kconfig.cpu
> index 5fb18db1aa..f895cfe97a 100644
> --- a/xen/arch/x86/Kconfig.cpu
> +++ b/xen/arch/x86/Kconfig.cpu
> @@ -19,4 +19,47 @@ config INTEL
>  	  May be turned off in builds targetting other vendors.  Otherwise,
>  	  must be enabled for Xen to work suitably on Intel platforms.
>  
> +config HYGON
> +	bool "Support Hygon CPUs"
> +	select AMD
> +	default y
> +	help
> +	  Detection, tunings and quirks for Hygon platforms.
> +
> +	  May be turned off in builds targetting other vendors.  Otherwise,
> +	  must be enabled for Xen to work suitably on Hygon platforms.
> +
> +
> +config CENTAUR
> +	bool "Support Centaur CPUs"
> +	select INTEL
> +	default y
> +	help
> +	  Detection, tunings and quirks for Centaur platforms.
> +
> +	  May be turned off in builds targetting other vendors.  Otherwise,
> +	  must be enabled for Xen to work suitably on Centaur platforms.
> +
> +config SHANGHAI
> +	bool "Support Shanghai CPUs"
> +	select INTEL
> +	default y
> +	help
> +	  Detection, tunings and quirks for Shanghai platforms.
> +
> +	  May be turned off in builds targetting other vendors.  Otherwise,
> +	  must be enabled for Xen to work suitably on Shanghai platforms.
> +
> +config UNKNOWN_CPU_VENDOR
> +	bool "Support unknown CPU vendors"
> +	default y
> +	help
> +	  This option prevents a panic on boot when the host CPU vendor isn't
> +	  supported by going into a legacy compatibility mode and not applying
> +	  any relevant tunings or quirks.
> +
> +	  Not selecting this options while selecting multiple vendors doesn't have
> +	  any major effect on code size, but selecting a single vendor with this
> +	  option cleared produces a much smaller build.
> +
>  endmenu
> diff --git a/xen/arch/x86/cpu/Makefile b/xen/arch/x86/cpu/Makefile
> index 7cfe28b7ec..84b060aa41 100644
> --- a/xen/arch/x86/cpu/Makefile
> +++ b/xen/arch/x86/cpu/Makefile
> @@ -3,13 +3,13 @@ obj-y += microcode/
>  obj-y += mtrr/
>  
>  obj-y += amd.o
> -obj-y += centaur.o
> +obj-$(CONFIG_CENTAUR) += centaur.o

Maybe I'm missing some context here, but I think this would break the
build?

cpu/centaur.c exports centaur_cpu_dev which is referenced from
cpu/common.c, and I don't see you making that reference in
cpu/common.c conditional to CONFIG_CENTAUR being defined?

I think the same applies to Hygon and Shanghai.

Thanks, Roger.

