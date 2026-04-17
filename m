Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAGYEzpf4mlM5QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 18:26:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB72241D1AB
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 18:26:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284544.1566260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDm1A-0008By-Gb; Fri, 17 Apr 2026 16:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284544.1566260; Fri, 17 Apr 2026 16:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDm1A-00089i-DP; Fri, 17 Apr 2026 16:26:08 +0000
Received: by outflank-mailman (input) for mailman id 1284544;
 Fri, 17 Apr 2026 16:26:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wDm19-00089c-A8
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 16:26:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDm18-005O5B-LE
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 18:26:06 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69e25eff-5cb7-0a2a0a5109dd-0a2a4501eb10-26
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 18:26:06 +0200
Received: from [40.93.198.13]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69e25f1c-c1f2-0a2a45010019-285dc60dc119-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 18:26:05 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by LV4PR03MB8281.namprd03.prod.outlook.com (2603:10b6:408:2dc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 16:26:03 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 16:26:02 +0000
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
 b=i6a8/BnbzilodaS6IKAVSw7BprbMX9V1v3O1thcCjG5J7gg0P00ikilfvHJExMMabGjMveiXoeGLEyA37hqL46CBrGXh15tlvLZxjtSE1O4IL+rbsTLU2XywdWaXNa3vJZlMGVGtsMt4uyCDgW+XNIONid5OjRewNiDTB+BcMGWtbk3IjGKJdPNto+2anqjjdLdCGpRGzll09vgg5zPLc6bUK6H4InFr2jJKnv7oxSGgZHXI9F/U5k64LFXCFoGy4QyO6kk85tcT0OVaWaS1oVmkK0JJ2+xAyOxHxYnTBSGQf1+ABVS/kvD6tc4RtXpuSByQDy5buQGjDXvLK8rw6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1UJAZlAegyWWl7YRVVhNpvALJclXHdj7A9lG3tmNDY=;
 b=yoy+fGG7fxUE8thzWcS857VRtCHgui8b08F4Vw3FEhpd+4Ba7KlCanHJ2jslUz49aYpQvpC6bLHOAxwYHEmJ/b3fdYC8Hm0Piw71Y/pyIBCq5vGqi5NdrRGDDvlvOB+0Q9RQDTb/ZHpwsEfLvu9lFsVRJ/SJBSwPpsH4VD44n4e/5fYGDw16q1jnsTfJqtkdCjQqZ7SrnCgyWZU1JuFL/zHvpYxxUfIu6dm9hDEy6f6k6O2sd+Dy1z0bruUoQJ41bHJ80SdH1SZVDIKUM/XRDU9tbAxgiADY2dmg91CA0NN1yfzWGmDMA9ICtazm4Hnn10kaHf1mu3Bx/FxE2fWipQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1UJAZlAegyWWl7YRVVhNpvALJclXHdj7A9lG3tmNDY=;
 b=J6tHPnwUutv4xc+lAYyTULKP6t293hpeQtoh2Dpkl02aSELpD0xKfENAObqMAvYPIJIjy14/iFXp7fSxEjoCakmcwKVnT3mlZUmb7ZaIXH/8asbEwdsZsC2+GBHxAT3DsuW0Fh5YzEKn/dC4wZo8XNEQWVFweiPPuLskmXbIKZc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <475d51ad-86a9-4328-812d-c273f602d20f@citrix.com>
Date: Fri, 17 Apr 2026 17:25:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mkelf32: Actually pad load segment to 2 MiB boundary
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260417105425.1184232-1-ross.lagerwall@citrix.com>
 <a6b71c55-fce7-4995-b38b-83133d702bd5@citrix.com>
 <e12a3f73-6121-4152-8f54-5bed0f36d087@citrix.com>
 <f385a4cc-f6c9-427a-97a7-f0cb72e5ea07@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <f385a4cc-f6c9-427a-97a7-f0cb72e5ea07@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0006.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::16) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|LV4PR03MB8281:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e5fca16-56c7-44e1-ed31-08de9c9e046d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BoR4uQNgy8d0BMiRHNlES0lSymxuu0iw1d1g5dm0e7I+6rfPiKmstWRdOxoo/qnqv5Ofp5gnmXTbFyiYunZGOJvsf+EcsC/wR1+uUacxPWxo6yaK2Sk66SfG12VEs5+3ruDODlIHzGMD9l1jHjMBCliZ8AyEWFbGAhlBbv4Zaukiwq0NqbNXJFWPB2jUSHNGE/xtRyBFlXMeay6UuNeMNmSxplAokaIMppc2EomtiYNpIfVYsZCAQEtliqq+lXEy7GE32jOoIY76gh73LE9XhlkpfDaj5AK2AXhI/pV/BkaqoH+cGSbVLtI45ZPEXigkxzRQc4TCM1pSeDvR3Ns9e7/eX48pNwypwP/UtfAdwMz512oFiH3EZlRVwTvv9gdI2Hzcyen2l9zh1MD0O7WCcPyMJGW+sfhUVeSDjoMFgLTrtzhrKFYBFwOyNNY6tbJYHUhRxaI6P/V8m7QtKt3W+XMSFYGPVrlnJwAnEhoy8/kLcrg/RV4XwJJWSFTO8G8maoiQkmViMBdWKZm0Y7rBesCaj0B23pbWAWxwR1zHNHXpYloyGfcVvybnxVotxG4Pp4BhFogfPGfvL98KFHKn1VBcbL7byEnmecVkAfNGUEb+aTQeEMcr21TP2ZgAMHKcr3RnXDRFA2SHj9ARXvLlLJu2JHw7jcTnK/Gg/xAwtNX8nIUEU8fvU5JcSTnkoIe2+0+6h3wolGletKlt4wyLP24hri+mqOjKxkaKJmr5oKg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUQwSnQwcCtXMHBxbDIyTXM2SGo2RnNvU0J2ekM3T1o0cUVUUkN5eHAwUS9Q?=
 =?utf-8?B?MEJoQXdrR3JUaHRBbmVaYktaNG5YR1NOYS9zakNpWTFhT3hEazFQTWo4cmFp?=
 =?utf-8?B?aXo2ckI5cE0ydk5rWEJBbkxWTGdwekhnQnRaSU1vRUJVdlBUbUsvMjNuWDZa?=
 =?utf-8?B?MkhmVG1PeGlFaEtHbmg0WkZNbnVYWFc4MlVEQ3Bqd3Jwa2FEYXZ0cE9rMk1G?=
 =?utf-8?B?MjBHa3ZHd1hPYk5XR3BFdEhhejUwQzJxaHlRZTdpSWFCVGVIQzFLK1ZjTFRK?=
 =?utf-8?B?blFWVGZiMFBWOXRybzFaK1VqaXdiMkczUmRGV1dxaVdDRVFXenpGNk5qaWF2?=
 =?utf-8?B?d1VCaG1KNXQraUt2UXhXQTQvdmZrZmxuL0dVdE5uaFN0QW9HcmtVK1BWV2o2?=
 =?utf-8?B?U08rUUZnNUhQc0x4MlZKSHI1Y0UrVWpHVFlRT1NTVEl6VG4va0RmeXV3d011?=
 =?utf-8?B?ZVN1dFBLU2xydTFtaXNUT01pYkk0UDk5VmJCT3JCQUUzZEM2SmozeGRFbkl0?=
 =?utf-8?B?ZXErNTFNcklqMHRJV1FIcjJMZTVaY3IwYnhHVDBiOFd6VDNGVTVDUjNELzRE?=
 =?utf-8?B?L0ZRQjdKMndDZzNQbHEzQ3FWbUduTERKN2Z3dUxXNVZTdEFsRERuT0c5b1FJ?=
 =?utf-8?B?MmVSQXRKU2tYbXV3SmFuNitRaVF2TjZiYjhDUXA3L01jakdlVHgzdEpxMlFp?=
 =?utf-8?B?VzZka0p3MDNWRkkwVitzZnRnQ2t4Q1ZQVGoxeTEyK2tWNUNKRWUxNG1ucVI5?=
 =?utf-8?B?T0o0UExjcTBobmtwQ1ZEL1A2dS9IKy9uaHFtZGJsbXRibllvT3NwQnlMWlFB?=
 =?utf-8?B?R1JHQUZSWll1KzhXaU9KdWphRlNzaEl2cnlQa25ySGdwSUtlSmdKdTczS1ZR?=
 =?utf-8?B?RDBoSG1Bc2hIVEIyT0tzcGIxNmVyYmpPdzUxUDU1UHVyUHdMSitiQ0pSc3FN?=
 =?utf-8?B?aHFtWDFGRUJ5VklzTC9EWDN3TDRxN0VmbFR1bVRyaVZUM1B1MUt6eXkrbk4y?=
 =?utf-8?B?STdtTGlQdzdycUhrUStBOWpHcTI3ZkVMUFBRLzduWDlrNGg4eGl5OVFiUGlt?=
 =?utf-8?B?Zld5UHRXTm4rcllGSnFxaDVIL0h5N25xZCt4Q29mWWJ4ajZDVmFUM1VaT2hr?=
 =?utf-8?B?Y2hIZFFZaGNJaU9yWWFKbHhqQnNIY0JDNGd3R2pUTy9KRWIvcFppc3k2eExZ?=
 =?utf-8?B?UDZHa3l3V0ZqSWZ3NTR2aTFtcEQ0SzFDRTdCUnpkbnJ2MitnOUpSdEI1Z1Z3?=
 =?utf-8?B?VFVXSFdMMUdWMXdyT1F4dVFhREJYSjQ4eUE3NWNOejRkODRXTGpQdDlhMHhD?=
 =?utf-8?B?aHM5MkZ3REEvaHErcFJCSHBqRkp2T3E0VS80VGFIMktSRCtua1FENUdHR2xi?=
 =?utf-8?B?VjFPYWgwdXBZcmRtYXA1U3V3MmQvNTV1RExhcUJ4d1lmcjdVQldPNDZpMDFW?=
 =?utf-8?B?M0RlYllXNVY1MzZZeFM1ak1ab3hlTTFNK00yTlZvbzJMQnFZeVFGNzJzbTZk?=
 =?utf-8?B?WnVNUTZsa05NV1Qra3F4QVE3VHlkNGF6Tk5DYi9YbE9QYzFxSlVoY1lWRzJ4?=
 =?utf-8?B?aEYzRnRHTzhUOGlmUkptRXdRV0g2S3JZbkZPVEE1VFcrYTQvdDJhSHVpWVEw?=
 =?utf-8?B?S2IzNGZZR0ZwYzlaQnlKd2hMSlVYdmFYM1pSQVpsT1lXd1hpK1FvMXM1YTVx?=
 =?utf-8?B?V0JFTWtTc01TMFpKUnFQN3Zzak9hZkc3eDhWMkVHaUp3R3hiYmVmYmRlL1g5?=
 =?utf-8?B?MGJmdzZBcWcwY1dtSVNZRjJWRDZTSXlENE9tTENMMDFGNnRMa1hNWFJuaGMz?=
 =?utf-8?B?TkVEYy9ZL1RCUkZhbSsxbHZ5bkJ3djFpRXlyZlpSZ29VZFUwYVZ2VlhpUnNj?=
 =?utf-8?B?Wmw5Ri91d2w3K3RtdE45SXZjeFgyMXVERU9oYWp3MytlV0ZSek1qanR2bEFU?=
 =?utf-8?B?NEh2Um9IclFqd0JJS1pFYUp0b0s1UXEyY2toYkF4V0Z1ZjNsVXhLMG5waVc4?=
 =?utf-8?B?VFRPKzRPN3U5bWIwaUI3VXg3d09KMjRPUEdzd2lXVlN5VFZTMVFsazAxZExK?=
 =?utf-8?B?YUVHQzhRTTNsT1d3a285akNTMGN6eUcxM2JhWVJuWmtWQWErVEJhdTE3K2dm?=
 =?utf-8?B?aVA3RHVBYzVOaTh4akZPYlRENmdnWk9IckwzcW96SW9rOEpmNXY5Mk1HZnVN?=
 =?utf-8?B?cW9taWllTmk4blRRaWhlYk9BVVR2UHVwblhpUmZXVCticTlNOU1aeElkK3ZW?=
 =?utf-8?B?Rk9POGRZeWkzcnI4MmFSUzNOVWVEL08wRXZEMWNibHI5cGRNUVlXOER0TUpU?=
 =?utf-8?B?TGZpZWlTQUJoaFYzaElvNGNoZDBTL1NRVmVCdTdLN1pIcjB5clNBU3NVQU5q?=
 =?utf-8?Q?qs1cIIPn0Mg0EDbw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5fca16-56c7-44e1-ed31-08de9c9e046d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 16:26:02.7946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZIY6s0Q9CFOCEb//Eq02MOzjgUKgt8BIJ2HD/HAhdYjNLcCOAVjRV3M0Uv1G1X1CEYISPT0D6xIdf6NVn9oXn2UaZFEvm2ksYFJgQGUsM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR03MB8281
