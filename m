Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BAGNSuGg2niowMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 18:47:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4235EEB200
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 18:47:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221103.1529462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vngy1-0002XW-L9; Wed, 04 Feb 2026 17:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221103.1529462; Wed, 04 Feb 2026 17:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vngy1-0002Ug-IF; Wed, 04 Feb 2026 17:47:05 +0000
Received: by outflank-mailman (input) for mailman id 1221103;
 Wed, 04 Feb 2026 17:47:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f40U=AI=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vngy0-0002Ua-8M
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 17:47:04 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83075222-01f1-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 18:47:03 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB5678.namprd03.prod.outlook.com (2603:10b6:a03:2d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 17:47:00 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 17:46:59 +0000
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
X-Inumbo-ID: 83075222-01f1-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oF7DOZg0awaoEPXqrkAsVZLHpeYYAAdmqxUZmTq3gSjGX06SMWj7sO9h0IZZaXvJTPIKYVfGJ1iJ15Ydp6Nr8nmiZ1zcyyo9BSvpqlDgIRiK0s7STxWF1Ku3rcfDKD7t3dNzetSgm/7nfWqBu/BqmdacgOsP2oSjB7Af8rwhjFtApHxW2oaEC4zOhAL2T5fbb1+HgHqzRseVdO6x5kFvd5B70SUO4QBGxdItYjv+90wCxE7NDvKmUY6AcyxS7GxbnSkRuj1s+SjfHF9LfNvu69Sxim8yf7ERYZBo3pHd5niOtPrEYtPQu4Jc33/v/s7cmHtxwlQu4+Xs49BBMWmOtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zE62sc98JZNuIcLnSEs6JQyYdoRslGOmJbJEFXh/Ys=;
 b=oZe2IW26keKx2GeN6GPtPw5jmIpyIPmjSwxB/81n+WXZsqm6yvzD3aB9j2hA33lxUBQ9OP/uQfF6o7SWPArc8LBNb1sYShsjetfN++nsRnu7x1R5BLfD3HZDXS299KYSGBXzf/jOIbZxf8FAl4bO04VLleFJd0L4F6XxAjVNVOTpIfOabJal42aEvA4Y6+AfagkHa/2YWmwTDw+ZT2NdIsaNkmEgfOrByLCkQUgIyRTaPV2mBzJHBCQvlt1QetDW4xC7/TGHmSW1IAAv0pSzS9uiBakfbMlZurreAK6hMd6rH7Ijw6hfRRTd2xKitPHOqF8SJOPREEVGDVAd84SCOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zE62sc98JZNuIcLnSEs6JQyYdoRslGOmJbJEFXh/Ys=;
 b=JKHyu3G/0J6os6akyfIuJilU0Pv1ZASHRTJ84YaMsH16idHUiqegWfMrxIWK2KMw58XOxnPZpqzxi/fOD4HRVzUCKWBrNXL3R73gieeL2NtArKsTrRjXcGHNw/UBK/1BT9u/70jjlTG+15vsLD4b3hnoAvzJo7S7JIqCtsZukL0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Feb 2026 18:46:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] x86/domain: adjust limitation on shared_info
 allocation below 4G
Message-ID: <aYOGEOxyeSYlIwNo@Mac.lan>
References: <20260204122553.75711-1-roger.pau@citrix.com>
 <cc8f0f84-fd5e-401c-ad71-ab5a10f21fa8@citrix.com>
 <aYNfVDgSgKCYd929@Mac.lan>
 <764e6a9f-8def-4f6e-8311-ef91b6c3886e@citrix.com>
 <a7ba4cfd-d452-48f4-99c8-a7c283facfd2@suse.com>
 <aYN54n8b1gYXYiTq@Mac.lan>
 <3c3d3309-956e-463d-ba03-2e557e79fbab@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c3d3309-956e-463d-ba03-2e557e79fbab@citrix.com>
