Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH+sAYrggGleCAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 18:36:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7088CFA7A
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 18:36:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219020.1527889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmxpS-0003fe-Pw; Mon, 02 Feb 2026 17:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219020.1527889; Mon, 02 Feb 2026 17:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmxpS-0003dW-Mc; Mon, 02 Feb 2026 17:35:14 +0000
Received: by outflank-mailman (input) for mailman id 1219020;
 Mon, 02 Feb 2026 17:35:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTrP=AG=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vmxpQ-0003dQ-NZ
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 17:35:12 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83d39c88-005d-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 18:35:08 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY1PR03MB7239.namprd03.prod.outlook.com (2603:10b6:a03:534::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 17:35:04 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 17:35:04 +0000
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
X-Inumbo-ID: 83d39c88-005d-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/Iy5QDxEzuhh2nLpx1f0H/O9THpspzYyGIx6pn2aJ0B+uOlIVfDtF0xyVjS+6D/CKfpG7GyHagYMcXDv00fmP/EIR+/ZsMdf7GwBvyC+9P7WaPPGHc3StpK0tcS3PtTOG5jxxBIAZJ/DBhGDWcs6GbDpPyPe+i/ryqISZfMi4Vo3kuA4kCciJV7S36qNjXGnWTyJNjRHbIokHSXt5/yH7QWA+ui7ly2ZL4O8f4IuCXwVnOgMXMF7mzTy6HfzXb1OuhYnH329xpUBriwIEdOo27VziY8j023y7HmnKG4oni0zwMDNqL12FDm0RdF29nMvBxCw5yizp7xAsHqXwzyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNvclFP+ywsf4WVRKqo9u/R56b0LpU3bJ+R+u0YqUx0=;
 b=u9Q//kh01PUhbLi63FMgdg38aV4Bs8XEBU1spQXAjd5rS1cwcTV4dwQf5k0Wx5Syo35xw7CHOtKp3Aq75YgLssEiKm4K2CG17xViSenZnN05eZEDzCoCVSnlkDi01GiEUVmLYIYEgiBSDuneKO5MdbMhH+Nmv/a0FsYOVYUffhI9Bad4GK7DitQocTP4lPDa7btQc35vuqu4O2Nlb06Bv6mcIN7vPLG+WmUQ9igWyleKF6uCy+O1KSxVqqHq7+Jto2Ky8x2Ve594p3PGWtNngGA68gLN3EIE68GGtH8X+902l70W76BdEA5OmgXkuksPF71roxXSEyqaZCp7m3F41A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNvclFP+ywsf4WVRKqo9u/R56b0LpU3bJ+R+u0YqUx0=;
 b=XqjtfEt1AH6OnXBLAM7rGe816889UM0vFRxRY/Csl45slaUBeF+whUXTb/L5Z0Gmd6m2IfHM1qswvAhiCRgXvGXyEcffhPDMttKDN2NhAG8ENHv5BSW03bz9b3i8SyK0TRlPjbtReGhJLEawYj+YuN2wJZoS5Vx6DPYFOavMaLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 2 Feb 2026 18:35:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Penny Zheng <Penny.Zheng@amd.com>
Subject: Re: [PATCH] x86/mm: split struct sh_dirty_vram and make results
 private
Message-ID: <aYDgRamZZRNsYPXF@Mac.lan>
References: <3dce4f28-558b-495c-ac45-0f699da82458@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3dce4f28-558b-495c-ac45-0f699da82458@suse.com>
X-ClientProxiedBy: MA3P292CA0053.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY1PR03MB7239:EE_
X-MS-Office365-Filtering-Correlation-Id: 282b419b-1001-4cdc-5fcc-08de62816650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnBPMGphTlRnQUdaZXk3NVNLWlMyQjdhc1luWlJxMWVOckR0S3VrUkxQcVJx?=
 =?utf-8?B?WVp3T0tmMFMyUVZhOFVIM1NxeHF5YmplZ255UUppczgxbWh6RWxNSkFQQnVa?=
 =?utf-8?B?U2dwaHBkREwwakdNVDFPR2FGWUVjUlEwSWhuOFFlMTgwSzFRWkVQVlFEY3ox?=
 =?utf-8?B?bGljQ2FuM1hsQkF6NGlFY25YamRIcVRSLzlyNStXOS80cTRiNnJ2TXRYem5L?=
 =?utf-8?B?K2NFZU1MSjNJbDRsZEFLMjZtQjNyQ1gvM3FKRDk1QU9acm5pSi9UTHlDVkE1?=
 =?utf-8?B?V3NsVC9VLzNsRW5xKzdlZkNtZkl1T1kvTlVGSWM4RjVzTDhYMFh6UjFSUWxJ?=
 =?utf-8?B?OHU0S1BkMlFFeE1rK2t2RTNpaWRPbDd1VThNdXZZNnlQdnpsdFAxWXhTVndq?=
 =?utf-8?B?RXpwVC9ONW9oMEZDTVB3VHpDeU5jcCtpdEEwMU9DUzdRK0t2bmpzL3AwVUhq?=
 =?utf-8?B?SnVUcWdMNDl4WXEwbXFkK0wwUWFIRmhQWCtnVXVBYzZIckVMb1psSFVTYlJM?=
 =?utf-8?B?SUFCMTNDQ250UXU2RWFWOUtSRFBZU3ZwcXE3c0ZWUUhiRGlMY2JMNGc4WitY?=
 =?utf-8?B?VkIvYlV3N3hpRGVNYVhSNUxybVVtUXRWV3Y5Q21JT1YxU2RNem5aajY3T1k0?=
 =?utf-8?B?a2VWS3RYL3p6bGNiV1NMNyttYU1mNW11T1RzZkxnTFBNYU1rK2drUEpuMnZz?=
 =?utf-8?B?WEVIa0lHNXhXcy9lMWVhWjZkMEcwcVBvVFE4ZnA5ZDZmd0FyYW8xRi80bkp6?=
 =?utf-8?B?VFh3Wk9CV2c1Z3Fjd2J4OG13VmdqMGMyZ05RQ29GeEZMU0dDUXZ1R2MzOVh2?=
 =?utf-8?B?Smp5aUtuYnVqbm94Q0EvS2QzV1BqMkErbnNXdHZMcW1WTWV4bHNZblVuUnVM?=
 =?utf-8?B?OEYyTU5LaGswME5OMHllYkMvR1JZdGJtSTg2aUhxaEJpcTNXb1g0NkJ5UFg5?=
 =?utf-8?B?aU56WFFIYmhQeXRCdGphVFRBT0d6czBPYXc1UXZxMlBFY0RFQUlmNU53eDFD?=
 =?utf-8?B?aXVBVkY2bmt3aS8ySGZjMUo2c2NZbzI3UStqQVV6NGRtSng4UU9HU0FDSlR5?=
 =?utf-8?B?RXdnZ09DM05JdHZERk9PTXVzRlJyMFlTZU5TQVVTN2Q4MUx6QjJ4YlZKY1d0?=
 =?utf-8?B?b1lDM3NKdnk4RURJVGJkMHpBQ2ttQ2Y3bDdWZFRkaTA0N2lSSTZNWEhYK3dZ?=
 =?utf-8?B?UDJUc0NZT05TK3lrYmdGUnRXMFhqTVJHMHNQZXZQUk5Fb1hrOUJtdEF1QmFJ?=
 =?utf-8?B?eG42OFpHNStHc3A1bWtZSlBWUHJBOXZQOEFZb202dDE2eGQvbS9uTGVIMnFq?=
 =?utf-8?B?WmtJRzhKOEg3aW5GUHp2ZUQyc2lzSzF4ZVFMM1plYWFoOUxidVJaT1Jxejlk?=
 =?utf-8?B?Mlk5bkVkME1mRldlQ29kYmMzZEEyZkZUYm4wbmdpOVpsSWQ2eFJwWUJLM1VR?=
 =?utf-8?B?dnZGc2xRQ0pMOUFXQmd4dnNVZGFpNmhDbThVZktiZmZOd3RoTy9zSk9uWnpC?=
 =?utf-8?B?ZVhGZnNkVkRITDd2a2lWbGludVhIa0dnUlRlRUZUbXFZZWVndzhzZHdFU0NC?=
 =?utf-8?B?Q3RqTUt5bk1LR3hYQmtjciswbFVTaFpBN1U4aGlHUGNKOHdWbTlUZnFCcGY0?=
 =?utf-8?B?SFlPVE05SCsxWFlJWEcrd0pEYmtTQ0Njb0hpN3E5RWtuaGVVNTFaUEFEbUNo?=
 =?utf-8?B?R1dXVlJuK2RQTVVrbmtvWis2Mjl1MHJjcnkrc1Z2d0U5MGpQUG9CdnQ4MnM2?=
 =?utf-8?B?c3cxK1JlQm9zUEZjTzJqSk1CM1EwT0Q4TE9iVHp5TWl4a05LRkNXelRCTjFH?=
 =?utf-8?B?M0dxVTBMZm0wQTY3YUVaNnJnT0w2UDdiVzhpUCtZdUhMUzZrUmxYMTQxdGR5?=
 =?utf-8?B?WEo4aG53UXJRS0o0UjU2VGFFM1drcmZsVXk3RzZqV3pQQitGd20vZGVmc3N5?=
 =?utf-8?B?aDNzQWtzYktQZlZBanVuNnhBWk5ZVVJpNm4yUDJvVGpsRnAxSis1ME1OVnJ0?=
 =?utf-8?B?R1Vqa3pSV05sNy9UbHNlTHM5RTBHM3ZhNFZmUWhwRGVkWnpOYWVVb3lYQ2dH?=
 =?utf-8?B?eE9wczhkb1FSTVlYVW5qY0R2cHRpUW53SmRZM0UzT3Rqb1FDZWF4YlROVStJ?=
 =?utf-8?Q?ipgM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wk51SndHVGdBZ3kzRUtNZXhmb29QQ2pEQ2VUTFVJYWYySFJpTlBIbDFWQXBs?=
 =?utf-8?B?QUllNjJjVU1SVGpDRFExTVpJbm12Ky9kM1U1dURQUEIyR3ZOaWpXZkM1cVJt?=
 =?utf-8?B?WGRnOExoVGNHNjEwRDFHOGVyTmNIZWduUnVoMzhYTUVGOXlJSnlrUTg2RmFB?=
 =?utf-8?B?Qm9VeCt2YmxTUTlpN0pBeWxkU3lMZVRLV1JmbVhGYnZwbGRtdzNtcHFuL3pX?=
 =?utf-8?B?aHBCVzNLYXF6QTVMMDZ4bGpGR2NKUEdxTEZ0cWFwejNvSjBhVVVPWGNVdnU5?=
 =?utf-8?B?bnh6QnRxckZiUjYzUmFVMGhnQmZTSkJtbjZZeklCVmpWOWd6dXBtUjZ2Ynp6?=
 =?utf-8?B?YzloeUFrd0RGQWlYQisyYWpCZ2VwOUZLTmNtb2RFbENxRm5DaytOL0kzRTZ3?=
 =?utf-8?B?V0g3eGtNOVNwM3UyaGdTZ1lFRTJHUlZCakRxckt1UlBWb3NwNVJpQ0dHMFRV?=
 =?utf-8?B?ME96OVNYdW5CUm5IMGx3dWRXVjE5NGJneEozVmxRMjROSE96QVdFWUQ5Wjdl?=
 =?utf-8?B?bjNFck93RGYyeUR2UU5jbkt5REp0aUhPR0FPM1lYMnR1b3l1UWZ6cGxZYzdV?=
 =?utf-8?B?VUpHeE1YemNTcGRDbjZKVkFJclZ6dm1VeGdQUzVnTE5vQzVYQVBod204Ni9D?=
 =?utf-8?B?K3JsQlRDVFg3YWdheFZGTHJvQW1HemtRV3R4OG5BVDY2Y1VMUHVSYkttaXFP?=
 =?utf-8?B?VGtGOHQwNVQvOWRpZ2NrUERKcmtpL1BCaTN5WGJONlNBS1VSZFovZU9pb1g2?=
 =?utf-8?B?bWNqd2tMVzRkUWVLVTFaa1YxUk1EeFY5NG91ZHVzRkZyK2xDSDlmS0N6RE9T?=
 =?utf-8?B?NFd5bWpuY3hwZW1WN2dKYkl2MTVMcFhvU1Rud3RLOEhtK0RsYVkrZ1JBUDRm?=
 =?utf-8?B?WGNwZDIvWlhRZmQ3dkg2T3N1SVFhVlVUTk9QS3A2NVNWVHQ5TGFqUVdBSTZn?=
 =?utf-8?B?dlEzMEdNNkVqZGQ5MFE1WVc3L016M05wUFhJcXQrdGRKQjF4MDdnZWxqSXVt?=
 =?utf-8?B?cTh0Zm5MNFBJTVlHYXIxd0w2WlRRM3d4bWxtQ3IrNjhDb3FrbC94NjZKYy93?=
 =?utf-8?B?M0lpaFZjWlAzOHMzU0ZzTmhtL2ZXYnA5bHlnR0dZZGVNcHdtcmRKcE56eStJ?=
 =?utf-8?B?cTJrSmpBRXI5TDcwQUNzZVBQUEUyVEwraE14dmhCVVhpSU9NWGFlUDhOUXZp?=
 =?utf-8?B?MHhhd21ncVd3MktCNllEY210NzA0cmgzVTR1SW1MVXYxdHJuQXV5aXpRc3Zz?=
 =?utf-8?B?TU1nS1FaeEI1S3RBMC82aWVxZm51S1ZjS0NXZ0pYdzdpN2FoQ1ZHZk1UTTJh?=
 =?utf-8?B?SldFa3dnUDBzUHhMTVJBeW8zWmtTZWg3NHplNDFveEhHUm9pVTJrOU4rNXdN?=
 =?utf-8?B?a2NQUFJPekJIYmxzalFuMUdMdDhEVW9UWUNsUDI2eGxZSHlqV0NSY09uVmhy?=
 =?utf-8?B?bTVOcmpWRmE2MXRBN0d4OGRlYUJEbWIyRGtqOWg4QzlEcDFIamYvdXVlR3Y3?=
 =?utf-8?B?a0ZlbHRrc3ZqY2lFL0R4ZjIvdlBySDdtOHBXK0IxTFVDT2t0WmFVSmxqOXVn?=
 =?utf-8?B?dkU1WHpHU0dZMC9CSktVU0lZdmNiTk5wcDZ5VHFTeUV2YXBEZE15VGFnK0tW?=
 =?utf-8?B?Y3hsN0pnRUdNRS9lM3NxRDg3eFloK1VzVjdoNDJCODI3YmUrZ2ZtTlBHT1py?=
 =?utf-8?B?MmJOaVlVK3cvSkYwUGNDR1VVSzBkWDcreTBzRGFVbDlUYXZVbGRjM2t0QlFW?=
 =?utf-8?B?dWZFMSttKzJUby9adkVLcDFnTDFLZEcxOXFKQ0xteUtRUSt5bHVxSXIzVVRJ?=
 =?utf-8?B?U05DR0Y0WXRSZEIxZTM4T245SDV6bXA1TFVCZFFQdGJVVzdpQUR4bVhFSkcz?=
 =?utf-8?B?Q2Y1M3RKdEZ3L0lDZUd5VlQzWjVEdkJDSFJLaVExV0V1cFBQdkUzMG9FWit0?=
 =?utf-8?B?R0NJbXBjQzQ3THl0OHpBMDZNSys0cXRrVzlGandLd3V1VU5Ed05oSGZkTUwy?=
 =?utf-8?B?amc1TkUrc1c0S1ZyK1ZMSGpTaGNLMXJtUDIzUldFcEV6VENQaEpCK3ZOb3pE?=
 =?utf-8?B?UjVTYy9odVNNYlIrZmRRS2RXUll2REd2QlJ4STlTMFdKMGVnSlVtZUgrR3lh?=
 =?utf-8?B?UlYxWWVZeUNydjVKSVhXLzdSMU1KM2xZVTFrZzhVQUFOQ3ByRVZQUDJjM1Fp?=
 =?utf-8?B?MGdRTUhSdExtNDd6allHNW5PODArNmJLZkQ4ZnBZUms3WTArZ2RXL004azZF?=
 =?utf-8?B?Mk9uK2dyakpvQTNSYVg0UE9hS0p2Zzk1ZXpTalA3T3p1R25ITXBPQkJrdW1t?=
 =?utf-8?B?UmR0UGZaTTRmRzBDc1N6MDBFTGdJNTg3bGJ2aGVEMWYrbThRRHZKQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 282b419b-1001-4cdc-5fcc-08de62816650
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 17:35:04.2196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RnD+v3Oimrbda7ZNY7M8wZVFG/W1eUvKTQxf43NlxKQowDFTQiUsiSFRGuymp7dEAPxFMpPKdZjrplZ5Ul2NrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7239
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:Penny.Zheng@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D7088CFA7A
X-Rspamd-Action: no action

On Wed, Nov 12, 2025 at 04:47:31PM +0100, Jan Beulich wrote:
> The types are local to the shadow and HAP subsystems respectively, and
> HAP has no need for the shadow-specific fields (i.e. it can get away with
> smaller allocations). In struct hvm_domain it therefore suffices to have
> a union of two (generally opaque) pointers.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Just some minor suggestions below.

> 
> --- a/xen/arch/x86/include/asm/hvm/domain.h
> +++ b/xen/arch/x86/include/asm/hvm/domain.h
> @@ -95,7 +95,10 @@ struct hvm_domain {
>      struct list_head       pinned_cacheattr_ranges;
>  
>      /* VRAM dirty support.  Protect with the domain paging lock. */
> -    struct sh_dirty_vram *dirty_vram;
> +    union {
> +        struct sh_dirty_vram *sh;
> +        struct hap_dirty_vram *hap;
> +    }                      dirty_vram;

Other in-place declared structures don't use this aligning.  I have to
admit it looks somewhat odd for structs like this one.

>  
>      /* If one of vcpus of this domain is in no_fill_mode or
>       * mtrr/pat between vcpus is not the same, set is_in_uc_mode
> --- a/xen/arch/x86/include/asm/paging.h
> +++ b/xen/arch/x86/include/asm/paging.h
> @@ -133,19 +133,6 @@ struct paging_mode {
>      (DIV_ROUND_UP(PADDR_BITS - PAGE_SHIFT - (PAGE_SHIFT + 3), \
>                    PAGE_SHIFT - ilog2(sizeof(mfn_t))) + 1)
>  
> -#ifdef CONFIG_HVM
> -/* VRAM dirty tracking support */
> -struct sh_dirty_vram {
> -    unsigned long begin_pfn;
> -    unsigned long end_pfn;
> -#ifdef CONFIG_SHADOW_PAGING
> -    paddr_t *sl1ma;
> -    uint8_t *dirty_bitmap;
> -    s_time_t last_dirty;
> -#endif
> -};
> -#endif
> -
>  #if PG_log_dirty
>  
>  /* log dirty initialization */
> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -36,6 +36,11 @@
>  /*          HAP VRAM TRACKING SUPPORT           */
>  /************************************************/
>  
> +struct hap_dirty_vram {
> +    unsigned long begin_pfn;
> +    unsigned long end_pfn;
> +};
> +
>  /*
>   * hap_track_dirty_vram()
>   * Create the domain's dv_dirty_vram struct on demand.
> @@ -52,7 +57,7 @@ int hap_track_dirty_vram(struct domain *
>                           XEN_GUEST_HANDLE(void) guest_dirty_bitmap)
>  {
>      long rc = 0;
> -    struct sh_dirty_vram *dirty_vram;
> +    struct hap_dirty_vram *dirty_vram;
>      uint8_t *dirty_bitmap = NULL;
>  
>      if ( nr_frames )
> @@ -66,17 +71,17 @@ int hap_track_dirty_vram(struct domain *
>  
>          paging_lock(d);
>  
> -        dirty_vram = d->arch.hvm.dirty_vram;
> +        dirty_vram = d->arch.hvm.dirty_vram.hap;
>          if ( !dirty_vram )
>          {
>              rc = -ENOMEM;
> -            if ( (dirty_vram = xzalloc(struct sh_dirty_vram)) == NULL )
> +            if ( (dirty_vram = xzalloc(struct hap_dirty_vram)) == NULL )
>              {
>                  paging_unlock(d);
>                  goto out;
>              }
>  
> -            d->arch.hvm.dirty_vram = dirty_vram;
> +            d->arch.hvm.dirty_vram.hap = dirty_vram;
>          }
>  
>          if ( begin_pfn != dirty_vram->begin_pfn ||
> @@ -132,7 +137,7 @@ int hap_track_dirty_vram(struct domain *
>      {
>          paging_lock(d);
>  
> -        dirty_vram = d->arch.hvm.dirty_vram;
> +        dirty_vram = d->arch.hvm.dirty_vram.hap;
>          if ( dirty_vram )
>          {
>              /*
> @@ -142,7 +147,7 @@ int hap_track_dirty_vram(struct domain *
>              begin_pfn = dirty_vram->begin_pfn;
>              nr_frames = dirty_vram->end_pfn - dirty_vram->begin_pfn;
>              xfree(dirty_vram);
> -            d->arch.hvm.dirty_vram = NULL;
> +            d->arch.hvm.dirty_vram.hap = NULL;
>          }
>  
>          paging_unlock(d);
> @@ -630,7 +635,7 @@ void hap_teardown(struct domain *d, bool
>  
>      d->arch.paging.mode &= ~PG_log_dirty;
>  
> -    XFREE(d->arch.hvm.dirty_vram);
> +    XFREE(d->arch.hvm.dirty_vram.hap);
>  
>  out:
>      paging_unlock(d);
> --- a/xen/arch/x86/mm/shadow/common.c
> +++ b/xen/arch/x86/mm/shadow/common.c
> @@ -2886,11 +2886,11 @@ void shadow_teardown(struct domain *d, b
>      d->arch.paging.mode &= ~PG_log_dirty;
>  
>  #ifdef CONFIG_HVM
> -    if ( is_hvm_domain(d) && d->arch.hvm.dirty_vram )
> +    if ( is_hvm_domain(d) && d->arch.hvm.dirty_vram.sh )
>      {
> -        xfree(d->arch.hvm.dirty_vram->sl1ma);
> -        xfree(d->arch.hvm.dirty_vram->dirty_bitmap);
> -        XFREE(d->arch.hvm.dirty_vram);
> +        xfree(d->arch.hvm.dirty_vram.sh->sl1ma);
> +        xfree(d->arch.hvm.dirty_vram.sh->dirty_bitmap);
> +        XFREE(d->arch.hvm.dirty_vram.sh);
>      }
>  #endif
>  
> --- a/xen/arch/x86/mm/shadow/hvm.c
> +++ b/xen/arch/x86/mm/shadow/hvm.c
> @@ -1033,7 +1033,7 @@ int shadow_track_dirty_vram(struct domai
>      p2m_lock(p2m_get_hostp2m(d));
>      paging_lock(d);
>  
> -    dirty_vram = d->arch.hvm.dirty_vram;
> +    dirty_vram = d->arch.hvm.dirty_vram.sh;
>  
>      if ( dirty_vram && (!nr_frames ||
>               ( begin_pfn != dirty_vram->begin_pfn
> @@ -1043,8 +1043,8 @@ int shadow_track_dirty_vram(struct domai
>          gdprintk(XENLOG_INFO, "stopping tracking VRAM %lx - %lx\n", dirty_vram->begin_pfn, dirty_vram->end_pfn);
>          xfree(dirty_vram->sl1ma);
>          xfree(dirty_vram->dirty_bitmap);
> -        xfree(dirty_vram);
> -        dirty_vram = d->arch.hvm.dirty_vram = NULL;
> +        XFREE(dirty_vram);
> +        d->arch.hvm.dirty_vram.sh = NULL;

It would be better if this was done the other way around, first set
the reference to NULL, then free the memory?

        d->arch.hvm.dirty_vram.sh = NULL;
        XFREE(dirty_vram);

>      }
>  
>      if ( !nr_frames )
> @@ -1075,7 +1075,7 @@ int shadow_track_dirty_vram(struct domai
>              goto out;
>          dirty_vram->begin_pfn = begin_pfn;
>          dirty_vram->end_pfn = end_pfn;
> -        d->arch.hvm.dirty_vram = dirty_vram;
> +        d->arch.hvm.dirty_vram.sh = dirty_vram;
>  
>          if ( (dirty_vram->sl1ma = xmalloc_array(paddr_t, nr_frames)) == NULL )
>              goto out_dirty_vram;
> @@ -1202,8 +1202,8 @@ int shadow_track_dirty_vram(struct domai
>   out_sl1ma:
>      xfree(dirty_vram->sl1ma);
>   out_dirty_vram:
> -    xfree(dirty_vram);
> -    dirty_vram = d->arch.hvm.dirty_vram = NULL;
> +    XFREE(dirty_vram);
> +    d->arch.hvm.dirty_vram.sh = NULL;

Similar here, I would change the order.

Thanks, Roger.

