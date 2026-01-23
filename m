Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uO5UBBKic2lqxgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 17:30:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F067884A
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 17:30:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212388.1523557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjK2E-0000Z6-Rk; Fri, 23 Jan 2026 16:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212388.1523557; Fri, 23 Jan 2026 16:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjK2E-0000We-On; Fri, 23 Jan 2026 16:29:22 +0000
Received: by outflank-mailman (input) for mailman id 1212388;
 Fri, 23 Jan 2026 16:29:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Sxq=74=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vjK2C-0000WW-RG
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 16:29:20 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa5613ee-f878-11f0-b15e-2bf370ae4941;
 Fri, 23 Jan 2026 17:29:19 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN9PR03MB6073.namprd03.prod.outlook.com (2603:10b6:408:136::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 16:29:16 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Fri, 23 Jan 2026
 16:29:16 +0000
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
X-Inumbo-ID: aa5613ee-f878-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jtkr/L1ItME57x83BnfaXuziLuT8IJtnY/JD6NvEsFuM9fm/IOb/wwAMl5RxXY50g9V7yEQv4EEtTy1fvG23fo49NHcOz/zul6AP+tHIY+DnHSYaQUSQT1HFMf832VHn1CdexFFROqq2IR8Od4QHNeM5CATZNGM/l8tHaamT15AZlxn8++d2X55qC5hmGgyT9c0C2Z2BqyTFUmNjuBFRm6/LF2H4WDW1211C8c0HqePsVmMWdaghl8yE2Lv36a4wLXzIDpi8eI7zR1GbH6YS7uCJvkYFoKRVXUWyL+m+AyCqUjK2xzFpDUYhzwvN6zFHUcTu3jPYdrFwqH7J6zZ/+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEOtKeBGlUPLIMFURNRfGSxbS9QzFPGX1/pq2kd9dcE=;
 b=IVzP61+F1HxOxpWd08i08kuKZS3vniBzQ0tce6W7yUWj0bFCS2mmTgC0kg4mAtKWUv3Pl5R49jWmZkY/o36/hzWYoT+I3dD/hXKFD3ABvj2XB/9WhB/E7vtRlAZJKhC8B0EI1D2MsJT3FShEpX1RF/OF4r5sxzTlKbZDYDAMWq9ux+K9n02dQ/IjfVydGkxQWxy8Wm3NNb/aTQAn5wNMTKuvGPmVvt/x33sR6WDQ1YCE+KUmAy15G+jtL0hsnccgs7F85gA6ziwth4wOqWsJvFovvfFLYYRpbLrBh1bpMFVMvrJ3A949tgYq6oZ36qjItCl7VHhziCOnx/RlNtbg4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEOtKeBGlUPLIMFURNRfGSxbS9QzFPGX1/pq2kd9dcE=;
 b=MPQw/Nv/eOrPKKIDkJ4zkQfa6Y7e1GKo7QlQkHZqZH4PQO/N90DNKQCCEgE0ghTJ0Mqzthit0sBaDAHPVpf+Lt1p3i4gwgBmdLhqo/2qjNTmKdkhcwXGoh669RNZcWINooWofG4wtGVmKwWqSfLpkt4EAGktesOG/exXS/ohBTU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e5e222e0-713f-4e5f-b3f3-da71dc2829f9@citrix.com>
Date: Fri, 23 Jan 2026 16:29:12 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH 1/4] x86: Reject CPU policies with vendors other than the
 host's
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
 <20260122164943.20691-2-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260122164943.20691-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN9PR03MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: 856dfb93-1f76-4b00-cc02-08de5a9c8ce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkVqU0dqbHNKZ1cvZ01BRzkwdzcyTlRzTm1sRlBGS3ZaMlNSVkdUNzNNZHY4?=
 =?utf-8?B?R01sZ2hpaFFZci8zODFwQXdDbUZvYzREQTlNSGJPQTF6ZlRRUjFnckYrdndL?=
 =?utf-8?B?ZlVKZys3Z1JyMk5UM3RvZEdtVGRvNzJIaHh4dmRWY2Y5RUpUWUF1NElLYmlR?=
 =?utf-8?B?N3hlSFVnT0t4cGNmZmk4ZTVuTDBDR0c1TDZiVHZKckM3Qk5aQkw2ZkVobDJ4?=
 =?utf-8?B?bVNvWFFOYjJVaEFJbDhWeTR6SUdmMlhyeG9IVEE4RzdMNzJQSldQOVM4M0dx?=
 =?utf-8?B?M0FZWmZHRWFSdzNLTVBHdndDZFByZzk1cklzRFZnM01JV2hxaC8vaXlsVzNP?=
 =?utf-8?B?Y3F5ck44bG5UQXI4dDFrSThwMWMzK3FvZXY1MEVLT1lTYytPVlFPWkh3T25n?=
 =?utf-8?B?WW9QZFd0VnNKcVpsY1ZFNDB6ZEo0K1ZCU2FKZU56OW1Ba0Vwbm9xeG9aN2Qr?=
 =?utf-8?B?OU9SL1NQK2c1dy9pK3hVbm5IbWV4cU5YQ3g2TWNkWUQreUI3MTUybnAvZS90?=
 =?utf-8?B?WExpTFFQTzBuKzVpd3RKVWlKVXZ6eVc3SEhpMXR0UWkzUWNsa2szVXgraW02?=
 =?utf-8?B?L056UE44V2RRejdHRWpTU2V2ZWNMODZONUpYK0t3d21JKzR6ZzVHb0QwajdH?=
 =?utf-8?B?azRndkI0NWlmeXRmbWx5aytxL0p5QWFPRTk3eE1EdFlYb1FkeFRsQjlqRkVD?=
 =?utf-8?B?bWV0WmtNTUpPQXRuWnJQRkpKVkNSZU9Wbkh1bDYwUDBSd0E3b1YzRk1xeHVD?=
 =?utf-8?B?MGVqWG92Q1p2S2RDdW9LaVNLdmp2TnF0dUZBTmthdTRpcjNyZ0crdlZyRWh0?=
 =?utf-8?B?VXdDbnhETU91TTJGaFdrZnVna1U3R0Z0WFpmY1lUNUNMbURHUnR5Y1JsTjgv?=
 =?utf-8?B?cWhYM01pRGFMajhMMmVUVHJzVnhMdTFWNzV1WWpacHBraHlrcVN4cGZWY08v?=
 =?utf-8?B?aEVvUWxPT2xRRldycnpKNnZoaWc3cFIwTGhtS01YUkV3Vkt1T2NJSkxSRzda?=
 =?utf-8?B?QnlBUlh6a3JrOTVHTk5pb0JyTWJMS0dhN1VRN3FhTEU0ayt6NERBT3g3dDIv?=
 =?utf-8?B?TUJNNjR0KzJoK0lUZGYxSnlHRnZPcXY4VDZTMjByOUNFaWlFV1BkV01SWEEx?=
 =?utf-8?B?ZmFQdnI3dHlmMzQ0UjkvYzhSZklpemlmZGt4UmZhdHByamk3UWdYdEV3ZWxU?=
 =?utf-8?B?NGNvQktNTkhZM0pVcnNXa204anhaZGJHeGNVUDlIOUVCQ1FjVUJXejJ4T3lp?=
 =?utf-8?B?aUhTZW5kcnIrakdBMnlqaFF3OERxcDlJSURSdmF5SnI3bUhna0JHVVdlYnlD?=
 =?utf-8?B?d0IvWHRQcUF2Z21lQmZsTW1XVmdDZlR0ODVGc1ZLTHJsWGdheThVNmdzMWZS?=
 =?utf-8?B?bGEzMG5ORkZRTFloQmdaOWY0V3E0aVZJdzhvNCt5L0xwNjd5SUU1RDJQNHMz?=
 =?utf-8?B?WjgybHFiSmJrN20xb1ltTmE4elJ1UlNjUUxVQ0pTWXRIY3hpZ1dXbDhxVS9Z?=
 =?utf-8?B?TW9tbnhDbzc4aWRRMndmNTM3MXlGMUlmYkU5QWh6RGViTWF6Wk1FUFJxVTcv?=
 =?utf-8?B?aWp1VlZ6RnVsSlNjYmFPUXlCQnl1cHk5MmZmQUx0NDNJWjlveklpaDYzRXBq?=
 =?utf-8?B?MU9TRUdDQmx1WlJqbmRvM3JUNndlVldFMGJVQmFienhwbVBmdmVrNVZDaDVm?=
 =?utf-8?B?YXB5U2N0UHBUZkhnbmdIb0ZyWDJJOUVIc3F1cDl2aVc2ZmZvNVVZaTNjSlY2?=
 =?utf-8?B?S3gyMEVrSjloakM4eU1ZblROcm1lU09wMzhzeDlUTVQwcjhYSDRuc2tmdVlU?=
 =?utf-8?B?bk1Mb2JhU3dESE1QU2JGVnlPRmYwNkpPcXlmYUpicTdGeCtMeVBkS2k2ZTAr?=
 =?utf-8?B?VUhhM2ZnY08xQTIxMy9ObVBFTGFMalRqQ1F4NjJPZW1qOGV1YnFxVlpnNFRi?=
 =?utf-8?B?eThtM2NCNjZvU2hnU1ZhejlPeXZVakVuTW9ZZFkyMEl2Z3lCWjgxcnNleU1o?=
 =?utf-8?B?a2tUODBydmpWYVc0K1ZCNlBlUXFuYkxZVVI2YW1rNXhianlNb2RtZzUzTGxU?=
 =?utf-8?Q?PejHFl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVlHOTlTYytZSWFmU1pNcmlnVTNsTVJ4NlpId2ttSjdEbjczZzQ2V3VxeWxz?=
 =?utf-8?B?ZWozTFYzWDBBS0FXRitwbHdlMGwwVTZBSUZHSXowcWhxb3FJQThTalI2VGli?=
 =?utf-8?B?UGpNc0VJelpRTXlIYVIzWVhuTmh0R0N3dmxtTU5zSFdHK09TRm9GekF2YzR0?=
 =?utf-8?B?Q2NNT2EzaU8wR3JXNXhyc2NqUklTQ051UjFWWXZlSGhYemNvREZIeWNlWk15?=
 =?utf-8?B?TXhHV2tLSjFxa2RpMEpISHlZQU9ZREl6KzByMEpncThQRUJwME53dHR4UFBi?=
 =?utf-8?B?U2ZNclNpRC9aazA3YXgyUWY1azNub3FJTTdrZXQ1YmVERnpKanc2OURVVlpQ?=
 =?utf-8?B?OWxhdmszUis2QUlNZmVJS016RTJlQ0laUVp4VWtPajAzMzlrWTB3RGc4bHY5?=
 =?utf-8?B?ekZoSmRwTk03aXRnSHo2eWlYRGJQUlRIN1hCSTZoNFRKTFFyOGxRVGFDcVBQ?=
 =?utf-8?B?ME1OUS9tV1BRTmlHbmJoNUhaU2NjWDZmQkxYbHJoMGR2czNRS2lWbDF5Wk9n?=
 =?utf-8?B?d1hFTVVUQytJRHh4RldFWE9SUmoyZWpUR2JpWHBSWDFSQkRJOUt1ZDRoWEY3?=
 =?utf-8?B?NXdSQmp4Uk1QWVNRcDJQRnhad3dnc1htcmt3ZysxSW5mVGVQQTZIYU9hREVp?=
 =?utf-8?B?QnQxdnRKWW84b1pNT1NVb0NGR0hMbGN5c3grMXA5eTZtU2xPZzhQd29pYVJY?=
 =?utf-8?B?TFFKNkN0VytXamtjdmJZVmJ5VU9qYmtMSm1ZOXVZaDRXcGc3VE5NdnQxcmRm?=
 =?utf-8?B?d2t0OTBvbkE1TVVPS3ZiQ3lCT0h0OU14SXVIaktRKzNQY29GVVh6SUhhZG4z?=
 =?utf-8?B?T3NoNHcwRlQxR24yTERyMmlVZ3pFcXNCcUE5K1dFZk1YellNckJOalV5Znp6?=
 =?utf-8?B?MkxZdkRYYm5NanIwdVRsV0NMcE4wREE1MTY4TmxXUU9Xdmxva0xPOXN3dTRX?=
 =?utf-8?B?VUNsWnlsK2ZIN0M2NGV0ajJnWTBiSWVnSWE2dkkwN01tZGlIVVNqbHFkV3JS?=
 =?utf-8?B?cS9DdDQ3bURCY1pnOGVpcWpHMU9henVGMFpJZlJPL2JwS0w1Vmc2NlRoZlI5?=
 =?utf-8?B?Skd1SW1EdVdJMS92SVRCbnBGeXEwakhYd1ZmZkFIZ0FlSlVNNUVYcEpLaTcy?=
 =?utf-8?B?dnFiUWltZTI5MVdxWjlKOEJ1d1JBRnZXcmdNanJhSjRxUkxmZnljbGIwSHNp?=
 =?utf-8?B?c3pMWXMvT0dmMHA2QnVON2pkeXl6QnFUQXBYUFRwUmJBekwrOXZ6NUErNXZj?=
 =?utf-8?B?cXQ4R2tVcnZPY3B0U04wY3gvTSt6QTkzVDg5ZEVtVnYvUFpGZGkvMEtFdDF5?=
 =?utf-8?B?UngySDBicFlURkZzR2N5ZzV4QXZLOGdBUFBNUVdTTk5yQ04xRzU2N1FsNmNG?=
 =?utf-8?B?N2k1V3B4SmNFWkRONHZEUlVFL2d1NU1tSmhTUHo3M1NOd0FqVTJsMERuKzFv?=
 =?utf-8?B?dDdkK0F0TTN5SmFWVlJ4ZGtOWFBxY1RPeUJobTBGTm04alRhcWp0WThLQWlI?=
 =?utf-8?B?MVo2RjM1MllacFpRYTkzRmxjeFplYk0zdzJkVy94NW4ydTd2QytBTkZQV0lz?=
 =?utf-8?B?WU5Fem13SWVxZ0NYczIyMTJyU3gzVDhKTVFLYUwya0o5VGo4RHRtV294UGZD?=
 =?utf-8?B?WVR1dmMyTGZDd2MyQlNxWGNWVWNEYUNjeVlUeit0T3RPMDhDMWUxNGkyZmNi?=
 =?utf-8?B?OWtFVmFpdDFMMmRndG14bzBnWS9xbzZ1eHp6ZlcyaVU2OFRrSEhGVnZ1Qk1q?=
 =?utf-8?B?NkJySXhBQzRzRGZ2T0gvQUEveFY0U3hEbUpXMlpBcWZ2NytJTlNXbXBPZXFp?=
 =?utf-8?B?eHVsTUpGVDByNkxMY3V5S2VvVG5HOGNtTE5HWFRyd0ZmNzE2Q0l0aEQzVzV5?=
 =?utf-8?B?cUNqNzVjdWpLZlJ5YkhDazBINkx0cTNOdURvQkcwV21hc2FOQVZhMnd3cEw1?=
 =?utf-8?B?ZzdwenNxM3c3S3VLZmVob1FPaEJmT0tjRjBrMG1HVEFibU83TDZPM2NXcThw?=
 =?utf-8?B?WXN2RGI0VFVMeHBmeDhkL1FXWnc5dHlnaDd3bVdQN0VaUmgrbDJHVjk5RGFV?=
 =?utf-8?B?YSt4QTZKMjFoSXFkTHByZHBpS3N6cE9rbndQRWs2d1l2Y1EwUnd1ZjRhdkpi?=
 =?utf-8?B?SEpOaVNaUGl0WXB3UWxhTVkvRTZvNVFVYnYwOW5vQmNCV1hhVjRRZ2dUUi9M?=
 =?utf-8?B?bFBLY3FpR3QyS0swT3VPdHVUajNLUVdpNUJ2KzlRUU1SRjB0RU1MQXFPbGd1?=
 =?utf-8?B?MVQ1SUdwVTAwb1dHUktyb08wdm9yd3JMczJBSm12c3dUTzJNR2s4ZlpJSW8z?=
 =?utf-8?B?NnZpazFMRjhyaGdtZnkrQkdhOFR4eWVWNjF4ZW1yaG00cU5Oeml2Y3hHWXlR?=
 =?utf-8?Q?MGmryDtQkE4ypzu8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 856dfb93-1f76-4b00-cc02-08de5a9c8ce7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 16:29:16.0225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1IeYuD9HgmdtouWuYtSkBEbz12ltGRWOJBZ5sBy1wjW4l9HqBQ+VeDK2vbVBl/YCoX5wpCttnsyDMGHvBgRO+6P/WNKAIc37xvDIskf6Bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,gmail.com,xenproject.org,suse.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[keepachangelog.com:url,citrix.com:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.554];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 64F067884A
