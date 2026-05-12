Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOywGJBGA2ri2QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:26:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C02DC523997
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:26:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306958.1578686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMozb-0007tt-NR; Tue, 12 May 2026 15:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306958.1578686; Tue, 12 May 2026 15:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMozb-0007rz-Kg; Tue, 12 May 2026 15:25:55 +0000
Received: by outflank-mailman (input) for mailman id 1306958;
 Tue, 12 May 2026 15:25:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wMozZ-0007rp-TL
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:25:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMozZ-007D5o-84
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:25:53 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a03467c-2eae-0a2a0a5409dd-0a2a450bbec6-4
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:25:53 +0200
Received: from [52.101.57.48]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a03467f-212f-0a2a450b0019-346539308f59-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:25:52 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH8PR03MB8179.namprd03.prod.outlook.com (2603:10b6:610:2c0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 15:25:50 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 15:25:50 +0000
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
 b=wVNLRUCg8I6+zc8thppUaTW3RZ2EPvfKRxm370co67QDOlCj4DA1Kk53NvotVtwGXamu4kZ5bdtvxWsUDyenwbdwbQ8+fWYVsEI/O3RVyy1mPsrczN8uII91D/TCZ90QclHhqhPEBolVzrtuhIME+9GiQ0y+TU9Adui1kXC7Daqj7jDVQvW7B2GlFltE/R7iTLxUneiH6DiPN01RwmCSC/FJmtIyRJQ0Qqut2eIytHliOP3HevNaQcNw4zu0S+EZ8rwKuFzWSE+B3yy9aph3kQfGnAW/YoO1A7WQhSklWw6adiuOk0uycMp+Vzuhu5MY13j/joV2fVvEksFFM69++A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fz3aGodIEVNcRkKWa8sKERiaJbQOd2lKVnRzjD9AO8U=;
 b=rp+A6966RKvvFpPlrihG9Q9o0E4PrqjiaFvW1XhiV1TCMkx8a7O3aDkYSbzmA9sz5iVZyqsNEiRw08y3d5gPG8adccgSQ3nLJxuk5bC1B8OMHMV9i253FQxc41neT3cLVlt4FC1g/7Kb3rE98MTqy2l++Uitwabj7nW7Y2aEl6jg3CRcRptd0fp+0oykh5UhIgDeeBtX+naL0BN4okCEpAYoTTzHHWU/QIZy9UpQ5MC95BcYytY235V4FkUhb6Cd5GB8KmHRoi5xEoaKxBGp6VUAamnpxLUNz7TcejKPBJnvqmSj5mN++Z9PYsW5iknwkLaKL4AduQDE+iLeSYLVyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fz3aGodIEVNcRkKWa8sKERiaJbQOd2lKVnRzjD9AO8U=;
 b=VlehBsEk3oVwEdImVHz0qUxcmEVqCH1Mt61kMdtKwpooGoYrnGaPtoSgl0KYcdHDEziDRkL9Gae11RDWjuWFi95A+VmAT+LxUOxnxXRyrNDDLIll3N/sWk7JZQIdnqAZDw6JfmrwjrHB9/Skdp22vy56R9kf214IYXFwQjylIug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <940ba092-9a5c-4f97-a37a-05d0cc6b220a@citrix.com>
Date: Tue, 12 May 2026 16:25:46 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Rafal Wojtczuk <rafal.wojtczuk@7bulls.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22(?) v2] gnttab: simplify (really: drop)
 gnttab_set_frame_gfn()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6e3dbb4f-5849-4525-8f8b-a2818c39da2d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6e3dbb4f-5849-4525-8f8b-a2818c39da2d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0283.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH8PR03MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b6c8316-7fe9-496f-4b9c-08deb03abf68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|56012099003|18002099003|22082099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info:
	TDSxDE1d5dsvFe3Vyw4STRqhIJkuznXut8wEyc8rCEG4CXe9F8FEEbHBg8Pg/zogi9YTZLwsw1t4TJp+3Lh9L5yHA7kyQ52JU1NZPqDr9pJgWioIDIGhR7/wCYcnq/a3duQZEUdmGNObd2L+zoNeXDS/n07+LXArcYUYZBPiPRVpnKcC+ybYpM1BFy4KCNNFFf4ctGHon3zHSzMesfXrROwpiS9RnnEyf1hk7n+5LD8xuM/jyTuwZlhcpeyCyTZIWiJtGd0edU5iijHQDR7y1CK8ok6hZkJbU01PHAETyL3Xo99Rzvx4xixSI4Ohx6Y5j/WrevREtzrH973DWX+u5lnZ9/t+/jC0Exc4GFEDumw/OPMq3djzg4EL8hakbNOwGMSyxU5uYpjSeFBQQEuD8leisNUKXGXJGHMX68LKtFpNMmlXzXjV9qVlMKi317cUCRjWO9gN/ZG7KPSmWI0b579YahmlRfajWJvF5V/KAnYpLPJMcruxHwn8Sejyt/O4gEKwW7yWM9vs11zL9BupaPPX5dlaOhUEtU+WvYAusmRSRVV2Jy5RCquPbxN0OqEatmfdDiddpyWpIC6Ayk/zdf/ZpbONPqeP6zxR9YHe46F3Nq0WpClRsevloij+iVAkURAOPpticaBDxfsSfNTn9bZl+V5JatQP3hXa49rZuIrW2LR5xSC68KXzbgna0Oap
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(56012099003)(18002099003)(22082099003)(11063799003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmZqRitNYkxFZ0MyRzErWnZYQ2FaWVNRWUh5L0NaVm5MVkRTcnlmS3A4LzBN?=
 =?utf-8?B?S2tDREp1MFRDYVZmaDl0U0NuSWJxZmtOcWltM2V2eE8yWDdMS2hsa3FRc1Jo?=
 =?utf-8?B?TGFwaEdzcHdpcVVYcDBqVXdBOURRWktYN1hXMHJydmwrQWZsS2VidER6Um9X?=
 =?utf-8?B?UVhGbC9waXovTktlRGFkOWRvVkx6MllFQkRSWi9UTVA4OHRMNU5iSG5VRmVw?=
 =?utf-8?B?eHkrRWxGenNxQ0IvY1JXYjdEMlV0SmVRMEZnMXV4NmZuRDFzTE5CNmhlK2Rm?=
 =?utf-8?B?am5VTUxBYkt3ZE9wODdqOWVsTDFad3YxVm1hcHQ0a2lqWFdrNmUzVGRJa1o1?=
 =?utf-8?B?a2JFVEgrR2NqU09SanZxUndTTTVwODJveW9UVkMvZ2JyRUkzN0NrZ01hM1hX?=
 =?utf-8?B?L0YxeVNoU1FaZEg2aVdUNlZ0SDlmR0R1QXNXYUF6N3MzSVg4bFkyQ0N2NnRh?=
 =?utf-8?B?UWdmUUFXM1VSZzZRam8zaHhqWkh3SFZCQ253cnhVYUVWZm9JS1AwSk52UWg2?=
 =?utf-8?B?dENicEJkbnY0Ris5b2lRMTNGSjZsdnpOMzMwaFpxZjAvRnVKdmdaTlBDNnoy?=
 =?utf-8?B?NjFpSVdDUUppT1JjRjdiTW44TkY3QVFHSW9SUmVHalRpZjFpenRQNEdkUUw5?=
 =?utf-8?B?aUczcUpWK0NBUXJYa29xN3gyNmZ0cXNabE9BdGowRGU5cFVBWVA5cERMZFU4?=
 =?utf-8?B?YVFFbFM0cm5vSk9qQloyWW1tMFJyaVRxdU81dDFYdzFXdG5PbjhoTFNnemxm?=
 =?utf-8?B?S0p0MnQ2RkdUSE5WVW5KQUdhSkMyNXZzRHJDeHRCWENrcXV3R053OHZaTjVr?=
 =?utf-8?B?N2lsb2tKTytHY3dMb0pUdXFQQ3pJaTYzSnJRYXBDVlBERkpEWndZazdXM0RR?=
 =?utf-8?B?QzhKSnNDN2NKOEphUE9qd2lXSm40RGlyZFZxYVBVeGtFWTViaDkwYzFqaUl0?=
 =?utf-8?B?K1ZZcExiY1ljMXU4eUNpQ05oemdkbnJwWkZvUzB2RFJTZCtvRCt3TkRMMnJj?=
 =?utf-8?B?MGF2aGozWGdGU1hzTVFrbGNZOFozWDhqVGJCeThZNTVJUGlucXM0cyt4UzRC?=
 =?utf-8?B?dy9JcE53RWdER2s5aGczNjRTeGJxT1lNVEY2Q2xHdHF3Y0haelpxSGNhQmF5?=
 =?utf-8?B?RkZ0V3RUS252ckF0SmNTekNuSkpxbW5vdmo5VnZVOXFMWXJBTDVSa0cxOVNk?=
 =?utf-8?B?bnZmeHFVRC83KzhyKzF3L3FZUVhPYmh0OWExNXhNRVNNY3FtNVkwQUdpRnBv?=
 =?utf-8?B?dERXcGtFbkFzYTB6ZXpNcXduWFhhdEtYTlJCdWtOTEpqNGhwKzcvWmt2SU1L?=
 =?utf-8?B?QUxUT3lMenBoeEljMEwxZVBsQUlXYTJ6bFArYk9iVUtoRFc2V0RDTWFDMG4x?=
 =?utf-8?B?eS9WVHVabkduN0NMU3JiNUkzc2IweXpheEg1a25mNjZRb2pCNllnWWxWV3Fz?=
 =?utf-8?B?aC96TmwyRVZJTzArYnRTVGpoa29VVmNTYTV6dGR1ZnBKNUFtd1BtRkdtTXRk?=
 =?utf-8?B?QjhaaGFTdXIzUzRoV3ljTGlzOUlRR2lYZmIwc2dwQmFIeFpXMng5M2dIUElD?=
 =?utf-8?B?RGo2bmF0aDU2dTNQREVoNkVIN0pzdThQZ0Qxa0wyYUtZT0xBK05kWktPaGE3?=
 =?utf-8?B?Z0l2Mi9xOHU4dmF1Y3g2d3J6NFRVaW1JQ2ZXZHFlWldGODkvYnJPcWFONUZR?=
 =?utf-8?B?dDQxVGdOV01xYmVEZWUzdWtwSzVXTndycWVCMzhoQTFvSXZhYzgyU3NPWk5i?=
 =?utf-8?B?elkwOVpGUHdzTm9oQ3dSQ1NwWFAzV1lHbndjeHJ0b3IzbEg2Yjh2NmRkV1By?=
 =?utf-8?B?aVZIeG5WN0dNZGNaUmh6UUJZazdhb05rMzBJZnNrampiR1JKY2VFUDhHOU14?=
 =?utf-8?B?aDllaS91NmZVNHBXRjdtMUUvb1Z2YzRDcVZSSjU1dTNtZGdSMmF5OTdmb1Av?=
 =?utf-8?B?TEFTU05VamNoUzhHR0FjMGhlbk5ySkpMVHZaem05K3REUHBpNDN6MW5ZTlhJ?=
 =?utf-8?B?alJ1empTUFVEREZab1BaVGdxdmFtQWI1Z1M0Y05TcHpReXVacEl6dlh6NUNv?=
 =?utf-8?B?UGhlTElEZEhEQlBOdk1uWXZTak1LdGFUN1RqRkRmVzlwWldxaGFUZXlpWWx4?=
 =?utf-8?B?KzNmeWlOSEk1eGpFemlHOXh6b2UxRUlXYzVobmlXSVNZanBvQXVVSm5GRlBF?=
 =?utf-8?B?MFY5c0tUODhXcG04VUc4SEUycllEVS9DQ3hac3psMlBwVjdhZUxjanV4eC8v?=
 =?utf-8?B?enl0UU5CWnZ6VlJmLzEyU0x5MjloR05sNFJIS0hmUWFjUC9JSFlOSUZndmNT?=
 =?utf-8?B?b3ZsTXM4WWNGdXMwL20xYTVuVUx0R0duSE4zbGUrMFA2SEwzN3VFcU15MlNh?=
 =?utf-8?Q?VzG6vnUdz8X4VfNY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6c8316-7fe9-496f-4b9c-08deb03abf68
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 15:25:50.0057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OKaPI39d1JRmq0YgKY6L0RIfLccCxMI8+NVt8Yr3TI20RFbrYhyav/akJeU/GKPKbYjE3pP6lhl3CdBmfQACqf05X5NXsN5CLaN12Jrix8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8179
X-purgate-ID: tlsNG-42698a/1778599553-12D77F3B-E70B6397/0/0
X-purgate-type: clean
X-purgate-size: 791
X-Rspamd-Queue-Id: C02DC523997
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,epam.com,arm.com,amd.com,vates.tech,7bulls.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:rafal.wojtczuk@7bulls.com,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:email,citrix.com:mid,citrix.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Action: no action

On 12/05/2026 3:46 pm, Jan Beulich wrote:
> It's not really doing anything for valid GFNs, which renders its one use
> site pretty pointless. The other isn't so much about setting anything, but
> rather about clearing.
>
> The main point here, however, is about Rafal spotting the double
> fetching of the GFN (first in gnttab_unpopulate_status_frames(), then
> again in gnttab_set_frame_gfn()). Re-purpose the macro parameter to pass
> in the already fetched GFN, while dropping the no longer used parameters.
>
> As the result is a mere wrapper around guest_physmap_remove_page(), drop
> the hook altogether.
>
> Suggested-by: Rafal Wojtczuk <rafal.wojtczuk@7bulls.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

