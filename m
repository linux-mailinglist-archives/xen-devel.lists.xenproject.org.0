Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFPANh0n92n7cwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 03 May 2026 12:44:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 196104B5266
	for <lists+xen-devel@lfdr.de>; Sun, 03 May 2026 12:44:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299316.1573921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJUJO-0005A7-DH; Sun, 03 May 2026 10:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299316.1573921; Sun, 03 May 2026 10:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJUJO-000575-9V; Sun, 03 May 2026 10:44:34 +0000
Received: by outflank-mailman (input) for mailman id 1299316;
 Sun, 03 May 2026 10:44:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1wJUJM-00056j-6N
 for xen-devel@lists.xenproject.org; Sun, 03 May 2026 10:44:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJUJL-00GOIg-Cz
 for xen-devel@lists.xenproject.org; Sun, 03 May 2026 12:44:31 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69f72699-5cb7-0a2a0a5109dd-0a2a4508d41e-38
 for <xen-devel@lists.xenproject.org>; Sun, 03 May 2026 12:44:31 +0200
Received: from [52.101.70.104]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69f7270f-63b5-0a2a45080019-34654668c8dc-3
 for <xen-devel@lists.xenproject.org>; Sun, 03 May 2026 12:44:31 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by PAVPR03MB9797.eurprd03.prod.outlook.com (2603:10a6:102:311::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Sun, 3 May
 2026 10:44:29 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%4]) with mapi id 15.20.9870.023; Sun, 3 May 2026
 10:44:29 +0000
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
 b=KgULP06lPKMsad0NthR5U7hcFM3s0QCUqQFnVxmYjCseE3E71dCtZWbtaNormf6j+Xw2N4EjAxgNSdTEaCUjvQht2buYqk7JFpB4pqf9v+xHSfSqJB66st/NNRj7NHAH0EWKf74fuck9MgcBmUxgFfDoX0YjRhKTIZIvXQqfxcws0ZbccUCDFEtmi82vfzsNGfvyUMBwv37zlLWDE+snol04vaqpgC1yWos/yuGOfrb8WWNgK4nYoIXCkqnWG76QqwHXCLSQXsSSG5+/5oL6CR+a47fwMVv9bbnoTiwbx4iYk6E01VkZjvxGbp7LSP2/YzoQ9cERwQ2bFh+TqiTDzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkN442Bce/wFxp5ggxMBYftfeg6APOxnMx5BVsNf6eM=;
 b=gOgM6USwo6tYwkqgZd3qFb49VFYDkg9zDCa2Tqu2OGLE2IMWO0cTuvozCMt2Q/RPaJPLq30nsgfHLKWbAiagJdUBGzHo4dxzA4mGVvQnyukLpjWwn1W14Fd6RnHotNeuSbRSLol1HBhDbIiRxvI/AbIhTyGGFvZ36L/Nwqgp/2LJaeUAWDuGNaDgiBqT5ftk/OD+7oLfIlb5L+nqcP46e92mXf6apEDTogbl3hQ538dD3n/W2glNCLAvE1DdfrKwS4hQhxCzkHuVLG4HftAB/KlZR8CWZnW3R0Qi1XkjioiekO6xVlDb4lejxbyxp2hy8VfHyNHBl0VPHOtRxZzrQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkN442Bce/wFxp5ggxMBYftfeg6APOxnMx5BVsNf6eM=;
 b=o1V3skWkrJkqBX9SMr9W+o4Lm+wC2wLbqDvg4wlxxkLWBHTx2s6DD0wjilJDZN4gK8F7DkCwysdT2ra6XYkHyx8RqXndp9xPJMwF1e2UiwMKUd6p0yIdYx4BlDSWxaBHXltNNIH9Ude+mvF36mnP6b4+igky3UcWkIEdy97zQbOMRVs02F7V2Mv7RIft9i7KQLoGs0gLGWxZg6gWo8vN7Oag2+1PGO8Pwh0XEEbXqPtH6pLBNtekePI8vfUOlhakqgXm+Avo5pVi+ixjUDb0muC55ol/I3EUnWJ/hsKHYloSkzrN0rPZDNnM6Ifc2eG3lQ+vT/ZzVXmynMKBkl49Pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <723292e9-5e2c-4899-ab91-80fc992e4597@epam.com>