X-Rspamd-Action: no action

On 22/01/2026 4:49 pm, Alejandro Vallejo wrote:
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 18f3d10f20..eae2f961c7 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -22,6 +22,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     - Xenoprofile support.  Oprofile themselves removed support for Xen in 2014
>       prior to the version 1.0 release, and there has been no development since
>       before then in Xen.
> +   - Cross-vendor support.  Refuse to start domains whose CPU vendor differs
> +     from the host so that security mitigations stay consistent. Cross-vendor
> +     setups have been unreliable and not practical since 2017 with the advent of
> +     speculation security.

This is going to want expanding upon, but there's a subtle change in
patch 4 needing addressing first.

> diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
> index f033d22785..4c0c5386ea 100644
> --- a/xen/lib/x86/policy.c
> +++ b/xen/lib/x86/policy.c
> @@ -15,7 +15,8 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>  #define FAIL_MSR(m) \
>      do { e.msr = (m); goto out; } while ( 0 )
>  
> -    if ( guest->basic.max_leaf > host->basic.max_leaf )
> +    if ( (guest->basic.max_leaf >  host->basic.max_leaf) ||
> +         (guest->x86_vendor     != host->x86_vendor) )
>          FAIL_CPUID(0, NA);

    if ( guest->x86_vendor     != host->x86_vendor ||
         guest->basic.max_leaf >  host->basic.max_leaf )

please.  This function is going to get much much longer when we're done
with it, and I'd like to try and keep the checks in the right cognitive
order.

~Andrew

