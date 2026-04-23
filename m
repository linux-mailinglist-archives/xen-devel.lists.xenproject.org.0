Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CuQI+TX6WmglQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 10:27:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E19BC44E852
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 10:27:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291767.1570603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFpOk-0004U9-2F; Thu, 23 Apr 2026 08:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291767.1570603; Thu, 23 Apr 2026 08:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFpOj-0004Ra-VQ; Thu, 23 Apr 2026 08:26:57 +0000
Received: by outflank-mailman (input) for mailman id 1291767;
 Thu, 23 Apr 2026 08:26:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wFpOi-0004RU-27
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 08:26:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFpOf-000IOu-TG
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 10:26:55 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69e9d7c3-e002-0a2a0a5209dd-0a2a4501909e-36
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 10:26:55 +0200
Received: from [52.101.84.84]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69e9d7ce-c1f2-0a2a45010019-346554544f92-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 10:26:55 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by VI1PR0301MB6640.eurprd03.prod.outlook.com (2603:10a6:800:192::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 08:26:51 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 08:26:51 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAS3rkNxhnQu0q+oqxpqfJGIZe1EotiiWb+V4n88QLmNOtRd6aNvgbjqSP56iVK0t1WRBNp/MTO9HBmky/5jei8l/5cGtvZDVjH89iTXOlHS0T7YlGdIccOSUSAVqycJG0MDivjKJAnn1UizIEIWsW8PLnKHkZY6PTWg24oN7TgaStGifPMpE3zP8jbulWpSIBGK0vkdOFL7AJxX3l5DZ1qdIgCarbyJTl36RuqI6RkfKFFCJQcIOx7bjjzOhNExrVBjc6Z33IDktG6vxLDI9VjlBg6cwTS1LH4bZAYrKOwPtkAj6hGEUGQrTuF5cZ9GJM0KtFm5iU7AVWcvD984Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avfNGRJegDCY911DjaNTuGaKuo9exjiT/NHVp4i7TgQ=;
 b=Yxo4UfOJkLhQGc9wLcKrKJ3NASqLGCg71WLjC8CGk7WOlyG74jdtzSRe+IOG9hxkge4FD9+0cxsYAlqEVd6cuo+NAV2sSnBaoRBYgBCxN/GDREL1TzdsCDpC0cdFBGcyCr1E+MCQXPBoQqdhWQKKqfvNE8hAluewr+wvB73lwA5zdMMBDSU068Da+NHx97NXIESZv+o4aBLEYlsGZlnOGlrdAKV190LVJtko91y3rPEAelgR9cw0RLjOJBvEhvPt86ql0yKW6t1TSZy+eL2rJcVPbiY+fFTZuJ9IxpNt7/maPSIOkeHvQfpdR+9QclC90S+aAjBuQymYZAKCXKJtRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avfNGRJegDCY911DjaNTuGaKuo9exjiT/NHVp4i7TgQ=;
 b=bC0EoQcJqctXtipwUEphcOcI1dce4g4K4XLzRz3GfE3vseNZyScmWXMl8e8/I/2EMvleS9SXC2FYtRFEtrg3I5+kwtdNyVXjeoZjLihSt+EAwDdVnmiXUErGJyFPIBDu8H0iCiUtJE1XL2o7etC+eqNiTTvJ1/+c46pNiyvMnYUhcswRGrettjPglSKLpS605GZBfAHiqLFbV3U5/weizrjaaZy5vr/q2cMa+QlQmRkSWLNJURL6+XSmn6cF9E/6D5cILdCq+PZScBWQIpDvj7HpNJRdW5k8iJ5sNb6hk1UIZgWmKL9xPRBQPsm9ulXyWbpWwKB+Hgf4BBQXa7LAhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <f305fefc-a703-44fc-95f7-44de2b98baf7@epam.com>
Date: Thu, 23 Apr 2026 11:26:49 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] xen/drivers/char: fix exynos4210 IRQ registration
 failure propagation
To: "Orzel, Michal" <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr_Tyshchenko@epam.com
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1776850201.git.oleksii_moisieiev@epam.com>
 <e15f6ef27470724fd987f0c5d248315abb1d2c55.1776850201.git.oleksii_moisieiev@epam.com>
 <eb609076-bd0d-4a62-a259-fbe0e4b19a26@amd.com>
