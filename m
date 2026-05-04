Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAt5GHDI+GlQ0gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 18:25:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AE94C1529
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 18:25:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300111.1574677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJw6K-000375-RQ; Mon, 04 May 2026 16:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300111.1574677; Mon, 04 May 2026 16:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJw6K-00034W-OR; Mon, 04 May 2026 16:24:56 +0000
Received: by outflank-mailman (input) for mailman id 1300111;
 Mon, 04 May 2026 16:24:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wJw6J-00034Q-7L
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 16:24:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJw6I-00Gqov-Fy
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 18:24:54 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69f8c84f-e002-0a2a0a5209dd-0a2a4502ab22-14
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 18:24:54 +0200
Received: from [40.107.209.63]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69f8c854-af86-0a2a45020019-286bd13f2e23-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 18:24:54 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5690.namprd03.prod.outlook.com (2603:10b6:806:110::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 16:24:50 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 16:24:50 +0000
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
 b=BEY6pk+Ogd7jOuRPatvJSwnlkJU9pyXQmTKy15xMPwMoqo37ZItbNm19fFGPmuTfqRyqfp5YdRn9K2MQBYpRHKL6p58oOK7q8TuaGtMeHO+WCzhqWtwWKOwikQuRA+N0M4fUc3QkrcFuINwRZ3r3cz2w1M498TyPvmvpoXtDuwooZgXS+3BHAEquQGfo00dQOOvZm4PU1ClXaN6vzjP4VHNtt1pL4ucQluTh3fEPr/onxyOE5ZmPR69lartNaeEOVXs57jo+8vCkcrozPvRYwhZFDoCYoV9rC3isC7eKIFSpUr0nanT7dckiNvUpOJssHRYiCnsW68wthz/ZQc/DGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSuJ8mTX7X0XYzNa7VFBmyxs+az8RPbafPdBCOBSDNc=;
 b=EftqP0RzwrsycLjm5UJnk4/8f8rFMyaN8M4Q4R2jPskd0rJq6sKTGgyB/aCjQIA8ujZtU5aNdgMWx0GBVA22D61fgnQCoVnyoqIZD7Ws5cZQ5M7b9jj1zgQUNyI9O4nEu5FDZA6x8zK01ijbw5h7ucF0hsCVfTlOnO+1S8XJyQZlkH1/wxAJgG5dFw3jUzIWyOVaBRcU2J7co7YpSB5urUvbtdVzPjW0oj7xnHhpTFj/M0pyq4K2a3plLZRgu7+KHu9Eip5HAJlfNcyL6ujXhVPHKTF8yJbbTsqh+OvF21gwWPbXu4++JwImezyHlm0YJSpMslwUsmpwHiTxw2RyRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSuJ8mTX7X0XYzNa7VFBmyxs+az8RPbafPdBCOBSDNc=;
 b=S3M6paIj8Kivj7Oz+5O4QtYj2BwhGeFdZr3rOYCLVtMzCti+//xbtiOZqkWTmC4IxrjKONfSSp9XfYgC+UoEgJ6vZCv6mmLwYdxiACUWlofgarR2mQeYd99KzUOVjf8A75+eOZXoucuxbyUyg4p+6eIYuObEmFIErneiHuAtaZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e1166c38-114f-4d37-bbd9-b4e1a534aaa5@citrix.com>
Date: Mon, 4 May 2026 17:24:47 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] x86/svm: Always sync guest CR2 on VMExit
To: Jan Beulich <jbeulich@suse.com>
References: <20260501213826.1291860-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2605011443580.512397@ubuntu-linux-20-04-desktop>
 <981a0dad-dcbb-42c8-a840-6f228eb89be1@citrix.com>
 <53c4fb20-8cb9-440a-b37a-d829ec940e1b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <53c4fb20-8cb9-440a-b37a-d829ec940e1b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0362.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5690:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c63716-895a-446c-0ac2-08dea9f9aa86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	c4zOpc/bkcnwHnPBK20wa8nsjtftP2sWobtxj8lQUTOXT5Qg8kW/aTW+XD1eP4ErhI/sqnCPvhCMJpVfP2d7EMNoxC0U0ZL8DFbNJymJ9DTgrECLhHfwlPgltcjSWCs3msq6w/FsxW2qDSPKVm2udDGb1a7ncWlsvq1drUsVmV6IqBiMtGUEQpNf9DMFh5Qh413a+djKdAapyok/VTb36OpxWn9iLo5QjOSG67P2xfjFnrHn8ARXJMP5XYlr95zRnc84Gj8hKOvpGWIhiu8rau1BQLXefl6yZCRRn2ZEE401NRZdrNb9jKqeqhQ+HdD9t/NeCIPXu0YHICwN2DCdntwPSqkDmJJbdax+iYg07FW0gi8fQoviuVY8bTZ5MQ+Agvebxtn1dHXS08e/zAXzBsZA9skIz4ddWcTqjR+JXmY5J1Q+Y6B/eNaIIjGIzprKUToV2+i5ynwaX/qoT9fle8X8Lxhf7e9FGRliLIR1JOeKWuoMo54yHOiMKeJix4j4rGYX02fgD2PIz0e44cKuN+BscQ0bQH+qIEdDrZ/OYdPpUDGpOr5gIw7wKmte25wOOB9Z93YeK0wE1n7x6TLbk6qfcFuRXzYszxHYRKg01YIkIlAO13fzoYk0LIxS/7w+/c+QGCqKnhUVpuHf6SfS8GJQlU5OZyXodiOqnFwwQ1Ek7800CnTyfG24LQI2yVEA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXhRNy9zeXJVWU12bCtwUy9iVHRTVXN2RlNYN1ZvUU94SFFaNHgrdllJN09X?=
 =?utf-8?B?SUxLVUNaclVXdy91SXJVajdma3JiNkNwaldPVGZJSjBuaGNSZnJ4Ym5ZNVIz?=
 =?utf-8?B?VTVLRHIzeFM1aDNWL0ZEdkFnWHhOanNoK282L1VtWnRBaFJoNzVIZStaUzhD?=
 =?utf-8?B?dVZ1MHJBL0p4aDAzNlJwdkFidDNpNC9iL0ZSVWJ2SUtLYnFtOGdhWHRoT0FV?=
 =?utf-8?B?SG9kb3hOeEJKRkwydWlkZFQ1SmU5YWZBK2xNR281WmR0TmE4Tit1YkJMbG9I?=
 =?utf-8?B?cU5tOFg0ekRIN2ZwdG1XbVVFL2ZpRUYyaENUVTVjeGFsR1U2YkFQaUJzMm1N?=
 =?utf-8?B?a0orOExDUi9CendLdkhySzVMb2tpVjJoWEJlbFlHWTlpQ2lQdkt4dHA4alpJ?=
 =?utf-8?B?eiszUFNtTkcwMzZlUGp0S3ViVExaSkxJYmI1eE1LZ2phMjVDNHJFYkc2YTNh?=
 =?utf-8?B?M3grc2xzcGtETXp6eW93QVNma0lWVndZRWFiVTF5b1BkSFRXQTlRYVRpU1dw?=
 =?utf-8?B?U05Ld3Izei9CSjN2N3c1T0M5VE0xN2QwL1FqYmNIaTRWM1pFSm8rdDBYWGJK?=
 =?utf-8?B?TEEvNGxlWVlubkdkYW12KzBuYm9Qc0NZQndLSVBuMzRFWnRzNjIzekhueGtR?=
 =?utf-8?B?N0pkem8zTklqb3o4Vm5KZmtmL3NGYjQ1RVd2ZTdQMUtmUVhNNXlvWEdoNnA5?=
 =?utf-8?B?bVA0SS9MRDQwWVl0RHNuZ1U3VHRuQk5kZS8zRnFkVHRmQWNNN3lVQTl6ejFp?=
 =?utf-8?B?bWdNQTljN1ZkK0lyUG5ycmg0S25WYUhHNkVXY1RWWEV0RlNManJGclRLTmRJ?=
 =?utf-8?B?Z3ZmWSs5aDZCWUpldGNWTFIrd0NxY2dzMjFUZ0hIUzZHSlB4MXJBUXBJL0Jn?=
 =?utf-8?B?QlkwMmsxMk9mRXZvVXZUZjV5TERKZHAvYS9tK1hYaWlBN0EzbjNLRjdDZGZm?=
 =?utf-8?B?aUo0SW9rUlFjQnoyWTZaY1BuMmRndHphc2hFN3Ixb2dIME90UkJ0QUtiUE5Z?=
 =?utf-8?B?dWtIcGgrNG4wN0cwRDc2b2h2TFdCRjVKendxUzU5VldIMmF5MmZtbXRZRU1N?=
 =?utf-8?B?S3RJRFpSV0VabHdMR0lrQlVSdnB3MlhnVnd0V0ZiNHM0VldaaWJhcldCaWNW?=
 =?utf-8?B?aVpCZkJTdUF5ME1IV25Jbkk0bXZzWXNGVFg4NkZOOGsxaEhrUTIwS2tBRWFa?=
 =?utf-8?B?ZUtZWEs1Wnk2emJpUXkxZzZzWnlCZ1F5QS84Rk4zWjk2MG5OLzd6OHJ1aU9F?=
 =?utf-8?B?K1dLalpIMVRWY0NjRzYraVJ2Qm14bjZtK210a3o5OXl4eEVHRlM1ckdBUS9a?=
 =?utf-8?B?NVNzSktZWnhvM1lPZXFvVDdNQ084bVN2U1l2T2tOSVNjQ3hNVkVkdGZNL2Jl?=
 =?utf-8?B?NUdZVTlIekdRdnZYUzNFYUd6WVlmRkJBaXFuQzlldFRudHQ4M2F0aVBKOHp1?=
 =?utf-8?B?RkpPenVJQnk1SUxJTlV0YUFESnQxS0JGSkxkUkRaczhHRTBielkwektRYU1Z?=
 =?utf-8?B?VUFmVGxHaE4rRnFsMDBVQTBteWN4dnpnSXg5OFF3TzJ6c3dJYVFIRW9QOXpZ?=
 =?utf-8?B?UmFyR2MrOU16VkVaTGg5dHVGTnJvSWc0RnRkSS9lQjlNaS93Qm1SOE1qejNh?=
 =?utf-8?B?K2R5NnlLeGlzRGZmcXFmaFg5QXJPOEhrVHNKUVhuTm1oTXJER0pUMFlqT0tz?=
 =?utf-8?B?dWxMc2hXYTZGemVKdmx0Sk4zTnhKZVM5M20yU1JIQVVJYjFJTzR6aDc5WG9W?=
 =?utf-8?B?Y1ExOTlBbzN2emRIUG9SSCtxeGdFZ0hkcDg0OFZHTVdkSVBSd0JBMUlUK2Rp?=
 =?utf-8?B?aXFQWURYRUFGdUtGVmdUV2xmZVFtWnduejJpTk02VkNJa3hBM3dhZFBEKytY?=
 =?utf-8?B?MklLa1VLWVlvQjdlcTV5QVdGRzIyTDF6ZElzTG95UDcxaldRQ2RLYm8rRFlW?=
 =?utf-8?B?WWtvSGhBQzN6U2RWSzMvSElacUE1TjgyOUtOVHlZUFBhU2xPRXlhcVJuWnRt?=
 =?utf-8?B?UXpJeUV1dkF0R21OVXBNRk9MRXNoMjdaRVRWeE5EVUlaL0N0NlZZYlBLeFZ3?=
 =?utf-8?B?NXQ1dS9RdXpIRUJSb2pLYjIxSDJDM1ErYzdXMjVqd3ZuYk9qSkNPMEFISjJT?=
 =?utf-8?B?bStveGd1WUdqZkw1ZGo2Rnp2VEJSWllQaVh4SXE1a2V6emJvc0tlZU1rR3lL?=
 =?utf-8?B?bnFoOE9IaW1waWxDc00zN0V6R2pPR0c0cllIRGlVenZ2MlRBM1R1aXBaankr?=
 =?utf-8?B?VGJBVGpmY0JvaWVyWlM5SnB6aktqWFZMSUZBUElQOUJhTEFaY0hRMFlSL2pO?=
 =?utf-8?B?dDVCTnpNRytpaVpraE9OUFZHMTFpVHIrMjdCci9MUFEvd3NTaUFuRlhDeFly?=
 =?utf-8?Q?HlxMBiCUHa9lnsvQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c63716-895a-446c-0ac2-08dea9f9aa86
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 16:24:50.7919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJbZUPJK110Ndzp8VvMKN8Gw2w0Skm30WNYd3Z3ZFlXLL4qMESGkSggnRodXcSfETVKB0s6KTeBwwmbWSHFaclDrN+fmjmycrnUEBrdtvZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5690
X-purgate-ID: tlsNG-720697/1777911894-89AC2161-AB56BB12/0/0
X-purgate-type: clean
X-purgate-size: 2279
X-Rspamd-Queue-Id: A7AE94C1529
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:sstabellini@kernel.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
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

