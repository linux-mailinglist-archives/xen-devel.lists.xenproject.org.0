Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOZrNl0LcWmPcQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 18:22:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDCC5A760
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 18:22:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210056.1521901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vibuW-00039a-3z; Wed, 21 Jan 2026 17:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210056.1521901; Wed, 21 Jan 2026 17:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vibuW-00037Q-19; Wed, 21 Jan 2026 17:22:28 +0000
Received: by outflank-mailman (input) for mailman id 1210056;
 Wed, 21 Jan 2026 17:22:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZBm=72=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vibuU-0002vb-Lc
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 17:22:26 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0b9e4ae-f6ed-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 18:22:26 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB8241.namprd03.prod.outlook.com (2603:10b6:8:268::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 17:22:23 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9520.005; Wed, 21 Jan 2026
 17:22:23 +0000
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
X-Inumbo-ID: c0b9e4ae-f6ed-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lsWM9C4FU7yyj0obhNdgq5YDT91qFH/8vHaXiKsH63A486khHJn2+vMLwutWamGnDp4Jldm7eUWs30BZp3wvdpXj7xXElv3E8FOnuBOBgl0CmjgFxWuOTSAiMMmf6k0IzRLTwnxhQmcTwqT3t1mzr3vVmHwkpSLAN3qZSNDyfcE0Ak9OBKcmcAltKbUTrHekTa6GXW0ln+sCYm0BEbmGZu1YJCKLk+d5qbNpeMFOhv6kt5uq1Cbs9q69Bs7hMaMrlH7GZBzbPFP6Ibv8Pq4qziGNoLGtvbNofY6R0j3rRHD9tOXwdZQDzJQuBfeH1my7IVGdoX8kxlU9RXKVIhHwPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zGftGTYjP7yuwq+tx02Mk2FlcNJSw+Iwt+/cRGtx7w=;
 b=gimVI4YSgVKcvDYlPgGNo4sm01Bu9nhmPiefrzR5Itdq4mOeFIhDCW5Aiok14OelWfU2xRuoj4/PUp9Qjk2XRJHLiHGBgjs26Li1WqWSHLPwseuF3SQu4sXRkmnesNNMDpte9VTsC+wFq5oWizVDwrL5KeJi2up7DQWI0EnBmdmirAc305NZNQeVV8uUJXcwigweb3i9xGt8vUc6LZg4WRpSlQiXiva0VX1MP4644ICq1k2bcQ3rarYOr4a4OvikaDRYBGVW3oi4wIae7MLRdFRB6ieWiSYS10wv8RG7McjpbZUJWUS/SgnXd7KP5ypE57x/HfXEHEQEdPlOTdrMhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zGftGTYjP7yuwq+tx02Mk2FlcNJSw+Iwt+/cRGtx7w=;
 b=cJbmrM2/38iTLzbsvAObqDVuA9kR1abTreCSJPhDs1HBjqfCcuf3a9lh/FefW9NPeedfMkQ+eH7RIRRXPPopeDgWrQ5TtBD4AKeIgYITd88bucLqE3JJVI5z/ot/K2gmdT35tyINplHb+y4xS7sRZQFrDrxBwTm+H1jaVQ1PPPY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 21 Jan 2026 18:22:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] symbols: ensure sorting by value yields reproducible
 outcome