X-purgate-ID: tlsNG-d62444/1776443166-B5A69FF4-CEE15A28/0/0
X-purgate-type: clean
X-purgate-size: 2894
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CB72241D1AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/17/26 3:35 PM, Andrew Cooper wrote:
> On 17/04/2026 2:25 pm, Ross Lagerwall wrote:
>> On 4/17/26 12:03 PM, Andrew Cooper wrote:
>>> On 17/04/2026 11:54 am, Ross Lagerwall wrote:
>>>> Fix the code which tries to pad the load segment to 2 MiB but only pads
>>>> it to a 1 MiB boundary.
>>>>
>>>> This manifested itself as a page fault while scrubbing RAM during boot.
>>>> Xen failed to mark its location as reserved in the E820 because the
>>>> last
>>>> 2 MiB superpage overlapped a reserved region which meant the memory was
>>>> given to the allocator despite being RO.
>>>
>>> Do you have the relevant snippet of the E820?
>>>
>>> AIUI, you're saying that Xen was placed immediately below an E820
>>> reserved region (a valid layout at 1M alignment), where said region was
>>> inside the 2M-aligned boundary that Xen was expecting.
>>>
>>> But I don't quite follow what happened next.  Where does read-only-ness
>>> come into it?
>>>
>>
>> Relevant E820:
>>
>> (XEN) [00000063469ff02c]  [000000003f2df000, 000000003f31efff] (ACPI NVS)
>> (XEN) [00000063519dc9f2]  [000000003f31f000, 000000004cfebfff] (usable)
>> (XEN) [000000635c504aff]  [000000004cfec000, 000000004d07bfff] (ACPI
>> data)
>> (XEN) [00000063677372dc]  [000000004d07c000, 000000004d09bfff] (ACPI NVS)
>>
>> With a load size of 0x900000 (padded to a 1 MiB boundary), Xen was
>> placed at
>> 4c600000-4cefffff.
>>
>> In __start_xen(), there is a call...
>>
>> reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end));
>>
>> ... which tries to reserve the region 4c600000-4cffffff (size 0x1000000),
>> padded to a 2 MiB boundary since it is using superpages.
>>
>> reserve_e820_ram() doesn't reserve anything because the request
>> doesn't fall
>> within a single RAM region. Therefore, the pages get treated as normal
>> RAM and
>> will get scrubbed later. However, __start_xen() also calls
>> modify_xen_mappings() to mark all of .text and .rodata as RO in the
>> direct map
>> so when it actually tries to scrub it it gets a page fault instead
>> (which is I
>> suppose slightly better than just zeroing Xen's .text).
> 
> Oh, well I'm glad that I fought to adjust the directmap perms.  This is
> exactly the kind of thing I was looking to catch.
> 
> reserve_e820_ram() failing here is also catastrophic; the bootscrub can
> be bypassed with a cmdline parameter.
> 
> Either way, can I suggest the following adjustment to the commit message:
> 
> This manifested itself as a page fault while scrubbing RAM during boot.
> Xen failed to mark itself as reserved in the E820 (due to spanning
> multiple regions), but did restrict the permissions in the directmap.
> All of Xen is then handed to physical memory manager as available for
> use, and scrubbing hit the directmap protections.
> 
> ?

Sure, fine with me.

Thanks,
Ross