On 04/05/2026 6:14 am, Jan Beulich wrote:
> On 02.05.2026 00:21, Andrew Cooper wrote:
>> On 01/05/2026 10:44 pm, Stefano Stabellini wrote:
>>> On Fri, 1 May 2026, Andrew Cooper wrote:
>>>> Under SVM, there are two copies of guest CR2.  One is v->arch.hvm.guest_cr[2]
>>>> and one is in the VMCB.
>>>>
>>>> Xen doesn't intercept CR2 accesses, so this mostly goes unnoticed; hardware
>>>> loads and saves the guest CR2 across VMRUN/VMExit.
>>>>
>>>> For HAP guests (where #PF is not intercepted, and therefore we don't typically
>>>> inject #PF either), this causes the guest CR2 value to be lost on migrate.  As
>>>> migration is cooperative and not done from the #PF handler, this also goes
>>>> unoticed by guests.
>>>>
>>>> It also means that an emulated MOV-from-CR2 reads a stale value.
>>>>
>>>> Reported-by: Stefano Stabellini <sstabellini@kernel.org>
>>>> Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.")
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
>> Thanks, sadly I made the mistake of extending my XTF PoC for this.
>>
>> There are also bugs on the emulated MOV-to-CR2 side, and they're far
>> harder to untangle.
> Any slightly closer details as to what?

hvmemul_write_cr() updates guest_cr[2] but doesn't sync it into the
VMCB.  This doesn't show up on Intel because CR2 is switched explicitly
in RAX across VMEntry/exit.

But, it's not the only problem path.

svm_vmexit_do_cr_access() is the fasthpath exit for CR intercepts when
decode assists are available.  hvm_mov_to_cr() and hvm_mov_from_cr() are
asymmetric in their handling of CR2.  mov_from will read from
guest_cr[2] but mov_to will domain crash.

However, case 2 ought to be unreachable in hvm_mov_from_cr() because of
how we program the intercepts, yet the QEMU bug which caused this to get
noticed will trigger an ASSERT() if I were to put one in.

So, do I fix up both to account for the fact we know QEMU is buggy with
intercepts?

>
>> This patch probably wants to go in in this form, accepting that there
>> are issues still to be addressed on the other side.
> I agree:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