Date: Sun, 3 May 2026 12:44:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/23] xen/arm: vIOMMU: add generic vIOMMU framework
To: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <c12f84b9306a2b74a555c710f21f5362120205ed.1774918270.git.milan_djokic@epam.com>
 <8cb4ca97-e605-4416-b532-a8df4816a0ee@xen.org>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <8cb4ca97-e605-4416-b532-a8df4816a0ee@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0242.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::15) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|PAVPR03MB9797:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d4c0a53-257f-4837-4e3c-08dea900f40f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	im4RpiXINgwUoteRHpgYpE2NDbmElYW8LzyVIioOIPDB3aWGpltGRjefb2Z/zJYD/XakwskwhufhakzOH9e0yCY2kC8umVixKVY9BICkrpG4cq4ohSLiQpk9fA8pKm6/6lV5fYlbelsWN96RzJYMDMmSK6VFYD9Gowp1uVyx2furTSSweNcYURw5ZZgrkWx5LPwBi/+C3xYWX6YoTQk5MGWYekpJwWyuVwvilz09i7zKncpB1PEji+LGeU08i41aP+vaLjjLE24GMX0lxb8Uz1RBskjobwSC0S/4KquC1ydTI0tFGT1hR11ISQxtpmckBnUgdVkQlwco1VKB6ioOCS3ndj7ZF0wN2UybFvS4+j8QJ/NoXT7hJBJ+H2YFwDbcf/R7eDnCu4O/ir2WMqkeIx9EqfzD0fY84MJJjHVd8X/U4enL6G+gBUDhpf5jx7csUJlk7AGUs06omTSN9IUD2RraCHlBDs/zmt61lU/a2nMm6wr2PSCD3dm9qKUj3p4VtgDPFOysJ6b70/de3TdIas+KMDztCzZfbohLvD1X9Kw7LD5UY06LE9oE3fIREiJ1SAgLue34bCRlRb+LF6ZFoeh38+sZ+cStKm73i1llCD7Vf8+oKA1vIMML2Px5dt4gbeTMTi3m+UKmUSk+hvwsxnflTvKki0EI8oft35Pkgra0oeK6rjM0kv8HDcxH6w+J
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEVMZXhodzMzSUNWWG4xNVY1VjdYUDRQV0NYSmx1c0RHUnY0RzdmK3gzeEd4?=
 =?utf-8?B?eDkybVBwYW1zN3NCTEsyQm9GQTZ1R01NUjF6NVUvaEJMWEQ0dld3bm4zc1NG?=
 =?utf-8?B?dXJOWi85VEpGcGYvNjZQZWtqUk82MWNHcFFBa28wSy9Zd1QzVUhsMytJZU1L?=
 =?utf-8?B?U1dKMnlBYk9nVzYwL3pqZnZENW5ZZmo5bHlxQjBFSFJhOW1OejBEUXp2TnBv?=
 =?utf-8?B?cldiUEt5Y3NPZnJqTU1qVEQ2cmc5UTlTZXkvZGNSZTQzQTcxRmx0dkQ0V0pj?=
 =?utf-8?B?RW1xUHF1T09PVkF4UHlqcnRaQVVkcUhObCtMRU50RVRWaTI2UklPNmVDSGlG?=
 =?utf-8?B?d09uR2Rha1hTYlh2K3FVOUpBcWhGaHJGWlFEVGM0MG1YTTFPQ0xadGt3bVM2?=
 =?utf-8?B?L3prYllHTG1TcVdDOVpNNHdHbmVQa0IrTW9mVUxVeThnS29aNHZkUXY3QWxa?=
 =?utf-8?B?U0luWmpEdGxNc3VudG5STEQvb3FmK1pRaUFrbGh3SG44Z2NSZGs1b054YmNG?=
 =?utf-8?B?bTU5bWhZRFpSSlIrQXBRV0l4RSs2WGlDRGh1dHNCa3NDSzN5TjJQUDhlRHEr?=
 =?utf-8?B?SXV6U1FvQWJYOWcxN1V2czFXdDUyVjJ6clRtNHErR0VRR1NhWEQ0bEgzVVZN?=
 =?utf-8?B?SEF4cXJBQk1qay93MUhRWE1mckdzZVlqRWdiOTJRNWk4Q3pDQWtZa3J3T3FI?=
 =?utf-8?B?emJwM1oyQ0MxMXhSdnJtZHBjT3YwWVRZVnNtRkhiS1ZzN2F3bkdxbVowdHQ1?=
 =?utf-8?B?RkNadURQZld5M1Zqa0JkNi8vNGFnK2Vpb0dTZUhZS2NTRHJtdXVkc1ZzRXFx?=
 =?utf-8?B?TDl2RXJZS2tacjFpRGpmR2dTT0tCY2JiZ0VtY0p3U0VlSXdFdm03WUsySkZP?=
 =?utf-8?B?YkZxU0ZsaGVGd1ZINXEzdFFjWTVwVUgwMDR5VWc4VDhUcmxDYVBPMnVhTHZY?=
 =?utf-8?B?RGxhTFZBY2x0YVRIcjBpRUxuUEY4N3hYTHVVU2hJOTlEQW5NNFZPQzNDYzZZ?=
 =?utf-8?B?cjlEWFNsUVpWcE5DUkRYM212bVJiQjU3cnhwWHRVRmNmNUpYeHptSzRMYkVZ?=
 =?utf-8?B?WkxQbmpHeFJZeWErSElMWC9IRU1oSHpPdlVtS1BDTk9CNjA4S0M5ZElVUGlr?=
 =?utf-8?B?SkFHZndWYVlhTmJYdGJPMFgvT0IyMXMxUjUxMlUweG9zd0lVSzNXRjJYeTJP?=
 =?utf-8?B?djA5Z1FIZ3U0MCtoNGhqcnlJM0hKRmtQNnVGbmFVdlhtUktFMy9WUlhPUWtD?=
 =?utf-8?B?MTQ0NHBRREE4RURKY2lzNHNOUnU3SUJHV0NycGJuNEJYTGhuNlI3ZHVzZ3M2?=
 =?utf-8?B?TDVVTGJnYkdmc1lxOENhcldvVXFmZS9BRjROWlYzWUh1UmxGUHhWQnJVWmlC?=
 =?utf-8?B?R05IUk9WUnFlSXUyeE4xeEdBRC9qN0JRaU5iM3Vnd3BIWDFVbDAycDNFMFFt?=
 =?utf-8?B?Qko3STZoTGNEU0dTOWw4N01paUdKQVJFa3F6VEdKc1FHS1YrY2VhRXAyOUFy?=
 =?utf-8?B?YktCR1lxTW1DRyswa3hCRkhZLzhBMTEwMnZiSGdaeWRBb3cya2JGUTkrUlpM?=
 =?utf-8?B?eWl2amI2TWJvUERBeXpBR1gzZmltaVNIOVhScXBMd0hzRnI0YnFSMEdxcTdz?=
 =?utf-8?B?T3B5MjdiL3JzOHJBRWVJUkN0RWcwSU1YbnJzLzJnZjRoT0RqeG5sUFV6RTBR?=
 =?utf-8?B?eVExZ1VsMEZuK2hEYm1teXEybDZPb010VWZHc0tHdVozOW5mekIvYWx3dUQ5?=
 =?utf-8?B?Tk1NeDRidXpJZk1Dd2ZsM25hSmJ1Q0FEUmkwWDRLeVExaTQwYWdETy9jMWpm?=
 =?utf-8?B?R2x1NHYvejhlNy9lTFJaOHJOdGtiTGkyc2FPWWZaOXZRb2tkWm5obTRkSXRm?=
 =?utf-8?B?NnlOcEZxc1RKWThSK25zbGZRVThya2l6cXZsWmQ3Y0FjVWI1aTNXNUNoTEpq?=
 =?utf-8?B?ZzhXVmxUK0VlNzBCVDRidlk0MFFvS0xEcVR0Sm5VNFBUWGMzN2hxamNQVW5v?=
 =?utf-8?B?Szh2NE9Lc1NRZVBROHlYU1Y4NU9nb1ZwL0ZFSHRDQlZHYnVaSFBnZmNXeFdh?=
 =?utf-8?B?WDRNUUl2aEpIbllIdUt5cHZla0p0TUpGeDVHK3JPWTZVUmROZk81ZEhPNVJV?=
 =?utf-8?B?eExSa2hKVVVlVWpUYkhpZlNuNkoyWEpWcjFvYlppMVpvQjUzRVlZcGhFSU1Z?=
 =?utf-8?B?SUdnd2kwT1lucTlKcXZ1M3RqUVArZTRIaEY0Tk1CSC9IaVNFNm1nelNVS0VP?=
 =?utf-8?B?L2dNZmJSRnhndUVMWWV6WWN2cVhIMFZZNDRndmFwR0lTVzNJZFZneXd4eEsr?=
 =?utf-8?B?ZGw3UGJ0YW90SGFBNHQrS2pORCtuSzhtUHoxeW5OQ3AzY0FzeG1aQT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4c0a53-257f-4837-4e3c-08dea900f40f
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2026 10:44:29.3760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vO6ovfMCc3B/9OHulBpC+lck9suCoeJcllU8MAq2o2FTmdvmNUfIo7rmqyHevIbr2U6Eym+kXtn3jUT+BZddhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9797
X-purgate-ID: tlsNG-c1860d/1777805071-C3370DB1-D35D668D/0/0
X-purgate-type: clean
X-purgate-size: 12167
X-Rspamd-Queue-Id: 196104B5266
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