Message-ID: <aXELS757yrw5EOOb@Mac.lan>
References: <980b3fe5-ce30-449b-8e0b-d0f6e91dc688@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <980b3fe5-ce30-449b-8e0b-d0f6e91dc688@suse.com>
X-ClientProxiedBy: MR1P264CA0154.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::20) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: a8148c24-a5c0-40c2-887d-08de5911a3ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDM0Q0hVYVJRakRwVlBFR0tyaXNPYVEwUE1xaGxwUVQvb1FHdWFCQ1J1ZlVa?=
 =?utf-8?B?ajB5WFpselZHN3dmdmhocW5iOEE0MS9aTXErY1h4QlhNemUwdlFMWVpuRlhQ?=
 =?utf-8?B?YXRMd3VkYXlPdUNacXdPcVhPemhwcVRWOUc1aVpma05DU1dvNUlCdzlIQXc0?=
 =?utf-8?B?cVhleWRvYkdYV2ZSVDJ1VFlUNW00eE9lSjBGNHhFb0J2SHFkR0JGSTFrU2VN?=
 =?utf-8?B?NFdvb2xOa3BlQkVPL2tUWGV6UE9GS256NllMWVk5bVV5QWd4RUdHVjlFb3hI?=
 =?utf-8?B?MVdGbGJMNG5MckFRNVhEVVdRWHBRNU9mZTBxZExyQjQrbUQ0azBDdUJ4THYv?=
 =?utf-8?B?eHNqV2JHOW5RaCtReGQ5dVBVN0VaSFRhSXVkUHdEQUxnZ2Y1TzNzeHZZSjJl?=
 =?utf-8?B?a3dxaXBZRDUzcTYzWURTNlczSDI4TUQvQzRRK1RtckN6MGZTSmIzeHJqSURa?=
 =?utf-8?B?dldqSWcwSGZ2NEcrb2t1YTE2UzY3MGhQOHZ6b3lCenRvcC9TSnpxR3pxRWxy?=
 =?utf-8?B?Z1lucVpMcFZNdkQwWUh5ZDhDMkc5QTc1enZTaVk0MXpMaENPaDZTK2U5VUJO?=
 =?utf-8?B?QzduYWhhdFdxeUg4WGhNT0NyNkY3eEw5bUVhNWx6ODlpSkpwRFZ4dkh5MDh3?=
 =?utf-8?B?UkpicXAwT1BDZGpsU0ptbXNMY01RTDBza05uVkhoeHpDckRvKy9NRFpJcFE3?=
 =?utf-8?B?b1d4WVROMWdNUEtFK2txNlozL0xoZEpsZUlObnpPWDF4KzlnTTJrbkFNWVg2?=
 =?utf-8?B?cUZlQnhqNzFWRkR4T0Nsbm5sUnV5L253dk1wN1djeGpRUS9aVm9ubkZnZHBM?=
 =?utf-8?B?VHlXR2MxMVp6d0FIUXpzb1ozTWErUUFBdGg1MlQ2emhDQlY4WUNSVGZrUWVm?=
 =?utf-8?B?YzRDSHlPZUNZeGNHaHYwVXd2cDdDQkZzL1ZSVDZvbll1bTFmcWZNb3Fna0hX?=
 =?utf-8?B?eG5sbjdNbk5vMFBQR0gzRWFZTW12MXFzQ0o3dGR2NERLOU1aQlN1UUpwT2pr?=
 =?utf-8?B?Z0toUk5PZ0p3OWVPbTRkOW1WenVTR01QU2ZIK1JhY1lhVWtka09JbS9lRWN4?=
 =?utf-8?B?VmlRdTFzMTk2R3dDdWtBWThocTQxU3NyYXFpTThUeXI4V25Rd3A1cWtTY2pi?=
 =?utf-8?B?bWpaWmYydy9ET25DWnBkalVRY2VKSm13Mzg0VXpJWDdkL0NjNW9nOVhONVFT?=
 =?utf-8?B?dnFabi9TYmdrVlBaa2xUV244cysvOXFsbmFzOVo1ZGZuQVBvWHUyaGRpVyt4?=
 =?utf-8?B?bmZrL2NvaHUvOVpIVTFwY2lrWlArc1NwZnJXeCt3eVptS2tKbm1NWlpjQW9l?=
 =?utf-8?B?UGhIQmVpSDA4K282Zy9hRktmNHF1Y216dVdzcW5DUUt1RFVha0pLN2tQUTJR?=
 =?utf-8?B?V3pQYzd3NEhLQ3hTREZidUhlaWZmRE1mL1NYQmw3U1JWNHJ6VnpnRkpRRHlh?=
 =?utf-8?B?R0kvV2dJRndZaHdCeW4wb1VUS0t4ai9QMm8yVFZ3WHgwVjR6UFlaMzk5Y3kz?=
 =?utf-8?B?cVZFZnlFdG9FUW5UaGJEclFyeVJoZFEwTU5qa0J0ZkhiK2N4bmJtM2oyc0xH?=
 =?utf-8?B?dmJnRkdYem5vZDdzdVFkNUF3SHh1NGUveExpVGNDZ2FreTdJQjVUSUFsU0lX?=
 =?utf-8?B?aTh3UENaQzJUWHNlVkdQTU1uUVgvNjZSN0kwN2RYUyt3c1dNdFlzQ3BWK2RR?=
 =?utf-8?B?KzFBYzRHbCtOMm44Zi9RR1NOZEhGYlR4MXFuM25sRnJ5eVhmSHNpSm5qZm5D?=
 =?utf-8?B?S216R2dlNUppRWNlNmZ5ZzN4V2RLanZHSTY2clZsSlgyTkJ6NkIyanlsY2N4?=
 =?utf-8?B?RmswQkFwWkFvVWtudGNEM0tIaG1yN3BnRjNjaEFFTC8xYU9NeCtmUGxwRjNw?=
 =?utf-8?B?QzVuajQwbHY2c2IrMlBFUW4ycnFETEZIcG9aa2ZLRGNhc29sc1AxaUFoS3Vl?=
 =?utf-8?B?MC9rOGNIV0tXcjZaZ1k4RU5mM0ZZc3BBcVJZYUZXNFRkRnRSNERQTnZydVgw?=
 =?utf-8?B?ZVJGMXdrTkNDUml6Y1FTSkllc3F6ZmJIYU9vY2ttaWxyOVV1ZDAvWmY3WVlY?=
 =?utf-8?B?Wk1JT2ROWStyY1NnTERKZzdncmtLMmN1aUVyODVteWpVSWhSbVBqdjk2QzBa?=
 =?utf-8?Q?jBEI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2hHVEpyVW5kODgxVmpwYjlvdDVaOEZTMzY2RlVDaUYyelNLM1RQS1RTdGJJ?=
 =?utf-8?B?STc2UFFKZlJGeXZKSi9kYnpPczdkQ1pPdjRmUE5CTTcrbnlJWE5hRmF2Uk5w?=
 =?utf-8?B?MmZmSmprRlZHSytnN1BFeEk2aEw0VVl5elArbTZDTm0xUjJQRWlxdU53VDdv?=
 =?utf-8?B?VDFrVHI3ZTdZRWtxVHNUd3AwOHQrdEVEcmpWVFY5NWtBZlREelBOTkZnMnlz?=
 =?utf-8?B?Nmh0MFdwQjBjODV4b1I2QzVadXBvMVM2UnZDN3R3OVV3Q2N5Y004OTdpalk4?=
 =?utf-8?B?WDNJaW9YZDE0WnhPNUdPVXJpcTduTzhJZ05WTXIvU3pHbTNUVkVCWXRoeWJE?=
 =?utf-8?B?TWcwRjAveVYrY3dra0xob3UxWHdNVlE4a1c2eTJMK21OTWxQaVlZYnZma3JI?=
 =?utf-8?B?VytmOVJRazZseFRLZnpuWUJSazFNN01PRjAvRUMwZGtvMnI3ZEpPN3JPajM4?=
 =?utf-8?B?STZhYWhmbUE2VUVuV2NReElWaENLNkRneldFMUFUUGVpZitnMnRHd3VacDNq?=
 =?utf-8?B?YXM0QkJsdHZzazR3a3h4ZkxzWmNEbGlxUGpsZFhXU1hiVHoxV1dsdlY4Z05H?=
 =?utf-8?B?Ym9aMDUxSU5xTkJjODBmdEJ2eW1WVWVLdGVnS0k3cTk3RW5oMWVadHdlOUlN?=
 =?utf-8?B?NHB6L3oxdEY2Rk1PaU5YN3JJNmU0dnJxVkxmQ2VXVTlTNlhyODZidDJzdjla?=
 =?utf-8?B?aDMweG5sYWw1ZG1tT2JXcUtHa0pOYnIyUjFBQmdIYm1EU3lFZjRRTW82UmtL?=
 =?utf-8?B?cnRRNlFsSmhiZGloQTZWQ01WN2UvclQ3dUxXVFhNN09zanlFZzVrc3dxSFYz?=
 =?utf-8?B?Qk52eGRxcm0vTURaTWp1bWhsLzUrTlNEcWl4YWFWRmkxdnRoOWdGY3JvaE5I?=
 =?utf-8?B?NHJIZzNpWk41bXNhUGU4TklFM0NRMUVFSXNWZ0FWSGkvaG1TQWtWR1ZzNnJT?=
 =?utf-8?B?U1pDSmt5Y2hnanNZWUNBTk5JbzUyWmw5V3ZLb0ViY2tDQjE2TVZmeFVuNHpo?=
 =?utf-8?B?dUFCb0hkRHdZYWNGNktpckxIWEN3bEx5dkdaVHNDQkRBVmhtb0YvQXJJWFBR?=
 =?utf-8?B?bklVRGFObEFxeSszNktsY0ZDWS8vWUdqZzBsWkZlV1A5QmdPSkVsVkp6bm9D?=
 =?utf-8?B?NU9xbzI1UG9RQkNkb3d0RU1kL0JQWmh1Nk9UMjUxNmc3Q3phZTBTaUV6WWJo?=
 =?utf-8?B?VDRtbVVMeHpzWVJzanlxRzl3Sm8vT2ordXFsNEZqL0llcTUwcTF2VmQ0RDF0?=
 =?utf-8?B?Y1cveW5sTk1NYnF0VERRQk9qbSt2bnQvaENaRGo0SjNDR01qL0JOcmZ6NUJj?=
 =?utf-8?B?WitDWWwxVnpoZHN4NW1UVUxXNS9tOGNtTno4M0lqVUhOTUU4UVFydDErUVNi?=
 =?utf-8?B?K29MVHhlZGkzYnBGZW1yYVBWMzJHWCtidGVqdUV6N2V3RjhNdlJLNTlJbUZ6?=
 =?utf-8?B?Q0NsL1Q2NFU1MXhyd2dJazZMNHNLd0JWYk40U2tMOWlrTVkvNWRpRzJrNVN1?=
 =?utf-8?B?QnZENjlUZ0M2cFZKY21UTTg1MUZZY0xhK3Y5Uzdnd3VrSjRocmNDL29idGVi?=
 =?utf-8?B?a0paUHNkL0E3QW5EeFFtbkVveURyTnZhUlJjWHBvOGRoZndRRmhFZHBTbWJr?=
 =?utf-8?B?SGo2MzZMZTQrazAvNjlXeVNpWmRHN3ZyYURXUTZ2eDZmQXNGZFduTmRQZkZ2?=
 =?utf-8?B?Tm9jaDA2bWJXZHozYTIzcmtDVE9hUi9tSm1kbnFpMnUwN2R3M3dsQ0g4eFlY?=
 =?utf-8?B?L2M1a1p3U25WQ25xUnhORVpjQmhPay9EWnBBakhxRmhiNzRaMWVUb1BPMmZG?=
 =?utf-8?B?WGdzc0V4L3Bta0Y3VjBxNXVpRlczYzhKclZodzk5dC95V2k2MXdQaWpuWmll?=
 =?utf-8?B?QWdQSjdZSHA4bVZ4d0JkWHJTa2dFZkMwZmVrb1dNNnBERUhmSlgySjk1RWZQ?=
 =?utf-8?B?citJcnQ3ZkgvdjhvQzRVWkloT1U0RnZSbnU5RjhKTlgwZ3dILy9rd2ZhQTN3?=
 =?utf-8?B?MjlDdHZyREhkbjRJY3c3d2NIdlc0TkxMeWlBZU1FejNFVHNKdENqTmdCTUpz?=
 =?utf-8?B?cWtTVWRCZTU0NTJqYkg1djFxUEF3QzZiMkhYVC9YM09FSTQwUzhlMHZuM1Qx?=
 =?utf-8?B?SUZWSEpXRnJuZ1VvRGpYTkQrQUJQU3N1WlhyZmZCcUJZSmk4MXNmdzRMWU83?=
 =?utf-8?B?R1F6U0FhVkc1MlVybXdUTG1URGtEQUpxdXpDVXZEbVVNQjlibVRON2s0S3N3?=
 =?utf-8?B?THdSMm4yL0Q3ZDUzazFEMnAzL1hYbEtOYnhQc3padkdvb3JwYUZXUUoxdU1F?=
 =?utf-8?B?TE1TZFRqeFM0UE5qNWV2R2tVVG42bkh3Ni9yK3FrNGY0SDZyeFdxUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8148c24-a5c0-40c2-887d-08de5911a3ca
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 17:22:23.1621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4RJEpTY+Ge+s5+1Ef+mIb+ki/IwCciNwh5h+mcE5ZbPunmgcwqKjiLuNiOZOiRgyxClOr81S09x5gCko5EFgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8241
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:email,citrix.com:dkim,Mac.lan:mid,suse.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4CDCC5A760
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 04:24:43PM +0100, Jan Beulich wrote:
> qsort() implementations have freedom towards actions taken when two items
> compare equal. The latest with the introduction of fake "end" symbols,
> inconsistent sorting between the 1st and 2nd run can lead to extra "end"
> symbols in one of the runs, making the resulting symbol table partly
> unusable. (Note in particular that --warn-dup or --error-dup are passed
> only on the 2nd run, and only for xen.syms, and that option has the effect
> of doing a name sort ahead of doing the address sort. I.e. the inputs to
> the 2nd qsort() are pretty different between the 1st and 2nd runs.)
> 
> Make the result stable by using original order to break ties.
> 
> Fixes: d3b637fba31b ("symbols: arrange to know where functions end")
> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> I can't exclude the unreliable sorting could have other bad effects, in
> which case some much older commit would likely need referencing by Fixes:.

Lacking a more clear indicator I'm fine to use the current Fixes
reference.

Thanks, Roger.

