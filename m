Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOYQJ51f4mlM5QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 18:28:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD8241D1DA
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 18:28:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284554.1566269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDm2u-0000L6-Ql; Fri, 17 Apr 2026 16:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284554.1566269; Fri, 17 Apr 2026 16:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDm2u-0000Iw-Nm; Fri, 17 Apr 2026 16:27:56 +0000
Received: by outflank-mailman (input) for mailman id 1284554;
 Fri, 17 Apr 2026 16:27:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wDm2t-0000Iq-A7
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 16:27:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDm2s-00ABQP-JM
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 18:27:54 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69e25f8a-e002-0a2a0a5209dd-0a2a4503900c-0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 18:27:54 +0200
Received: from [40.107.209.10]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69e25f88-672d-0a2a45030019-286bd10af93a-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 18:27:54 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by LV4PR03MB8281.namprd03.prod.outlook.com (2603:10b6:408:2dc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 16:27:51 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 16:27:51 +0000
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
 b=XwffeYE4MaMbHKnEgNrLcSUd0tjLHmkhgc7phfPReejsK/zGzc7SWxvhKFmt+SVlhE0hc9j9LydTuLeuoHk5JEiWiQBu8STt27FvcjBeCvOJ/IfrIBD9OOrKYDTgO7/4SCiHPbswzWZHBHX9WtTnKK/qZin7TzlWmWhk76b+TgFhHfYkrCMqDSuRIm2V1FrWZD00VDfO1XJC1E5VjBKW6owfFUgvrVscJL/ydXPGtaPAl9w5E9qy8f1e9d73D+V/zOP7rOqtvdayHeWooF5vsN7mXo31g2XzGsbtAQcTmfouYg+r4HnxbEIltNNyNaCrFzS3P29KHgAy1d/s9BSBww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtLvE4RacGmVpg8gOvDV8JUO4ULJRNtAd5z6yJb/2p0=;
 b=vT1I7RrpBY6G1W6TzPvoO1SeMEm7ELpW3UphUDtHo2Jnwb+/RYotk8nUbTgDZXs6OuLZO9k2sFQ86BBfVL4r2RM7mvRTRTUC1ethoLwRHS7YbR8KbQCxVPmGlwkrkJuvCF6KsPvvcbl+nheb1JMhtf461xaJEOEOeC5M5syXWQ/FSKtbsErD4ig9wkiFSK+dQJSy69zGQeh8e7vRQG90pR538ovNFMXxdhhACd3VRR41Gucl8bZIVj0vxUfBntjxjl2JoSfmDwsAASw14LUykIV3nR22uNEPbc/SvsJVpFOF2X0HoRqEHeibdYRI061z/G/Y4S5cf1JlDuU1lpcYRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtLvE4RacGmVpg8gOvDV8JUO4ULJRNtAd5z6yJb/2p0=;
 b=fZ/cBloBanlYNb/cgzYe2u/sjmFw+reMDWjijvW87EQ5J0tEVj7TfuusJDyLMUbDTVXOHoW2twJzsFi4LNAyaJg3242zOC6AjAlUpi9kzJigwKmu9vYEFaqL1EWTdObX+RkMWABjowWYusCnkIS60XO0QDEHG1JAWcR4vsMD6xU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <85625a6f-8d04-4863-8f74-461c9a85464f@citrix.com>
Date: Fri, 17 Apr 2026 17:27:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Force error checking for reserve_e820_ram()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260417160828.526063-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <20260417160828.526063-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::10) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|LV4PR03MB8281:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e83167-2c25-4468-2580-08de9c9e44eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ayEo75/jVyZBlXyAXk0XV5YIrY+5JOTAKkYFQ1aWyNlUByHKTqtZYKhIzG2mez8xz6lvS8p5DYuxGs1khi2i+sXmdYlZeEbaP7Y+sQozsrRhKuHGooqvKHVf3FmQVOb3rdX7RaoB3uitxroDKXhb5ra4bI0PZXQABompPj+fJSPbv9ZH2wUMQwIhtPI5RtnBVSVzfr4AmVHZWDAvOl6AdyMQIPMCzuht84NhQlzwKd9Ntr7QNH37kL523rOGcSd1i8zssvK+/JBoyI9H+8V/M0UXM2r9C2VfY9E4kBONRjB8/PIupb1HTNQoLZ1hCNLs2iVsRH5EVi7SP6trjjWFXkUp4ANqRzjbo7ISbK133UcumpkvdWDhQS36SwFXAtC5FA41XNAU2oJ1FDm7Vx/dLDPKv4jgtEzR7Iw2jVsydKNMZzn7dZOnlcL8U2lpQwAzHly2DhWtDncvmYtb+rImYHBCz5xo6VoqiUS3lIFEHwBbQzWSKYTWrtIO2BN49hXJjgBSURGGPvMAc/1J2PdN5oVHJs5mtfgTcyA6rjAHKw6aUXOdsyNRo1KPkoRhiA1tOt9aBczHWI02w4a7Y9Xdh1k4rCqx5x+4uBoc+NXTNZJQIq8WGg/LeYlB+9XDo80pOCCmsu4M0RfF807z0RkubAp8hnG5PcS9S8Wcmwd+4NVx3EtWS+C1pR8jPd27nZ6huOB19YgwzAJZKyErx8ArwE6U58qOdFihkPqbfhvr8bw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHYwNFk2b2hYMTZ4U3NsWjZQeTc5U3AwRWVTeWN1QmRDT3FsTXNtWFJ5VExh?=
 =?utf-8?B?QkdNRG5uREh6SmJ2QytiQTlpV203Q1paMkU5WWpqK3lKRWt3VDk1aTM2L0xS?=
 =?utf-8?B?d1djbHZaenRtaWRZMUJxb0VHMDBEdTAzRWlnTWxHWVJWV2RtdGZ2SFcyVDZC?=
 =?utf-8?B?L3JaSHRmRm4xVldwYnI1VEhudXNXRTY2SzQzNFM4YzZTa0pXYjdxUUhucGFP?=
 =?utf-8?B?ZVZPNnBiTDV1aFpLVzJ4NUdsTmhmUkxIZUNOT1hpeURPdnFTbk5rN253eUwx?=
 =?utf-8?B?M0NhblMzUW9GMHRTaDBRbm9XbFA5YVh2S0t5K0ZmTDQ5bC9XY003RDNIbWZJ?=
 =?utf-8?B?K3NFVHVmcHJKSHJaVUZnT1Z2S1JsQlN5V1RaeXkxaWNZanZPNG5LRG15YmpS?=
 =?utf-8?B?ckpjWEZDSHRsbnZDOGJJZytxMzI4ZzluMUxsbFJ0UHFlYWJuQzFDSVhUck1p?=
 =?utf-8?B?N1ZNYldMT3FOMXp0QmZiTW53bkwrR2k1NUhCcGY5SGZXc3IwSWpVRjFIMGtT?=
 =?utf-8?B?c2sxeFdYa0dxMmxmKzBldCs3ZHN6eUxGZ2xwNERENFZRY3NjNWRhdXo1WTdF?=
 =?utf-8?B?OWl1bzh1Y280MUhadkVmak1KY3ZXT3hDaFBhdWhBSjkyRzhFWUVqanRkeWZi?=
 =?utf-8?B?ckxsL0hMNE5hT2M0L2VJNndoWkJNbENvdmwrUkFHUHFIOGhwbkJsdUhvU09t?=
 =?utf-8?B?TVJuUUwyTXZLZUJ0SVFqaHJ1THZrZXZTM21FOVpTWlZudHNBNktsbW45Y1NL?=
 =?utf-8?B?N2k0UTM2blh5RmxCUy9MeHBUVzR1RU1kWitVaDN5cG1WMXdnK3hhMjZUUUZt?=
 =?utf-8?B?RWdtbFJoci84MUFySjM0TDBOYXNIWjJKaGlwVkJ6dndRd01TNERkbWd2eDA4?=
 =?utf-8?B?OTg4NDBRNXFRUmJUZ1VoZHcySzFvMk54YXNlRnppSzd5Y1AramNlTFRMSVNZ?=
 =?utf-8?B?eXJnQzhWSDd0VzZXYldWd1BBV0h5UWtFaDVWcUdNQm8zWDR3aFk5M0I5V3Rs?=
 =?utf-8?B?REsvV3FodkZSd1p0SzJrUDNyVU13emhnUjlqT0E5QVVhMXg2anJLOGZlS2Jy?=
 =?utf-8?B?U2I0R2pRNEQwWjZUclpDVklFZWwxSkxRT2RlMnpCK3lSV3EvU2RkbnJpU1Bv?=
 =?utf-8?B?YUplWmQ4Rzd6Q3hFYkZPTU5lbWNOWW1JK3BqQVF0NHNWOW5rMWs2ZytYWm10?=
 =?utf-8?B?b1YrZzFzZzJXSjBjdStZWXNQV2NsZVlxSmxyMm5NSE9yeTdKRGhBenpPZ1Za?=
 =?utf-8?B?UWZWM3ZiYS9jQ3FURCtTY3ZPVG5sOXVuSXE3UnNhbHFmd2UyanNMTkpuVDli?=
 =?utf-8?B?KzFOekRuY21pa09yaC9tVkNYM0VFcHdGellFcGV1bm0wZkNKaWxDb2dmYmdh?=
 =?utf-8?B?UmJCRkI3b211NlRCeXdnN3c5VjR1V0VsdGhaRVVNL2FHdmNEN3pDR2ZTWVll?=
 =?utf-8?B?Qy9rREdQZlk2R2tkTmtCRmJ1UGdlU0UyMXNadFg2a1o2U1RCLythWm5xejZ6?=
 =?utf-8?B?Q0QxNEw4RlhBdEVwenBwY292aHlVaG0zY01xb1hqbTBrTXcxWGVGMlJNV25O?=
 =?utf-8?B?YkRGS2tkd2pPdVgxS1o2RUR4czVMSjJSWnNYYU9RRHROdGd4YkZYaXV1SHh0?=
 =?utf-8?B?MUpuVHM5eERZRVR6dXYremtHMERvVEFIRUxBaE5KeHlwNFBmcnFMRWhWRFlZ?=
 =?utf-8?B?amVQNERUTXJyVFJGdWxibzN2a1VsNUpsTFJ5SWZyVG5qc2hLSmZ6MU8xY3N5?=
 =?utf-8?B?WDFrWHZGcjQrK3FINlVncmx0bnpWQmpmckRqelMvVCtudTMxNjNKU2lLdlRw?=
 =?utf-8?B?bXg1YlJ4REZaS3JjMjV6dFhjb1lFakhjVWJ3UWpXQ0RrblVScW15ZlFkNitC?=
 =?utf-8?B?cVhFcWNZd2lsRUFUQytndE1XTjQ5UHBZMzhxcjdoZUhMSGIwYXBDcDJpMjhG?=
 =?utf-8?B?NFlQY2NmQ1U1RGw4dVJXWksrekZ4ZGpZdTZmKzFtS1g2cFc4YzJTeGF3Ui9W?=
 =?utf-8?B?dHU3MXBQZkM1bk51c09GaUVGTDB0cmlXaEVqY1haRGw0T0J4R1RZTk1ibFEw?=
 =?utf-8?B?UGpSYVhBWkVqYm0zYkhraEJINDN0eWZYVDRGcGVDNi93aWJxbEltdHd0ZUpy?=
 =?utf-8?B?NjcvbzZQN2orSHVWRHN3dWNiV1hHWkVRdFNGbWlLZy9pdEwyQ1ZNS3htbjZP?=
 =?utf-8?B?U2phNW9CQjZNV2EwTDJTbzhqd0FZQ2piZGJpZmtoT0dtZjJJQjQ4R0p2OFkr?=
 =?utf-8?B?eU9aMWdKUTVWNG9OZmpWeUpwV3ZnVEk3TzdLMXpCZ3A0VGt3NUZhalMwalJL?=
 =?utf-8?B?SDVXQzh2MHNheHBLSXRRYmZSYWgxOEUyT2JVU2ErNVhScTRhck9UeEt0bXYz?=
 =?utf-8?Q?JY9JF+yoCg+MnRg4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e83167-2c25-4468-2580-08de9c9e44eb
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 16:27:50.9981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFZOrA8S9A8Z9nkIL3gCbk3Cesfb4y7UnvAt3+A0/e5LouvHwO+Ofx4Ts1kPGvOSjqfQQP+Ot817Vmj/kQNGJdrmGbrVGLgiXtFlLA84UHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR03MB8281
X-purgate-ID: tlsNG-33051d/1776443274-2B56F938-9F749A29/0/0
X-purgate-type: clean
X-purgate-size: 4086
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid,suse.com:email];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
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
X-Rspamd-Queue-Id: CBD8241D1DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/17/26 5:08 PM, Andrew Cooper wrote:
> Failing to mark Xen as Reserved in the E820 is catastrophic; RAM regions get
> handed to the physical memory allocator for general use.  Similarly, failure
> to mark the boot modules as reserved is not going to result in a working
> system.
> 
> Mark reserve_e820_ram() as __must_check, and panic() on failure.  To avoid
> opencoding the range in every caller, print a general failure message in
> reserve_e820_ram().
> 
> Reported-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Teddy Astie <teddy.astie@vates.tech>
> 
> Slightly RFC; only compile tested so far.
> 
> There's no obvious fixes tag.  This has been many variations of broken since
> forever.
> ---
>   xen/arch/x86/e820.c             |  8 +++++++-
>   xen/arch/x86/include/asm/e820.h |  2 +-
>   xen/arch/x86/setup.c            | 11 +++++++----
>   3 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
> index 872208ab3722..f09a01f0c50a 100644
> --- a/xen/arch/x86/e820.c
> +++ b/xen/arch/x86/e820.c
> @@ -670,7 +670,13 @@ int __init e820_change_range_type(
>   /* Set E820_RAM area (@s,@e) as RESERVED in specified e820 map. */
>   int __init reserve_e820_ram(struct e820map *map, uint64_t s, uint64_t e)
>   {
> -    return e820_change_range_type(map, s, e, E820_RAM, E820_RESERVED);
> +    int res = e820_change_range_type(map, s, e, E820_RAM, E820_RESERVED);
> +
> +    if ( !res )
> +        printk("Failed to convert E820 RAM %"PRIx64"-%"PRIx64" to RESERVED\n",
> +               s, e);
> +
> +    return res;
>   }
>   
>   unsigned long __init init_e820(const char *str, struct e820map *raw)
> diff --git a/xen/arch/x86/include/asm/e820.h b/xen/arch/x86/include/asm/e820.h
> index 8e7644f8870b..a86d60ce3e77 100644
> --- a/xen/arch/x86/include/asm/e820.h
> +++ b/xen/arch/x86/include/asm/e820.h
> @@ -25,7 +25,7 @@ struct e820map {
>   
>   extern int sanitize_e820_map(struct e820entry *biosmap, unsigned int *pnr_map);
>   extern int e820_all_mapped(u64 start, u64 end, unsigned type);
> -extern int reserve_e820_ram(struct e820map *map, uint64_t s, uint64_t e);
> +extern int __must_check reserve_e820_ram(struct e820map *map, uint64_t s, uint64_t e);
>   extern int e820_change_range_type(
>       struct e820map *map, uint64_t s, uint64_t e,
>       uint32_t orig_type, uint32_t new_type);
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index d041cbd5f6f1..9c1f1eafa0d7 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1639,7 +1639,8 @@ void asmlinkage __init noreturn __start_xen(void)
>       {
>           uint64_t s = bi->mods[i].start, l = bi->mods[i].size;
>   
> -        reserve_e820_ram(&boot_e820, s, s + PAGE_ALIGN(l));
> +        if ( !reserve_e820_ram(&boot_e820, s, s + PAGE_ALIGN(l)) )
> +            panic("Failed to reserve boot module %u in E820\n", i);
>       }
>   
>       if ( !xen_phys_start )
> @@ -1652,11 +1653,13 @@ void asmlinkage __init noreturn __start_xen(void)
>       /* This needs to remain in sync with remove_xen_ranges(). */
>       if ( efi_boot_mem_unused(&eb_start, &eb_end) )
>       {
> -        reserve_e820_ram(&boot_e820, __pa(_stext), __pa(eb_start));
> -        reserve_e820_ram(&boot_e820, __pa(eb_end), __pa(__2M_rwdata_end));
> +        if ( !reserve_e820_ram(&boot_e820, __pa(_stext), __pa(eb_start)) ||
> +             !reserve_e820_ram(&boot_e820, __pa(eb_end), __pa(__2M_rwdata_end)) )
> +            panic("Failed to reserve Xen in E820\n");
>       }
>       else
> -        reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end));
> +        if ( reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end)) )
> +            panic("Failed to reserve Xen in E820\n");
>   

This condition is inverted.
Otherwise this looks like a sensible change.

Ross