Hi Julien,

On 4/14/26 08:15, Julien Grall wrote:
> Hi Milan,
> 
> On 31/03/2026 10:52, Milan Djokic wrote:
>> From: Rahul Singh <rahul.singh@arm.com>
>>
>> This patch adds basic framework for vIOMMU.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>> ---
>>    xen/arch/arm/dom0less-build.c        |  2 +
>>    xen/arch/arm/domain.c                | 33 +++++++++++++
>>    xen/arch/arm/domain_build.c          |  2 +
>>    xen/arch/arm/include/asm/viommu.h    | 70 ++++++++++++++++++++++++++++
>>    xen/drivers/passthrough/Kconfig      |  5 ++
>>    xen/drivers/passthrough/arm/Makefile |  1 +
>>    xen/drivers/passthrough/arm/viommu.c | 48 +++++++++++++++++++
>>    xen/include/public/arch-arm.h        |  5 ++
>>    xen/include/public/domctl.h          |  4 +-
>>    9 files changed, 168 insertions(+), 2 deletions(-)
>>    create mode 100644 xen/arch/arm/include/asm/viommu.h
>>    create mode 100644 xen/drivers/passthrough/arm/viommu.c
>>
>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>> index 4181c10538..067835e5d0 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -23,6 +23,7 @@
>>    #include <asm/arm64/sve.h>
>>    #include <asm/domain_build.h>
>>    #include <asm/firmware/sci.h>
>> +#include <asm/viommu.h>
>>    #include <asm/grant_table.h>
>>    #include <asm/setup.h>
>>    
>> @@ -317,6 +318,7 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
>>        uint32_t val;
>>    
>>        d_cfg->arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
>> +    d_cfg->arch.viommu_type = viommu_get_type();
>>        d_cfg->flags |= XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
>>    
>>        if ( domu_dt_sci_parse(node, d_cfg) )
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 94b9858ad2..241f87386b 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -28,6 +28,7 @@
>>    #include <asm/tee/tee.h>
>>    #include <asm/vfp.h>
>>    #include <asm/vgic.h>
>> +#include <asm/viommu.h>
>>    #include <asm/vtimer.h>
>>    
>>    #include "vpci.h"
>> @@ -550,6 +551,14 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>            return -EINVAL;
>>        }
>>    
>> +    /* Check config structure padding */
>> +    if ( config->arch.pad )
>> +    {
>> +        dprintk(XENLOG_INFO,
>> +            "Invalid input config, padding must be zero\n");
>> +        return -EINVAL;
>> +    }
>> +
>>        /* Check feature flags */
>>        if ( sve_vl_bits > 0 )
>>        {
>> @@ -626,6 +635,21 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>            return -EINVAL;
>>        }
>>    
>> +    if ( !(config->flags & XEN_DOMCTL_CDF_iommu) &&
>> +         config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>> +    {
>> +        dprintk(XENLOG_INFO,
>> +                "vIOMMU requested while iommu not enabled for domain\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>> +    {
>> +        dprintk(XENLOG_INFO,
>> +                "vIOMMU type requested not supported by the platform or Xen\n");
>> +        return -EINVAL;
>> +    }
>> +
>>        return sci_domain_sanitise_config(config);
>>    }
>>    
>> @@ -721,6 +745,9 @@ int arch_domain_create(struct domain *d,
>>        if ( (rc = sci_domain_init(d, config)) != 0 )
>>            goto fail;
>>    
>> +    if ( (rc = domain_viommu_init(d, config->arch.viommu_type)) != 0 )
>> +        goto fail;
>> +
>>        return 0;
>>    
>>    fail:
>> @@ -965,6 +992,7 @@ enum {
>>        PROG_pci = 1,
>>        PROG_sci,
>>        PROG_tee,
>> +    PROG_viommu,
> 
> I am not entirely sure about the position. Is the intention to
> relinquish the viommu state *after* the devices are detached? If so, it
> would be better to move this call just after 'PROG_pci' and add a
> comment indicating the dependency.
> 

Yes, viommu cleanup should be performed after the devices are released.
After the rebase, it ended up in the wrong place because new components 
were added in the meantime.
I will update this and add a note for dependecy.

>>        PROG_xen,
>>        PROG_page,
>>        PROG_mapping,
>> @@ -1021,6 +1049,11 @@ int domain_relinquish_resources(struct domain *d)
>>            if (ret )
>>                return ret;
>>    
>> +    PROGRESS(viommu):
>> +        ret = viommu_relinquish_resources(d);
>> +        if (ret )
>> +            return ret;
>> +
>>        PROGRESS(xen):
>>            ret = relinquish_memory(d, &d->xenpage_list);
>>            if ( ret )
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index e8795745dd..a51563ee3d 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -35,6 +35,7 @@
>>    #include <asm/arm64/sve.h>
>>    #include <asm/cpufeature.h>
>>    #include <asm/domain_build.h>
>> +#include <asm/viommu.h>
>>    #include <xen/event.h>
>>    
>>    #include <xen/irq.h>
>> @@ -1946,6 +1947,7 @@ void __init create_dom0(void)
>>        dom0_cfg.arch.nr_spis = vgic_def_nr_spis();
>>        dom0_cfg.arch.tee_type = tee_get_type();
>>        dom0_cfg.max_vcpus = dom0_max_vcpus();
>> +    dom0_cfg.arch.viommu_type = viommu_get_type();
>>    
>>        if ( iommu_enabled )
>>            dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
>> new file mode 100644
>> index 0000000000..4598f543b8
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/viommu.h
>> @@ -0,0 +1,70 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
>> +#ifndef __ARCH_ARM_VIOMMU_H__
>> +#define __ARCH_ARM_VIOMMU_H__
>> +
>> +#ifdef CONFIG_ARM_VIRTUAL_IOMMU
>> +
>> +#include <xen/lib.h>
>> +#include <xen/types.h>
>> +#include <public/xen.h>
>> +
>> +struct viommu_ops {
>> +    /*
>> +     * Called during domain construction if toolstack requests to enable
>> +     * vIOMMU support.
>> +     */
>> +    int (*domain_init)(struct domain *d);
>> +
>> +    /*
>> +     * Called during domain destruction to free resources used by vIOMMU.
>> +     */
>> +    int (*relinquish_resources)(struct domain *d);
>> +};
>> +
>> +struct viommu_desc {
>> +    /* vIOMMU domains init/free operations described above. */
>> +    const struct viommu_ops *ops;
>> +
>> +    /*
>> +     * ID of vIOMMU. Corresponds to xen_arch_domainconfig.viommu_type.
>> +     * Should be one of XEN_DOMCTL_CONFIG_VIOMMU_xxx
>> +     */
>> +    uint16_t viommu_type;
> 
> Below, you define viommu_type as 'uint8_t'. So shouldn't this also be
> 'uint8_t'?
> 

Should be uint8_t, will fix it.

>> +};
>> +
>> +int domain_viommu_init(struct domain *d, uint16_t viommu_type);
>> +int viommu_relinquish_resources(struct domain *d);
>> +uint16_t viommu_get_type(void);
>> +
>> +#else
>> +
>> +static inline uint8_t viommu_get_type(void)
>> +{
>> +    return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
>> +}
>> +
>> +static inline int domain_viommu_init(struct domain *d, uint16_t viommu_type)
>> +{
>> +    if ( likely(viommu_type == XEN_DOMCTL_CONFIG_VIOMMU_NONE) )
>> +        return 0;
>> +
>> +    return -ENODEV;
>> +}
>> +
>> +static inline int viommu_relinquish_resources(struct domain *d)
>> +{
>> +    return 0;
>> +}
>> +
>> +#endif /* CONFIG_ARM_VIRTUAL_IOMMU */
>> +
>> +#endif /* __ARCH_ARM_VIOMMU_H__ */
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
>> index b413c33a4c..3c174bc87b 100644
>> --- a/xen/drivers/passthrough/Kconfig
>> +++ b/xen/drivers/passthrough/Kconfig
>> @@ -35,6 +35,11 @@ config IPMMU_VMSA
>>    	  (H3 ES3.0, M3-W+, etc) or Gen4 SoCs which IPMMU hardware supports stage 2
>>    	  translation table format and is able to use CPU's P2M table as is.
>>    
>> +config ARM_VIRTUAL_IOMMU
>> +	bool "Virtual IOMMU Support (UNSUPPORTED)" if UNSUPPORTED
>> +	help
>> +	 Support virtual IOMMU infrastructure to implement vIOMMU.
>> +
>>    endif
>>    
>>    config AMD_IOMMU
>> diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthrough/arm/Makefile
>> index c5fb3b58a5..c3783188e3 100644
>> --- a/xen/drivers/passthrough/arm/Makefile
>> +++ b/xen/drivers/passthrough/arm/Makefile
>> @@ -2,3 +2,4 @@ obj-y += iommu.o iommu_helpers.o iommu_fwspec.o
>>    obj-$(CONFIG_ARM_SMMU) += smmu.o
>>    obj-$(CONFIG_IPMMU_VMSA) += ipmmu-vmsa.o
>>    obj-$(CONFIG_ARM_SMMU_V3) += smmu-v3.o
>> +obj-$(CONFIG_ARM_VIRTUAL_IOMMU) += viommu.o
>> diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough/arm/viommu.c
>> new file mode 100644
>> index 0000000000..7ab6061e34
>> --- /dev/null
>> +++ b/xen/drivers/passthrough/arm/viommu.c
>> @@ -0,0 +1,48 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
>> +
>> +#include <xen/errno.h>
>> +#include <xen/init.h>
>> +#include <xen/types.h>
>> +
>> +#include <asm/viommu.h>
>> +
>> +const struct viommu_desc __read_mostly *cur_viommu;
> 
> You don't seem to define 'cur_viommmu' in the header. So shouldn't this
> be 'static'? Also, AFAICT, 'cur_viommu' would be set only once at boot.
> So rather than using __read_mostly, you probably want to use
> '__ro_after_init'.
> 

I will update the 'cur_viommu' properties and add a set function for it.


>> +
>> +int domain_viommu_init(struct domain *d, uint16_t viommu_type)
>> +{
>> +    if ( viommu_type == XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>> +        return 0;
>> +
>> +    if ( !cur_viommu )
>> +        return -ENODEV;
>> +
>> +    if ( cur_viommu->viommu_type != viommu_type )
>> +        return -EINVAL;
>> +
>> +    return cur_viommu->ops->domain_init(d);
>> +}
>> +
>> +int viommu_relinquish_resources(struct domain *d)
>> +{
>> +    if ( !cur_viommu )
>> +        return 0;
>> +
>> +    return cur_viommu->ops->relinquish_resources(d);
>> +}
>> +
>> +uint16_t viommu_get_type(void)
>> +{
>> +    if ( !cur_viommu )
>> +        return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
>> +
>> +    return cur_viommu->viommu_type;
>> +}
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
>> index cd563cf706..d4953d40fd 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -330,6 +330,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>>    #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
>>    #define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
>>    
>> +#define XEN_DOMCTL_CONFIG_VIOMMU_NONE   0
>> +
>>    struct xen_arch_domainconfig {
>>        /* IN/OUT */
>>        uint8_t gic_version;
>> @@ -355,6 +357,9 @@ struct xen_arch_domainconfig {
>>        uint32_t clock_frequency;
>>        /* IN */
>>        uint8_t arm_sci_type;
>> +    /* IN */
>> +    uint8_t viommu_type;
>> +    uint16_t pad;
>>    };
>>    #endif /* __XEN__ || __XEN_TOOLS__ */
>>    
>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>> index 8f6708c0a7..23124547f3 100644
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -30,9 +30,9 @@
>>     * fields) don't require a change of the version.
>>     * Stable ops are NOT covered by XEN_DOMCTL_INTERFACE_VERSION!
>>     *
>> - * Last version bump: Xen 4.19
>> + * Last version bump: Xen 4.22
>>     */
>> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
>> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000018
>>    
>>    /*
>>     * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
> 
> Cheers,
> 

BR,
Milan