X-ClientProxiedBy: MA3P292CA0002.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB5678:EE_
X-MS-Office365-Filtering-Correlation-Id: 14300ba7-4a7b-4661-296c-08de6415659a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blBIRG9uTEUyS3lRb3JUcDFlRVpTYVJ1MmRGdExBVVdmM1E3U2I2bGRQS1FS?=
 =?utf-8?B?SXZyMXhrWHpxOHh3RmxIeFRwTnVqaExUd253cUNRZlROSzV0M1JIQmhZWTAv?=
 =?utf-8?B?Y2pmRXdGbDduN0ZINmhrME1nc0taSVRCckZnRU5abzA5b1ppVEJIMlFuNmhT?=
 =?utf-8?B?WUZZcjRVcGVDSkl2QXZTUU4vQWw2bkUra2g1bFIrWlBZMmIxUWJWaUIwbUt2?=
 =?utf-8?B?TWJTaW9mdytnSnpiSVRsRDlYbk9CSUY4MjFUNlNZM21reHFvS1dPRTBTcEZQ?=
 =?utf-8?B?a1hpTnBlKzBTUDV1NzZwdUpVTXpNY2M1aDlKVkltOGZJeXVnMkhIYmxOeCtj?=
 =?utf-8?B?ZFROdUxsQ28xNVB0c0NOWTJlRHNHMDZYbnVreXl6c0lqUVdjOSt1bEErdjI4?=
 =?utf-8?B?dEtweGRBTUZvYmJNUnFHV1Z4aVBQNGRZdER0VmcyaEhCOWw5ZHBBNE1OQzVU?=
 =?utf-8?B?RDlWbG11em5qa0ozMW9QTzMzMHBYVS9ZMitmejhQaCtvTG5GRjc0cXRleHoz?=
 =?utf-8?B?YU40SGU2bU9VazRZSlR6RmxxZFBDQ3pNOTBidlhHc01hVWVnR01wZ1h5Vm5y?=
 =?utf-8?B?Sk9kVXJjMnJMaHVNMGJ0dmdNUWdyV0ZhK2xZcExsMjd4SzZOY0NWQVFkRmVN?=
 =?utf-8?B?d2FjaE1PdHB4d0hiNDg3TDJmZ1RuRWhnMDA5ei9WcFNpNVRYeTBCTHErMGtu?=
 =?utf-8?B?U21rTVZPc1h3Z0oxak9ndlAvc1ZEc284SWFjdzJoS09rWlhTeEl0ZDdDaXgr?=
 =?utf-8?B?UVZQZFNuLzJnUlV4MFByTlU2NFdUNU9HMGpvblF0QVJoLzVQalAvTjQ4TitG?=
 =?utf-8?B?eWZKNlNpQkwvZGxJb2JqNHZCOS9ScUFuTy9WUUkvMU5kRWNhWjFCSGtRYVVh?=
 =?utf-8?B?TFlWR1lyb1R3OC9ZcC9NamoxTUlWbU93THl5NWcyRHhNQkRVb3JJOW5ZR0hz?=
 =?utf-8?B?WFBaT2tVcXFJQ1BxRTJJRjd4bS9ZSXg0czBzazkzQ0VDNFJJZjcxS29lbjJo?=
 =?utf-8?B?emx3czJ4Yi9yWHI4SUJuTHZoM1RRZ0l1eERRNWEwb0paY3FjaDBpcXdHd2xw?=
 =?utf-8?B?Vkl0N1pITmZmRjF5QzlsUjRUNUdkOG1uL1NmZHk0dm1RV0R5ZkQvTTJJd21W?=
 =?utf-8?B?dUloZXBnNjVEWXBlbG5nSFovcWFaYVM4Umw4N0tvMStmK0VoU1g5aDVOM0dn?=
 =?utf-8?B?SWYwU1FucVAyNlJMV1o5Q2lzTUxuLzR2bDZ0eCsxQ09RQ25BazgvUXE0aWYv?=
 =?utf-8?B?VHRjM1RLdDMxZmtWd0FJUE8wcWZsUUpURzN6NmhUcTR1M3cvby9VOFZ0Vytn?=
 =?utf-8?B?RzBPVFhLMG9iekdkNFJwT0xadlh0UTJ5TWlpMmZUZ2p4OWxkVXM3cEpEQUdr?=
 =?utf-8?B?TU81dFRabzRNbUVlTUYyRWV1WWpsSDZoYWVVTmJCdnl2M0wzQ0hMZ3RoR1hR?=
 =?utf-8?B?SE5QUmlNeTI4MC94MlRNbEVWMENzajArMGQvaUhrV1ZHdjRGQWZwTncrWVdO?=
 =?utf-8?B?VWJIS1ZQT3pZdVE0Zy8vUitzTnh6VzdqKytiWlNPcUNnVlZWVVFjbkEwbDdn?=
 =?utf-8?B?NXdBcHJGK1pvTkxRcjhqWGZ0VGZpR3VpL1FIQW1WdUVZK0JzTzNhbUVSL3FI?=
 =?utf-8?B?bFdrWFkzNlhpN1ViejAyT0R5RjBQMTBNZ2VMNWZrNkZpOVZvMTBuU3dHbHpt?=
 =?utf-8?B?RnNhTm5TM1dDUitZZGZqOXRnM1NpWGNHdEZuL3pvdy9TU1I2SzJoNFlkcUZm?=
 =?utf-8?B?R3VvSHpuYW4vWE5QS1pTd0RiWC96Zy9EOHl2S0IzaGw3Vmt1bDZvSGhxa0No?=
 =?utf-8?B?Z3lvZFppY0t5enhNQjhteE1iaHd4dUd1Zm1NTGlIV3pnRmhHbjNlTE0wQXBa?=
 =?utf-8?B?UTlyc3JHUGRtQzZWY3Q2b2VyMlphTTJvUHZoRXBqQ2VMd0svSmVKSnJEcFFw?=
 =?utf-8?B?bWhpM1I0M0FFSE5XNEwyNEsraXBPN1llOENmMTZmQmQxN3JDazdzUndrbVU1?=
 =?utf-8?B?V1N2TS94L0RodGhEcG1FZk1aM0IvaG9QK2ZKMGxPSmM1QlQ3bTFlU1JiUFJI?=
 =?utf-8?B?WW1kZ1c1ZVQ5QytOdFBxU3E0TGsxSUo4ODROdXFzajN4VG93YXlZVUUrak1I?=
 =?utf-8?Q?2NRA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzAxK3ZjZlJsVXNDdUl0Y3JUbVhnTFJ1NGtUT2E0UnZmbkx5VEpDUUxKR0oy?=
 =?utf-8?B?Z1BwUWJ1NFpJL2ZyQ3gvQkYrR2tjK0JKMXRqaGNJOWUyVThuUzMrdHVoamFY?=
 =?utf-8?B?cURncnJkcG5GdmREa0c3OXFkVFdIWjJ1NEJIaXNDNlppMTF4alZZdlRscDc2?=
 =?utf-8?B?cVJzYU15VUN5dmc3Z2pMNVFVU3BncC9YNWpudk5XSllodlMxWlREaHJZb09F?=
 =?utf-8?B?NWw4ZENHTmNPSXN1cTh0SUNVN012a1VuUmc4QXUyNW43ek1DTmJyenIyeG1j?=
 =?utf-8?B?OWdLNU1wUnVTLzBxUmZqRVV0NG9wRWRIYk1DalhsR3BtM1dQMWlDNXRzaUVo?=
 =?utf-8?B?Tm9aaTFVZ0NGNHovNGd4OHgrajBvVkVIYVpvTzk2WTJxQ25YdCtycWhWSyti?=
 =?utf-8?B?ZHR3MUt5Yld1TGd3SzBlYUt0Q05La0R0ZGIwU1kycDBRUXpzdlpFNDQ5RXRD?=
 =?utf-8?B?WlZqakk1ZXkwZDM0QVBYSFNjb2RTV1FQNVN0Zm00ZkRlVDdsaUJoQU1UeEZL?=
 =?utf-8?B?a1ViN0dqTXErNTNHL0pkNHVZM0FsN0JLUDMvaTZaT1JnbFAvWWpra2tUOTRv?=
 =?utf-8?B?L3pwUmVQdGZ1NkJKNmZuOXdpWnB4WE1NZGFqcUprSDg4UXZVRFhYNWxBQ3pw?=
 =?utf-8?B?M2tmQlArVlJORlYzQWNROHIvMTRsdFRVaDRyYjRoaUs1VGV2K1I4UWRpMEYz?=
 =?utf-8?B?NHhiS3VwRWVUb0RpWWhGTHpnTmhFT1lJbGtseVlzK0czSjl1OElid3ZuSXlG?=
 =?utf-8?B?QldjTHVkcVJqVGx3aVNvVU4velNLKzV4alFzb2o4MEdMQThGclM0UDQ5SDFU?=
 =?utf-8?B?c1U4TzBSME1qY0d1S0QvamhOYytRcy82L0pROU5TQm5VcVhDUFFHWWU3QlVu?=
 =?utf-8?B?SFVYczlGU0hMMXgyQnpnYXhUWkNuSXdKNkVZUUZJVG85eUIwTzI0S0FiTFpY?=
 =?utf-8?B?SERXV3QxRnhCVWF0L1hJcjF0RnhZQ3pvU3ArNFA0cm9md2dUbkJHODl3RHBD?=
 =?utf-8?B?STNSWWhITVE4b09QL2lmVW5NWU1mbFo0cVZlZzNpYTAzL1h0ZDRxR1BPYXR0?=
 =?utf-8?B?YjZMTUQ3YTdsa3puOXlSWEVTaFE4dWJZdnd2SjltREhYTjM3YXJhUmtHY2FG?=
 =?utf-8?B?cHloRitSMTRwNWF5UHd1NVZ3ajZjVjY0L1UzenNhbFBVYVlCb2lpOUhnd1pQ?=
 =?utf-8?B?eU5WZnNTb0ZvRkE5WHVXRlNTWG9JTGNMT3JpQnE5TVRiR01adWVOcGJpMG42?=
 =?utf-8?B?QnI5YkUrbVQ3M1Uvb0JSQmRVTzYyaUJxN3JsekhzTDQ2K01TSEswMkY2N01Z?=
 =?utf-8?B?aUZ6TkN2L2E4bnVDbU1oWnFxZnZnTmhkR2doSENFck1VM2YrM05Fc01XOXc2?=
 =?utf-8?B?Q2NnZElDVDUzTHV1YzdGRmN1OE9YcFVaYzJvTVhpWFZuclNpMGVQQ2FvNmJp?=
 =?utf-8?B?ZXY3RG9zbjQrNmlGV1BhTzJQdEQrTXBkMWlpN1lXWUsyYVBmNFlVSnFTdEE2?=
 =?utf-8?B?N3I3dHluWnZFcjFPdmZaQ1FNMzhsUE9MQ3BaUFBoS1VvNmJZYlh3RktzUXRp?=
 =?utf-8?B?cnMwK0tqaTIzVk1OOWlNZDVxaldCUXM3UE5KQVNGVkE0OGdUNjk3L1JjZG9l?=
 =?utf-8?B?WUpsZStYYzlLZnZ1WUdHdDBFZnpZYjg5aFdTS3ByQzkybnRRK1h4cUF4VDlj?=
 =?utf-8?B?QWd4TG5zSXFpN1NOY3VTVXdFN2haMjZPRUdMVUh5N0w4WTlRVVlqRGR2dS9B?=
 =?utf-8?B?TDZwejRRWU5LbEh0WjRyUWxaaGpJWVc1amVKRmpWNmRmbnRxcFV4S3BoaDJ2?=
 =?utf-8?B?S0JpOStIV1ZqZW5ZM0F5UnRMZE5tM21KQXAzN1dMdzIrVWlUTnliS3d0OHdo?=
 =?utf-8?B?cXVDc21GcFNXaWR6Y1hBTGVmYk1QK2dLb2lqRUVHYitmbnFvOGJadzl5SGdB?=
 =?utf-8?B?N2dRcjQwY0lSS3haWWR4THVyL0hvTTJmemhmWnlvT09LNDhLRCtzczVvc0lD?=
 =?utf-8?B?T25KU0dEdTlnZzRjMXhjWDJGSVczTi9sU3ZucC9rZTQ0OUErUDJXTFNHNThN?=
 =?utf-8?B?dlM2VStEdFU5ZDlXYndXdG1tT1I3Y00xNWVodkl4WVdmT0dBWEFERGg3U3VC?=
 =?utf-8?B?emtnazlYSjZKZ3YwQXdGVDlJdWgwTmVjYUxGdk5UbDR4L0VKQ25WeE5QRVFl?=
 =?utf-8?B?Q0FKOVlWQjV0TVEyMlhsNSt2UGdZWlBMQnBQMmpRbzRjTXN3eVl1YnhpV3o5?=
 =?utf-8?B?VTYwTmNHT1h4aVRlbnZLRlNQeXVxUEczalN1NlFUUzBVNUJZdHZBV0hpTk9a?=
 =?utf-8?B?K2gxNlRhMlorWTJ3d0NIT3JvZHVKaXZyak1mMDhyL1VxZjBDNWI5UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14300ba7-4a7b-4661-296c-08de6415659a
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 17:46:59.6904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hcRxxLJj9JQCH7q8gFAehTGk5f4KJurPh23bIUCIz99LHvuPDuY6oW1BnTb8zA127KR3rURsj1ccWUxisdMYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5678
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4235EEB200
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 05:23:21PM +0000, Andrew Cooper wrote:
> On 04/02/2026 4:54 pm, Roger Pau Monné wrote:
> > On Wed, Feb 04, 2026 at 04:32:25PM +0100, Jan Beulich wrote:
> >> On 04.02.2026 16:12, Andrew Cooper wrote:
> >>> On 04/02/2026 3:01 pm, Roger Pau Monné wrote:
> >>>>>> +        share_xen_page_with_guest(virt_to_page(d->shared_info), d, SHARE_rw);
> >>>>>> +        /* Ensure all references to the old shared_info page are dropped. */
> >>>>>> +        for_each_vcpu( d, v )
> >>>>>> +            vcpu_info_reset(v);
> >>>>> switch_compat() can only occur on a domain with no memory.  How can we
> >>>>> have outstanding references?
> >>>> As Jan pointed out, it's not references, but stashed pointers to the
> >>>> previous shared_info page.  I've used the wrong wording here.
> >>> Yes, I saw that thread, but my question still stands.
> >>>
> >>> How can there be any this early in the domain's lifecycle?
> >> Can't (aren't) vCPU-s added ahead of adding memory?
> > At least on x86 when using xl/libxl the call to
> > XEN_DOMCTL_set_address_size happens after the call to
> > XEN_DOMCTL_max_vcpus, and the later calls vcpu_create() which sets the
> > pointer into the shared_info page for legacy (< 32) vCPUs.
> 
> Geez, that disaster of an interface still has spike traps we're falling
> foul of.
> 
> Please extend the comment to note the first 32 vcpu compatibility case.
> 
> But, combined with the format change (clear vs copy page), doesn't it
> mean there's an existing bug here?
> 
> Even without moving the shared_info page, aren't the cached pointers
> made wrong by switch_compat() ?

No, they are not wrong because the vcpu_info array is at the start of
shared_info, and it has the same size (64bytes) on both 32 and 64bits.
Hence the offsets into the different vcpu_info array elements are the
same regardless of bitness.

> This is one area where we've got no XTF testing at all, and I probably
> ought to see about fixing that.

Yeah, it's not great.

Thanks, Roger.