Content-Language: en-US
From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
In-Reply-To: <eb609076-bd0d-4a62-a259-fbe0e4b19a26@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::10) To DU5PR03MB10263.eurprd03.prod.outlook.com
 (2603:10a6:10:519::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU5PR03MB10263:EE_|VI1PR0301MB6640:EE_
X-MS-Office365-Filtering-Correlation-Id: 24b6265c-69c0-47f4-354d-08dea1121193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	67ps3YLvgePyTe2KtrchDo1yHO9SLMnhurf91Me/Yv/XO2tjW3wMNfFkByURFbf/efb/ChI9jKFP5UPnw0DokStfuEj2gRoC5b/7v9Fehp4y3tXgg9xYvD9B2hjo8M5YLAYOFxkxy0tw2EC5LutDfJbdGV6bp1Q06UBEa8V6TTnfgkfVWn5mkkxfMWfRa4l/uSVnl/W4kL5eyNo1rirVyI1gEAyzz3fqg3Eht4/pvF70Xxj6wU097JXhBddgnNjO64/T1F87Rm9LRFXdb10xLaqMVa0ShXOdySrjK3Rvwm+B1/MPcMv2WOx5fXEaAYUiBzrlm7FVavzI03we3HVuMFA+MX42OoAfaxdxDJN0Ed1XO9+Y+CFKRmyOBTPuzbUjtPXqc/7/HTE9eoBXwLcFdVM9DQpTOMsb8V/KssYVaPHXtd26eXMNHy4jwoVk7TbDdFMt+pHMXtj7S9B/9p52O+gfVksgpsst5z7wFXBIDo41ksbMIVPT5SHjJI9LSEeg7K1TZH2WdlN4fg/RCWE+rygL2xLVthUmhgo8SaQ2+J1Nuc/NxOz6GAQMa6zf3pVOmHHDSGagBOO2J2KP3Ofa1fOaSAD3Bz1Hrh/dCre6k6jWA2+k+J1zVZAbZ59vDR7UwqseyFM2aU5k+KNonBIJoG02c8gsczFrXxzJsxSvYbt19oS8g/S2yYZv3V4gS/Zsaq5FkGOPgHO9T19qMpvPFC35RT0I6HCoFZNbpwzWEAw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1JhNmNsMWRUK2NTajdpMHdrcCs5Z0c4Q0E1N1RleEtxbnFYK1YvRnJHV2dy?=
 =?utf-8?B?Z0c2djZ3RGxJejRIUnhiaUdzaE1oeFdDZkhVZUYxTytHbmh2U3ZtOUg2V2o3?=
 =?utf-8?B?WnBUMzdZclp2b2NZaTdUajhYTWEvbjJzcUh1b0dWa2JRYVNnbG1PWkVseHVW?=
 =?utf-8?B?ZG9UWXZzNXI2UGR1c2k4ejdsS3dFNzlrS0d0RVNDOUM4OFhsbktiUUxidExJ?=
 =?utf-8?B?ckJLMkZ0Q1J6aUI0UlN4eHhISFZhVWs0WUlYbys2Z2ExSnp3cVcvUjJwYXJD?=
 =?utf-8?B?TVBtMHRvd1JQTjlHVVRva0FwL09NSGFmdUw3TDRnZEJTZ0RlT0hrZlA1bjQ5?=
 =?utf-8?B?Y2kyT2g0VTFvbFQyNnUyakQvMjhDYW5qUDFVb2VHRFQrN05PUlRyVExJRktr?=
 =?utf-8?B?NUxLTW13V2R4Z0ZtVFhiUUdVVG0xKzh0MVMvb2hzY0c3VWNCVVd4ZnI2K3kv?=
 =?utf-8?B?MndEd1J2UzdxT2RpTkIwaHNOczVrc21SRVU5RXI2Z3diVHdJV1g4QnRpU1RX?=
 =?utf-8?B?bFhvNVozVmZ0WTJQazJ0RER2NHVmN0dyVXZQYm56Z2MwM1BXQllZYWl3L0Vz?=
 =?utf-8?B?bGhTU1A2dmxHS09VUGVuNUR1cjkrbmtXUHVjMzNvZWxtVE5JQXpJVG5BTFYr?=
 =?utf-8?B?VzJMYm1ERi9hNC9GeXhCbWVYcUVNN2VocGhGMmNwaFdXY05YZDJTMXh5WEdk?=
 =?utf-8?B?cUtTVWUxN0JWM1JLRmhjNXZGOUlXTDl0ZFNmNFBWRlYvZXkzc0hlb1ZNODA5?=
 =?utf-8?B?NzRybXBucEJwWi84ejlBdGxmbTRJTXJzakJ5eDV1WXdOZEZPaWVuUlc5TzJ1?=
 =?utf-8?B?cjJrUnNVNmJMTlk5a01RY0JSeGFhTUV2b0oxV2dpYnBtYlQyU1BPZzVuZzRh?=
 =?utf-8?B?UENhUXdRNlRrM281a0Z1MXorWUF5S2JqT3JUU2xSUnZsdERWM2kwR0ZoSC9N?=
 =?utf-8?B?TTNHVHpQZE1kZkJLRm9wSVVZQlJmTzgxclhTa21ZUmxNeEZWY1dYUFl5ZDBq?=
 =?utf-8?B?RVNFN0d6dVFySnV3QkJSYkRTRmY0U2t0ZlNkK0JncGhmTmd2NlgwdzI5MEx4?=
 =?utf-8?B?THRIcWxhQWR6aXBqYjNlbUhQa0ZPTUxOWldSeXp5OWxPYURhbXE4bnpvRGRr?=
 =?utf-8?B?MTNFRXErbjAwaTdkeHBkUjhDanNzYXZOZ2V3cGRtQlhFVC9oWjdQdTVsM0FS?=
 =?utf-8?B?RFJlK3h6WHBRSElVUCtwSlVObGNDakNpcncvczlPTkNWVkdDZmxXdi9ERmlV?=
 =?utf-8?B?QzB6bmNHajdVUUo5T2FqN01yajRrbnkwMFdVTk4veC9POXRLbWRWZjYwQWdH?=
 =?utf-8?B?RklSQkM3dVJ0dlBmQTkrdUpTRWxLSzlQY1hpVVFUaWZHMXJxVWQrNENQbzNS?=
 =?utf-8?B?ZElJRWNoZy9DeEtkYVMwK3ZHeW1HQlJCVmN5dStBTEUwUDNoUmF6M28wNmkz?=
 =?utf-8?B?Y1ZtVHE1NjN5dERXV0NjWXdSU295OTAxYUJBMzRTL3JjcUpYQnVncVAvSnc1?=
 =?utf-8?B?ZXhVcm43K05kRU05RzYrY1lZNE10MXlTWGh3cTM1bGx5N3ZUYUxNN1J1b3Nj?=
 =?utf-8?B?LzJkbjVEb0R6TGdnSFR4MURoNHg4ZG5DNVVBRGZlaEVwY2pRdTV3VmdtUzZN?=
 =?utf-8?B?blRwNUVhUnNMZEJMRG9LU21YV1hqeE03N3hWYm5NNkVHcno4TUJveVJGNkpF?=
 =?utf-8?B?VWpDTW1md0tUSFRxekVqc0MrZXJJVW5WMXFraXNRYXdwT3hFbkVDQTh0ck5Y?=
 =?utf-8?B?cjdhMUI3ZVVGV2FTWXNXUUVvc21NcThvUnNTNnhQZXQyQ2luQjVGaVBsbGl6?=
 =?utf-8?B?UkJNOG5qc1BnZGR2cGhScEgreWN6Ujc2YjNtWHowRWlGalRrM2xIUDl3UU03?=
 =?utf-8?B?VHRCb0xqdHdGZnU2RmtwZ3EveGVsUVJDdkZ4MGJDNnhaYWxTOElyUnQyOE1j?=
 =?utf-8?B?OTF5a2RiSmRGRlYzRmU2S2NrTWtkQ25OSGxYRytCSU1vejdPcnJuR1dNSjND?=
 =?utf-8?B?TFF4dURUeHI1WHVNY2poV3VjYndDanRHL1dsWjdJQUVPQ3BEaUpiWVdPams4?=
 =?utf-8?B?NUpqVVNMaE9HM0N3WEc1RGRWZ0RaQjU4OVhjcmhqcUE4YlhiOVZ5cmZjcGRN?=
 =?utf-8?B?ZTNOVXd6K0ZvTDFUMGNmUEJ2MXh0YVh3ZWNGUXpldnRpeVd5OHlIdGhtQTJZ?=
 =?utf-8?B?WG5oUzd1TmkzYUNQdVV6UmNBaVFRVG9USXcvN0E1TTd6RnlHS1UzM05FL1Z2?=
 =?utf-8?B?ZytCbTVnMTRydHBGZ3RZdnFxRHpmT0NoaityOEQ0b1BnVXk5SUJWd3BuaC9j?=
 =?utf-8?B?YXJvNFFvczJEc3JVVHEwR212RE5HWklDWC9aaE5neGl1aElSajBtc00vbEJo?=
 =?utf-8?Q?wBZi83mZDA+0dyzk=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b6265c-69c0-47f4-354d-08dea1121193
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 08:26:51.0917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLfu0s85nvQAqVp+5ayElY2bq8DKH/GujakxgVPnpdB+RnpBCYxUshJlHyAM/bqRIWBHMyAKgoDdROXoDTZcLC9o6yf70avccGR1XfABRbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0301MB6640
X-purgate-ID: tlsNG-d62444/1776932815-BD468FF4-53531E52/0/0
X-purgate-type: clean
X-purgate-size: 2235
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:Oleksandr_Tyshchenko@epam.com,m:bertrand.marquis@arm.com,m:julien@xen.org,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E19BC44E852
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal, Oleksandr

Thank you for the fast review. Well, I don't know why the commit differs 
:). I haven't copied it, just wrote from scratch.

