Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHHAChNs82lf2gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 16:49:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 819F14A43EB
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 16:49:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298244.1573717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIShO-0002jN-N5; Thu, 30 Apr 2026 14:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298244.1573717; Thu, 30 Apr 2026 14:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIShO-0002gv-KL; Thu, 30 Apr 2026 14:49:06 +0000
Received: by outflank-mailman (input) for mailman id 1298244;
 Thu, 30 Apr 2026 14:49:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wIShM-0002gp-MU
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 14:49:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIShM-0060Bu-2S
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 16:49:04 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69f36bdf-2eae-0a2a0a5409dd-0a2a4505e628-4
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 16:49:03 +0200
Received: from [52.101.53.32]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69f36bde-aaa8-0a2a45050019-34653520bc13-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 16:49:03 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV2PR03MB989103.namprd03.prod.outlook.com (2603:10b6:408:37c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Thu, 30 Apr
 2026 14:49:01 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 14:49:00 +0000
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
 b=ikYmB0VCT0ZXH8OgjQ+U1W2B1Hjzxs3s/vNLqIAiL3U5SqyHm4V3pNAy9t35coA6WZyCRKmFygR/E9mVRP7wMBsLYYKAc8A8xhlBzv7kPFYeaq4C146XcwH2O6gQ14nkqjKvfY2C5ENTQgyMfGgBT6JmCU7LRTaRlGo1cIinGNLi6aeGveQHKyc0pSqjFHegfOJwcBunjmjt+kRpA5Q6RdNoROIpDI1n7JK8jQ1qa3jOD5pp9RNplUBw2oy3aK1sdKxXaN1IBUWEqg5hBY4/MrVyeZQps6r9CWRZbNMvs+SJmOnRjVizsETvC2UuKF1P6gr52IlN5sY6SEl1BnSjSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmU6MUmLluP/eqvhj//rsZBMT68fVMkpHByYLJgvAUU=;
 b=MmuLgwlBcNGU879YzIFyixc549HEc0tjKgmrRBlcvXneM1KBN533owgsZsfgoI1JoL/upyUdVNHNgIOJGRRA4ZoGROrIyqKI1a/luDKYV0/O1SbfqG5H2IefKpolpyU80ekFfMKrJRmSX21IzHCZXPZT7bgp2GswbjbqBBP884q+f1BRjIO1a1rE4LJzUsgJRPnVbF/8LUSC6OJZlRqGWa96vUiPyJ+t23jWLeYlQRFTQbdu3tI8YuaINZ7LB0FddCupLnOXdScw8ZH/CaRbdF/KyOc4vYQwfYTeOXorCV3h/QP7qJAR3p4HibWtfVGB7x3rxEwbd7syQnQMFEg19g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmU6MUmLluP/eqvhj//rsZBMT68fVMkpHByYLJgvAUU=;
 b=ROxJk9z1vVdaCwsbivHbTNHlunb09PYS/55SFhKv4ZAXSJ9m0aCH7iOzpkJqcHmTAQAKLaU+UpLjF4FGCoQYCwcdkQ56q/e06maHYZfzuVmWZ7MRGn3qK8XNveX6OCV/IrJUmQrxwaYTBJw71i2BE4080GqeCcEE1cc0ZyxtimA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bc22f741-ed97-4c6c-8ec4-9722a4dc73d0@citrix.com>
Date: Thu, 30 Apr 2026 15:48:56 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/cpu: identify uninitialized CPU data using BAD_APICID
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260430114647.94526-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260430114647.94526-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0249.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV2PR03MB989103:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a526c19-1eea-4fa7-a733-08dea6c79d77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6qzK+704QQrwosmyhNM3Sy2hfzsuw5O0dnFTIMZhpBcgfbFGAEqwFp7y8Hx6yT0+EsAQKL4hxnrDr/Renr1+7Cr5JgJrCya6ocEz7kO+LOq0jye7WVdBmtF3jUOIZBVIUBIAQ+w8a2z5VKOdGYhxDu5q+rNNRPCL9AL6oP1KjmzFwBHA3H/CgrtmgYsf/BRyQgjKopcmGAqiSbTTGazKPcWN5z0485+dmbEiTFWBA/yrrl95BXiqe7CKKkN+UGQDlIxGn/741VL10yX042UT2QUZC4q/in8gvpz2jBlowsKmfOG1YELzNy/Iyj4Hgqzxp9DGmhVezjMoIS8y+fl3PCnJZ6vvlrGOIb/+Pr7GnLR8f3G7CSPpLM/416SveIkAe3pd0Mwj9utwugc5HDeE2jL3CvttQNqb6wN75eW5AX1tq7vWUrhA/8X1AIqELZhAQbnV/0F3pgFaHKDvWPilrACuMpzVF2azkS9s0YVmyeRuWmccV4icZS9KxUS/g+HHp1Sy80hUi3kwOjrBzUMdLK4tfGe0GDus6aJoWUvWiC+qnDEzj6+RXlNv2GDoMDXnSkrOz11Ve36QjV+6l6CFMeWL8j5YUbqScu/vw4+0AggG3F6CpEXSzPunqww8O1rHjRd5niieL6DUWbyxvjxobb76IpRm1mf0gyRQsDwTaY3j4xHysSt4HWihPVi8UQaKHScwnY6vdf1m8j6Q2zOi+gD2/g9hj/Tb/0BKoEOitDM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K21zUDdreW1nYjluMHBjSmVldlZIQzZiWGhkS3dYUDJTQkREanRUMWVKOGhn?=
 =?utf-8?B?WmRrQmliQ3ZYaVlMTmNZeEhBS09BMHZ3TDRyR1NPbUpGWlZ5RDA4cmZVczlP?=
 =?utf-8?B?R1dhSGplOENNclZqTExkVXFiZ1BpeWZpVk1xV0FPSktrYUVUWVJkL1MzR2hN?=
 =?utf-8?B?MENBUTBlTXloMER0R0J5TmxkUUh1dkl6Q1VLejA0cXA4b1ZQWlR0b281Z0Y3?=
 =?utf-8?B?K01FZ0cwVXdlTThoY205SSszRkRIMkFlWjdMK3cwdExrTWJLeEN6OWQwZWJM?=
 =?utf-8?B?Ty9LeitNWFA1ZlBvb2FIZkJ1VmhKY2FMNDZvbkJ3dDkvZjFHdlpoYk1nUVFS?=
 =?utf-8?B?TmVWKy9JL2MvZS9sTWsza0lVZkJNY0owdklKY21IV0wxcCtMRVJNU0ZRMEZT?=
 =?utf-8?B?ZjVnTTBuMjBwWUpCdjlMSlVVQkVUeE9ycTJJcklSd1p2emJic25SenlGc1Vp?=
 =?utf-8?B?Q0dML0c2NDVUZXRwb2EyeEdlRjNvd0YxNDZNUXAvOWpTMUFPWFB1MTI0Y2dW?=
 =?utf-8?B?VWVqallGUTZIa1lMZUFBOXVwcE4rR2IzOWVza2dZbjVaWnk3aXdJZVkzRS84?=
 =?utf-8?B?U0MrQktMNzgvVFhwckQydWVkNG1LUjdnMGxPS3YyRFVRYzB0cGtRNWFrSWtN?=
 =?utf-8?B?UjczLzl3U0tzb2x1dEtTWFNyVDcvR1ladFJpMCs1anpqa1g2V0s5YXEvUU4z?=
 =?utf-8?B?a2loRUpNSXh3Nk9XQ1hDUkZtR3U1VmI2R1U4SzA4Q0JEYnl6UjYzNXd2S3dG?=
 =?utf-8?B?clBlWUdZT29meHFyeW5sbXFjRHp1Vkw2ZXVreHg0eGxvN25TTnlTSlJTSS9V?=
 =?utf-8?B?eGNFcXpoQ0RTMytPUkxVcDhrQjR3dFRWVXJoSmRGY2JsTnplbXVocHFFWkJw?=
 =?utf-8?B?Umw3bXYxaVdJZllRdHFRMFFpWmxIRlBHbkx5dktLcDNlYzJDemxKNGwxK0JJ?=
 =?utf-8?B?WlJPNmRmN2FhUVdrbm9RQlZOYy9lcCtnTk9QWHNpWExLVTVmc2ZNUDhTWkpw?=
 =?utf-8?B?S09yT1BxY1lLcXphUElCb3JXTVJaTnBjT2dTTjNaV2pDckhYL2FCQXFGdldp?=
 =?utf-8?B?WVRCbUFydGwydmJyTXh5OGRYRkllRnJ3WWFHWEVJeGE4bUxiQ3hya1NDWHBn?=
 =?utf-8?B?YnNUUTdHRENEb0x5UmVBam9zSEYvUUFaTnAya1RyYXliZitYVU9tbmloYkdT?=
 =?utf-8?B?cm1tSUNOaVlMaDVMeGxVTGFPdXhWOHJob0N2c3hqY2VYMzVCcGEyUDR2VVRO?=
 =?utf-8?B?Nkl1THA4SFZ3ZUw3aElDZDRrcmZrNUE2bmZoS1VFa1pOZE9NRmlBK0xKdTIr?=
 =?utf-8?B?bDhBU2g2U1Y1Y05yeVliLzhycWQzZVd1VU9RSG45Y3lVU2VqQmZNM0thUTZO?=
 =?utf-8?B?ejZFT3QzVWZVdW1YbitjUy8wY0tBNE5rc25BdW4wYzUvOTFEKytBVHhXdDVW?=
 =?utf-8?B?S2lPcTRLUHppRm5BemQ4eGJycmNHUmhaWVpydkVhSzJmQlUzdGwzN2c1TnVs?=
 =?utf-8?B?UFU3aDI2YUVmZXMzZEtYQ21BMDBCUUN6Zk1rNncvUnZjRzM3SVVjSzlYOW9R?=
 =?utf-8?B?TzgyVDZtWnN3Ukk1MFNRU2RZRkxJRGRLSEdyUjRTK0c5eGtzaEpjK25jVThQ?=
 =?utf-8?B?QXVxMEY5SDUwODUya3dkaDJZUWxFeUFRck9WSmVKaTdsUy94ZFpKazg0MFFU?=
 =?utf-8?B?MzRhczBSUmhlSmxvMnhtbEJDSTZaNXM1cDlNV0d5OVpsVHQ3eEVMbis3dkNO?=
 =?utf-8?B?MmhOMEFHMGVQNTl2dHZxUWl2eFBseE0zQk9ZR2ZxZU96NVdrVkNJRXVyS1oy?=
 =?utf-8?B?Q0VsQ3ZqZkNVcE85WHRUQ2J1WmRVWFlReEhzbHU3Zmc0cnRNV3BaOVdXR0Vn?=
 =?utf-8?B?eHBWU0xrV3NzWnJMY2RDa21ENlVMN3B5UEhZbjZxYmFWNjFmQnIwRzZxR3dP?=
 =?utf-8?B?QUxjRFBEQnVla2k2dXhLbTFNTVNPYTVOaUJpY0xzdENpZFEyTGMvR3JJVE92?=
 =?utf-8?B?SjQ1azdaUnFRSThDbkZ5SVZqTWI4Z2IybngyODNJYktveW1uRktLdHAxa0U3?=
 =?utf-8?B?SmNtZlNCb0dHckl4SDg1ekxyMnBKUDN1eXh5U1N5RU1HN1cydFNCdmM5QVRU?=
 =?utf-8?B?eGRZc2dJbk9LK1dqNjYyWUxiT3ZQV0EvTTVKM2JJUEhmdDc2YWpGcFkyMmFq?=
 =?utf-8?B?RkgxdUFQV0grMnFQaGJqT24zajNaYmJMUmRrYjVjRWt6RVlkbVRZZkYzay93?=
 =?utf-8?B?SDFuQlBZVHpXZHJRRXh3SldaNEZCTW5YcXZJckp0OFR6MUVWNk1nYkJwQ0E0?=
 =?utf-8?B?VVZaQWYzazZWbUY1MWlHckwwUUFoRWFBaS9aVG5ZZjNTSmRrdDdxMktzZkVi?=
 =?utf-8?Q?jHmeVzgLrPCgVQg8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a526c19-1eea-4fa7-a733-08dea6c79d77
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 14:49:00.4794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XWW2CDuE/ERHk9fOoGztfNU5XErM+EDvf5keazqYYfy0M+dv/jmNoRHDCrApM4dMgltpDbc4u5KLOQ1XB6c88nTEfMQJeKQRUFvnDX/RzQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR03MB989103
X-purgate-ID: tlsNG-c201ff/1777560543-2B961443-AB81E192/0/0
X-purgate-type: clean
X-purgate-size: 1353
X-Rspamd-Queue-Id: 819F14A43EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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

On 30/04/2026 12:46 pm, Roger Pau Monne wrote:
> Uninitialized cpu_data[] entries have the apicid field set to BAD_APICID,
> not boot_cpu_data.apicid.  Fix the check in cpu_smpboot_free() to use the
> correct condition.
>
> Fixes: 7126b7f806d5 ("x86/CPU: re-work populating of cpu_data[]")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/smpboot.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> index 491cbbba33ae..ff05955bae40 100644
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -961,8 +961,7 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
>       * In that case the socket number cannot be relied upon, but the respective
>       * socket_cpumask[] slot also wouldn't have been set.
>       */
> -    if ( c[cpu].apicid != boot_cpu_data.apicid &&
> -         cpumask_empty(socket_cpumask[socket]) )
> +    if ( c[cpu].apicid != BAD_APICID && cpumask_empty(socket_cpumask[socket]) )
>      {
>          xfree(socket_cpumask[socket]);
>          socket_cpumask[socket] = NULL;

Yet more fallout from that change...

This is the singular use of apicid.  We should consider removing it, but
that's a change for later.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

