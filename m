Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILgKLEIU1mnwAwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 10:39:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3CB3B9335
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 10:39:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275505.1561296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAORS-00079z-2x; Wed, 08 Apr 2026 08:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275505.1561296; Wed, 08 Apr 2026 08:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAORR-00077D-Vo; Wed, 08 Apr 2026 08:39:17 +0000
Received: by outflank-mailman (input) for mailman id 1275505;
 Wed, 08 Apr 2026 08:39:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wAORQ-000775-G1
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 08:39:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAORP-006yEj-MJ
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 10:39:15 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d61425-e002-0a2a0a5209dd-0a2a4508c96a-32
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 10:39:15 +0200
Received: from [40.93.195.48]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d61431-fab6-0a2a45080019-285dc3302d11-4
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 10:39:15 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV3PR03MB8003.namprd03.prod.outlook.com (2603:10b6:408:282::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 08:39:12 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 08:39:06 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/nOr/pWK4jBhMv/ylDsa9STN1V9cxdo18MvbF4C4CxBSwuqSt746luIlV8lLIlm2+WSQuZq6hpyCAjHHL1P12P8bBmWaQREMUVL0urjJpDljLfbz3atqW34snaCsdQd+YRLkI3qbdH6FWshhY71zWgqnodFcbfm806I0Rm28KrHeXjY6F153zcVEuzk3Khuj1+Tm4X0Fw9oG/IB/DUUlAbn58B0rwzKY5C5gjjNPZC6lH74qdwn0hhvlcym77/P5jpw7Ae0ef3sgixEdKre/ZeObV+1+uSsqqOs0CDmS1NobBijypkAipIHsgaPARsALHC18PuAWOnzMDlPkwMT/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/UqbCjwap7R0TlJJCj/Sx3zNxeS0BtdthdfwijO4NA=;
 b=lm3abB+1HLWIzVCF5a6+8f5ahU57hD0mKnzW9AAW9IrZQW0n+OgvgbRlOCmTTT2izgBwR7iNz1bIEuWoFoHEgZ27q2kRr/P7yOBTnf9SqNCiqdt+2SzG6mV8x3nfuLPS7OZsHpa0QQaCRHXvYQam/UYyFE1/jnrCqMUiHxp3YaFJZDuHwNAuxb0V7bTsw8h25gr4tZOMhy3Fgxj2MLhEANVZ+NYaUKmcTNpZGAM+QKjznptDBAqsTbJXd9GEBIio0wHJz6fO9d4hv1+NtPCBFj8Br4tULWXxion6GG7DpGPyFyAcVaAA/5i+ryftTicmnrkvLAsEcKPrDfYWHQunIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/UqbCjwap7R0TlJJCj/Sx3zNxeS0BtdthdfwijO4NA=;
 b=EsboWmadBXFEQ8qUMs/F2IhAx8VV+bgARwdc17Zk/6/d72U7Y4szzhevM5bb3J8NrwAA+WOhM+DOnCmUR1fbBUd0WIISHYzCj4eOKXAi8yrCv308L7dcDwyVDqT+TRhqwrIrtIDWhB5jgnK3MxkO6HcjG0BSoKDvgGJbdX3HhpY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9b18f0a7-df40-4b37-9453-07ffdaec65ea@citrix.com>
Date: Wed, 8 Apr 2026 09:39:02 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/emul: Remove ops->{read,write}_segment checks for
 swapgs
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <c29e790caae7642fe442fa68111582ffdb37177c.1775636817.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c29e790caae7642fe442fa68111582ffdb37177c.1775636817.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV3PR03MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: 01ae097d-b9b0-46a9-487b-08de954a4b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	RwtVtcFf2C6bcJdydnv8OayZvr6mSLrgqLHrokUD2VIZAXxhD2h0deZrW6tYeGqRg9rOy4o4p4oKZJ4vQGmFTGJ9JWRwEapp6dXj4gKU35AgU4UShFujAeV2bBjV67RDNe4UZm8gpFT5gEdYKY2nSw2zdy97xzjQUtY7V3vQIy27/yCKYv/F6PLwd3SRWfdX2+yNmLW5wEo3tBfv5GLjq7sfN6AHjFvTXBRZiO3Yhygj1wqw6kAoSMKQVPPzFe4WZoh0f/QLojQNDDfVFh+ChRnyRex7jOWzUNldf8rfts31LAosl44xoN3QCI2Xh2OffvQ/JYbtDaeGwdiU7fvFOr/Pp4eHs6Blb1rDDVxFCDs3sH3kXVS64uWQRVw34Exde4608L1XjNQOW+hFlUnh9n9yz/H4WS2YymiX1LX4lsENgKtPJGB/9HxDuu/Si/xNMl88SJrDOjyUVdozLoUFePZmq02QqAYB7vWXlRKPO158DZ+2a0sOsIbVUEY6Df4PF44Y6l6TV0wF6X/NLo+VIfGp15iSd0LvGz582ZGHIrIpTw2uZ5jm9AWA3tFoRkKj3POi6B+C7nkZFJcZ8JH4ZfinpQ14JAC+Fzizue6lkp3KcbGSdy/6TW0zLw3WYLIgNpJtLhNT5XFeTzZ5K/JX6q55TWIk6yt/ivbBAGpdcvaumrg6oFLBQWkTPJuvDjwedTvaBwN2TQm3RboMzwUUT5Wbhg9atsrLJhM9bzBWO68=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGZDQkJuQ3JVZ1RDZmVZNzF2WTIraWErZjduSXhTR09XN1d3NWFGcnNEeVRF?=
 =?utf-8?B?MFBRK2RTa3pISDBncUkwdGpUbVdmdG1HNFBBNndoUVJraHNwNDVud21RNnVS?=
 =?utf-8?B?ME9jK0UreWdpaG1zcVA2SUpubE9EZXJ0YUJBRzBheXg4ZG9jMXpHbzBxUGZr?=
 =?utf-8?B?VlZwd0RTZTVDUkRlNW10ZW9GNDB0VWE2NTBEWGdBR1oxc3E1cUduL2dsYmQx?=
 =?utf-8?B?dVU0OEk2dFRDS0owLzRQcnllWlFDY0hZazZkSktPRHUyZkI4azhGQjRuY0xN?=
 =?utf-8?B?SXpVbkZPNEwwSExGVEZXR3BvVGR0Sy9oQTk4RjVDR2ZsdzR1SjdYNlRNN2Uz?=
 =?utf-8?B?ZE8vUjNQY1lERE1EV3d2RVZmaldwelpMMmVjVmJBZjdUc05rSGpFNWFCMXBU?=
 =?utf-8?B?ZzZKVHRsMExXdzRJSGlqei9HeEpuQjc1U1dKVFRqZzAxbFBRR3A1SFAvU2hy?=
 =?utf-8?B?bzR4eDlVYW01ZHZ1NmZabENuaUkvNzdZUmFmZEtEejZEbzZjWUExb1BCWTRL?=
 =?utf-8?B?dEIxNGpjS3F2R3JHVTZKSWo0MmRueUJWdUM3NHROalBYbHNDUkw4WitWakhK?=
 =?utf-8?B?RnpnUm85TnZHZU5RUmJlOS9rbUI2YlRuU1NVUFl4ODBnMkNSN3ZmbzRUcGNY?=
 =?utf-8?B?d1hvbzFTQ0poVVpTaXR4Yzd0ZFpqTThMYm1EbUVmT2Q1bDAvajV6alV4RnhS?=
 =?utf-8?B?YVJXQjNRamlXK2lqK3hQdC9nNHUwcWIwNXQ2YUpaam1jSVZDbzZHR0JjYnVI?=
 =?utf-8?B?MXRmN2lxM3hCTFNiT0RhNHMrQUxsbmpLaFdNN0NiR2lEcloxTS9rMTlZNlBw?=
 =?utf-8?B?eU5zaCtYdHdSQTNlN2hSQVVaREphWjhjZXBSZUpMMDQyZXJqUEhVOGh6YWdL?=
 =?utf-8?B?WFVIMmVkOUN2YVJ6UDBmTFhZMllvWUFtNjlXYnZzN2ZDa01JYllPOEEwSGRG?=
 =?utf-8?B?enRzajliV1QwYU9yeFQ1K29ES2huZklsL2VZV1l6VGxkMWFUeFptMDBjbG5q?=
 =?utf-8?B?QUR2SHJjSHA0WHVTbzRLNFRmN3hNRTNFTzFhOSsvbDBNejc3Sm5PejVDSGIv?=
 =?utf-8?B?SDBTNk1jcWZiSUI4ZERxaXdDaHROYmVpYUhLZ3JRcFRrblIvYzdNOEtlOFpX?=
 =?utf-8?B?dkhZakIxb3pIblF5MTVlOFl6elAzcWtocDdsSHdQdWRCU2h3UjBnTEg0b2Zx?=
 =?utf-8?B?MFY3UVlsTFNlOVRnbWxvblJqcWs3VVpHZElhT0QyQzVJemVQUFFMWXZwNDVD?=
 =?utf-8?B?RXdsOGs2czBYUDZSQVRQN3h6aDVwaDhQT3laNUhULzBNM09Dcys1Ny9TM1pm?=
 =?utf-8?B?T3RvUFJXSjVzOGk2eEN2dWlpM1NoRnFtc0prd2pHYklOUWxrVWwyaU9yYldu?=
 =?utf-8?B?SFlubStQS3NnMjJJVFF4d09xTkFCcHBObk5KTU8rN1ZyL2xKVzNTNi9aY0s2?=
 =?utf-8?B?UnpxMDMrZGJ1UWlKSndyeWtZNnhZVXllYjZFajZlbW1YdzU0d1hFK2pkayti?=
 =?utf-8?B?Z0w4emtVSGpCbHJLT3YxbHJsY1Y2SmJPbHk5L2FuekMvcjBXbno3ODRPZDVL?=
 =?utf-8?B?QjdmYlpFNlJtZWVRdEs1UHFWc1cvaUtudThreEtMQzRiVjdWWVMzc3hFNkI4?=
 =?utf-8?B?NVcyRXdERlYvRnZic0pRMVJoRjRmYnlvZWMxVnM1akFUYXZKelZ1RllWS3NZ?=
 =?utf-8?B?aHUvcmVrM0RLRHhtL2xvWEhZaGxFQ0xpYU5GbEM2akhGbCtqTWtlMnVTM2lS?=
 =?utf-8?B?ZDF1QUpBM1M5MjBXU1ZvT0d1WDNVKzVnejZWQnNLRjQ1MjIzV0RNcXd2SkZK?=
 =?utf-8?B?VlptS0ptMHl4NE8zUEtqNHM5dkthZVdrelFjU3cyVkNuMWU1L1BxTWNGOThE?=
 =?utf-8?B?MlBjUm4wTmJheUZ5M1k2U1Q3U3BILzVmcmdQTktXcVFXYVlaVTRwdGpZcStH?=
 =?utf-8?B?T2Q4U0tHS08rUm1iU2IzQVpzbHJjUVlaT1dvWUNiemVqYWttcHBqc2ViNjBF?=
 =?utf-8?B?R0o1cmJRWk1QOE1SUWFscGpyZzZWdnl6T3oxendueTRsUktnQ0hBTUdZdFhN?=
 =?utf-8?B?YUN3UG1pYmtBOEs5SkhvQllPTVhaTndUWEo5dHBBQkdveDdheEVkS2lTVGl1?=
 =?utf-8?B?TytSdEMvVWZsZmJWWXdPOTIxZWdFYUdvUmZoVzFWOWNFcWdKNUNWOXpRUGM0?=
 =?utf-8?B?V2FVZ1ZoZHE5SnJWZGRQclB6RDA1SHR2dWxBR0I1NUdpaUY1WTV4VFFrdG9s?=
 =?utf-8?B?UDJFOEU0eS9QUys1cGw0aDJCa0VKL1BPN0RNNVFIWmIxQldUVk9qRDZTTk5t?=
 =?utf-8?B?bEhNVkZoYmg1d0tnblJ0aTdyRXNrZEdZMzJtbkVQMjJib2N1OVczN0c2aytN?=
 =?utf-8?Q?EGcCQ/HyjowHDcW0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ae097d-b9b0-46a9-487b-08de954a4b79
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 08:39:06.0388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zP5TjKPTq9gfXKJACUzCo4UJOUV1UJcT5ZnBxYeoBBIIsWMFzP8tY6fmhtUO8gtXWFJN+SrG7VlKPJGtfBg+hl0DcKbO4P0vg7Hq1qbSQks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB8003
X-purgate-ID: tlsNG-c1860d/1775637555-F4B5C497-7CA099DB/0/0
X-purgate-type: clean
X-purgate-size: 297
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1E3CB3B9335
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08/04/2026 9:34 am, Teddy Astie wrote:
> Remove these checks now that we don't use these 2 ops anymore.
>
> Amends: 4bedbe47eef4f ("x86/emul: Remove fallback path from SWAPGS")
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