I see that overall it looks good. I can post v4 with nits fixed from you 
and Oleksandr, or they will be fixed on commit.

Which way is more convenient for you?

--

Oleksii.

On 22/04/2026 14:33, Orzel, Michal wrote:
>
> On 22/04/2026 11:33, Oleksii Moisieiev wrote:
>> In exynos4210_uart_init_postirq(), when setup_irq() returns an error
>> the failure was only logged via dprintk() and execution continued,
>> unconditionally clearing UINTM and setting UMCON_INT_EN. This enabled
>> receive and transmit interrupt lines with no handler registered. On
>> platforms where the GIC receives these asserted lines, the result is
>> either repeated spurious-interrupt warnings or an unhandled interrupt
>> fault.
>>
>> Add an early return in the setup_irq() error branch so that the
>> interrupt-enable writes to UINTM and UMCON are skipped when IRQ
>> registration fails.
>>
>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>> ---
>>
>> Changes in v3:
>> - skip clearing pending interrupts if setup_irq was failed because
>> according to the 13.4.1.13 of the RM: it must be cleared after
>> cleaning interrupt pending in INTC.
>>
>>   xen/drivers/char/exynos4210-uart.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/xen/drivers/char/exynos4210-uart.c b/xen/drivers/char/exynos4210-uart.c
>> index 58901df554..2e5860ea2b 100644
>> --- a/xen/drivers/char/exynos4210-uart.c
>> +++ b/xen/drivers/char/exynos4210-uart.c
>> @@ -199,8 +199,12 @@ static void __init exynos4210_uart_init_postirq(struct serial_port *port)
>>       uart->irqaction.dev_id  = port;
>>   
>>       if ( (rc = setup_irq(uart->irq, 0, &uart->irqaction)) != 0 )
>> +    {
>>           dprintk(XENLOG_ERR, "Failed to allocated exynos4210_uart IRQ %d\n",
>>                   uart->irq);
>> +        /* Don't enable interrupts if irq setup was failed */
> NIT: Not sure why this comment differs from one patch to another. Preferably
> they should all be the same.
>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>
> ~Michal
>

