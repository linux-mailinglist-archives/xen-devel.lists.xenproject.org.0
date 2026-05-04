Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E33NqLM+Gma0wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 18:43:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AFB4C18D2
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 18:43:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300119.1574686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJwNM-000655-8B; Mon, 04 May 2026 16:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300119.1574686; Mon, 04 May 2026 16:42:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJwNM-00062T-4U; Mon, 04 May 2026 16:42:32 +0000
Received: by outflank-mailman (input) for mailman id 1300119;
 Mon, 04 May 2026 16:42:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wJwNK-00062N-9Z
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 16:42:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJwNJ-0023XA-4y
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 18:42:29 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69f8cc61-2eae-0a2a0a5409dd-0a2a4508c992-24
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 18:42:29 +0200
Received: from [40.107.200.65]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69f8cc73-63b5-0a2a45080019-286bc841a6da-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 18:42:28 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5797.namprd03.prod.outlook.com (2603:10b6:510:30::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 16:42:25 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 16:42:25 +0000
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
 b=mWCKeEfQmUSHcYtr2SN1djiSgQI+Vct7Hi8XfqaChJdP8OvjWq5FZNF7gASqWcl3xvpLw/SMBAhSdlqndm6vdUych7eOs5E4c+tm64cGsoF9vRNFNuGe0pAkjIBrIn9j40YY/Y85eSrDUCQJ6viIe7MLDKLL8zdp0pOQRGbMPIbsqEgnu2xXSDsKtzqp9ljkLCcT4hBbbvOnopSln1HvilvaHElzzFjEItuhrihvwrzXDyJy/ltL5Okdha1X6AgdHeODdXozqu2IlTPCpqZD8+mR3NrzTIhCi8JQrXlx1TLB8QY4fdyvDkkZzjimxbAG6Rq4TK/SCCKcO72gDuq1vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WuQocakr2qTmXhVi+giYnmPFsuHTelL70lvLF6h/CI=;
 b=wPniXDFb+Jv9dJXfvK3F5fIsGxGs6S/mb8FK55Ao45A7X8I4HNdKVzkFLwpDOHzSC+GxQv6gLahHV8sSZVf9LaLn6ckrbSvqhGlHkq7kienkg+hFoshMQUOuLWAH27vf8T6iUBTx36ft6giOR7rp7a6FVJL8TBXOsrqD7xVTY4DGqZnyrY8+2sP/T1jxq37XOy85xEpLNiXa++AA2PBc3JvXODGGm8IsN/kwsuAeLj6Y5TjCIUXdBdjtLVMp6yyaO80CJHdx847ripYIPvec6UgNC5wsH8LK/Ywm/LNtApKDNAdT4sPeDmcfwJnJVLdPqj9sLqLSSDZJ1WnuUg/zDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WuQocakr2qTmXhVi+giYnmPFsuHTelL70lvLF6h/CI=;
 b=lKnX6WWcRDkSi2QnhIrUYp9xgXma5MgYhisdoSkOlokHLBis2T+pR3safWgM/AlPfz6BpryPqF8V+MX8zoIKTLuqR7wnuPnH7eoQ0so+IKwVd1w9jDK3pUewLd5nrkfNNR++G1LZRENXXkvPbgX62WjVYPvKgEJs/RqphkOxfpc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b94777e1-4f4e-4468-8320-ed622cde0bf1@citrix.com>
Date: Mon, 4 May 2026 17:42:21 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC] Skip boot memory scrub on platforms with full-memory
 encryption
To: "Samuel.Montgomery61" <Samuel.Montgomery61@protonmail.com>,
 Jan Beulich <jbeulich@suse.com>
References: <xJXmemuuJ0kqnGWQ9PWwfFn8_KZVhYSbsAyHFGvDeiqpxUK1Q-ar7Lab7ttRPx-tcEHduS26pU9BkIifbhznT1Qc06vyHfovl1-IXC0cWUU=@protonmail.com>
 <8c619af2-0dbd-468f-aa17-c1224d315304@suse.com>
 <v8BgcMuI474dKhLADWT2nMnQYi_m5b1mw7vAZIbRv2ffDY0bh2h_d9Qst_Q-4HUT3DOyYk8WHVpyih_2wlIgvVkbYoLsHY5_jYUPgQnkC1g=@protonmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <v8BgcMuI474dKhLADWT2nMnQYi_m5b1mw7vAZIbRv2ffDY0bh2h_d9Qst_Q-4HUT3DOyYk8WHVpyih_2wlIgvVkbYoLsHY5_jYUPgQnkC1g=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0290.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:370::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: 465aac89-5678-45ef-8429-08dea9fc1f2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	wfV2jqHPvWGPlqcq+J/i8RB/ZqrAh6+JBfQruJSrEDCbvHse2+1uvqiVQ+UxGbTvb8DudD6k9hrFCe52I8Kikjbr9WVahebb2b3MbxmIroMrLm+mruCzx1AMMjusl7lgi+Qmlb/ILoNZVJsj9syAiPkjAu9vOtEz8wYg7eKrB3uBf0IEOlDon76xOa7yKLaB6HBoe8jJxAniK7Wv5niZWHkcIEcj0U7GrvYb0oFiVcHIKAaPnvwYnbU+T5ogh4PtH334kVZjbn/FxgsfGtNIfB+D0XIbRH1TiRl37YkSAJ1rs2EjBKgao/qhd/Sexg67m9r3mUBYliFBxKEIzAG0tt9/uT1um4WteYj2jU44lA4AZi5pvlHm0n5WPBGVYKYix2V0Bu1+ozJGKYfCknxGeLRsViaprblb/DLirXaWouOI3oa2PJWcBjOZ3f2YM8eDyPE4+AMqbPvJ2AkW4/kBv3/OWIHFScxv80l/daORJeyzWg8+FgMR3rbfSZ+VHWEilhRZC1fhNGfduLz+LWJVm8Ek2Q4yxGu+71rsic02jYGMvW38JTx05spzQCwA2LVP2fMmrNy43zD+Tn9JWP6du4NG9j7iMhuubU/p8EJ6u5dKD1vNAEpShsw7hGv4NoDCwc7bXf78JgNHZnUAa/Xd1Yh9y7SgNDk/EqnYEZ1g0bnUyUzXOyL5rPJMvDm7tZpi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ym9UL0NWK0g0eUNKMzVQaS9mVStHeXJoWktPTDQzM3A3bVdLREJyZkhKK29E?=
 =?utf-8?B?elpnZTNUMFk5VWpFOUxYRnFtRnREcG9yUzJaUDlhTlFZME01QlpWREJQbllm?=
 =?utf-8?B?R1dwRlIvYVMxTDZpV1BuTnBacENZRHk1NGlaemFIV1p1RS94SEpOSHlJbDhB?=
 =?utf-8?B?QVBUdWg5T3kwNURjR0ZQYm04Nk45dzNrbGhrSnJnWEZEaGxtRVFqenBQZTFW?=
 =?utf-8?B?c0J6UEQ2b1g5OWtBS2NQQi93VkZQUVJjZUd6bGdrOW5yaFFITndsNmVKbDBD?=
 =?utf-8?B?ZG1aS0h1c3JmckozUDh4MlpVU3lCdVRQUi9xVG9pNWgzcUJqZnZhR2JZNksz?=
 =?utf-8?B?a3BFclNmT0RQL3QxRE5FbjBzNU00NWovMWpJdUhVMjRwTnQzWVpCUDByRnJ4?=
 =?utf-8?B?S1VwVjcyMFBVOEx2VExNVGR5NnkwcGxZRjJWdERIR0ZSV0JVWTMzOTJZekMy?=
 =?utf-8?B?SWRKQU94bGJ6NW1QYWRxVEd0SGNSa0pzZlZUYkdpWCt0U1FYWE9uQy84eUhi?=
 =?utf-8?B?L2RVVnBaekNEL21ic3pIRVh0OVhUTDhnYUhFVTFYQ0NURGxsQklPSXdtbE1i?=
 =?utf-8?B?RmlhUktwNTAvdEIyYnhtVlRkM2N2TnRXemU3MmZsMnQ1YjN2V05wM3hrWFFu?=
 =?utf-8?B?d2dnalg3MUtzN1QxR01PbUVVcHBGNCt4U0dudXluS1UzZ3k1NFE5ZzBjS2Vt?=
 =?utf-8?B?dW12eVEzQmQreTBzS2Q5UkhOTVRKL2NUUW02UjVvUWxxRVNYVk40WCtGUmo3?=
 =?utf-8?B?SE9DZTd0dGpnRGovR25BN2M3eFhkYVZhZ0lkc29IZ0NXTmZYVkJqMUJNRVdw?=
 =?utf-8?B?WHVKdEpPRkR3SThzWTdOQy9PWEJDZVVOUUE4Qmx6NHAxQk02bDh0cWZrTWxn?=
 =?utf-8?B?NURSakh4MUhqU1FnVjd0QzIyeC96S0o2TkovNU0yQmJNaVQyVnZiZFFoRjhB?=
 =?utf-8?B?TEpES1pDSEJIckdvbSt1NjJhbnpIcngvNllPZzQ4cGI1c2ExU05iajQ1V1dq?=
 =?utf-8?B?VURsb1Y2WWh2cUhuNnV0Yi8rTmdUVHdUOXV5V3QxNnRRUGtEN3FzZHRSQTBp?=
 =?utf-8?B?ZWFGVk5UVkM5dkQ1YU9rbm9JM0NPb0RTenRUbllaOHU0cmhiMnZWOGRzTFZE?=
 =?utf-8?B?elY4dzc0ZGsxdTlhTEUzTjN1TDdzSDdDRDBac0pjbndZT3h4OTFiN2RJUjNI?=
 =?utf-8?B?R29RRlc1Uldob016dkNSeVA5WlR4QnJJTFZTbW9xZDdTQlVXL0NaekFpc1hD?=
 =?utf-8?B?ZzJIUE5YZXBFRUJ2bzlsdmM5b2tqL3hnaklqcUZVbWFKdlJiMDM1dDEzcVZm?=
 =?utf-8?B?Y3Nra0lnZ2k3N2FUOWhFL3c1RVROZ0JWcHFST3BPZG94dVlBdlpWeXNKbHd2?=
 =?utf-8?B?RThyNDRpeGd2TEhoWXZYcVBXWnhLUHJvWVMzNDd1b242U2lCSWRDRTRFWTgy?=
 =?utf-8?B?cUJYUHI2L3FPb2VnNjgyYVhQYVFsQ0hJK1ZhRmcxRDNNQlRmSCt1RXM2cEpW?=
 =?utf-8?B?aVhXRXJzTlYwN3Z1cWMvVFlGL2RSTGt0YndYQWZaWXdsSERNUWgyLytJQ3A2?=
 =?utf-8?B?cnlOTEpVaDJtSGVWZ25PWkxod0p0QkpIS3ZXMVRIY3lybW13Y2ZsVUIyNVB1?=
 =?utf-8?B?YUdLbUJCRmpVV0d1RDNvUmRyTU9OUTF0Tk9MR1lHVG1Tb2VoeXNSK0x0YkVz?=
 =?utf-8?B?YVNFa3RRanJObnJvR2pnRDF4TFJCODlCU3U4aENTOUJOYlFtbHhUTGFEV2tu?=
 =?utf-8?B?OGZHUW0zTm1MVnN2TU1MeG9LQkRjU0VWWk1aWS9mT1dGSUt1Qk5zeks0REZ2?=
 =?utf-8?B?Y2JDQzV2Rm5YQzY0N0ZpSWdiN0wrTUdTRDUxQURxbWZGbzRFVDdSNUtQaXdG?=
 =?utf-8?B?NHZqNDdLci91VE5oVlZGaHpYY240eGFwOE5Qc0RsZmZweGt2ZFhJZnBIUEg5?=
 =?utf-8?B?bXlGcUtrdnp0NkI0VWJ4N0RnTTMvTmo5TmRQaXR6ZS9mRWNqbERFVXI3bTJJ?=
 =?utf-8?B?NzJVcTBNOVRoWmw0OGdFUFF4dWZYSWNhTnBNS2dyUlJIMTZFSmMyZFBpRjQ4?=
 =?utf-8?B?WEZPV2NtdFlRaHBrdDN3MGVUV2IreU5mWndXS0psdERib3J1NkVDMkxMN2p0?=
 =?utf-8?B?Nlh4NmppNzZkdFlGYTAyNnF6OExuV1J1dWU3b2JrNU9QdkhzbEhTR2Y2QnVZ?=
 =?utf-8?B?ZDJxN2YvaTk2d2p0N20yQ3JqeFJoais1Z2hLYUJUeVQydU15aU9LK0tzcHlk?=
 =?utf-8?B?OU9OcDZZMGJZT00rejVuWUF2VktpV1NqQUM2RjNiSTQ2MlBvWVhvTk8yUmo0?=
 =?utf-8?B?VDhZeG1qTVFacm9za2NIT01oNnNRTkhwSkZVbUxoclVXbDYvbG9XR1c2LzU2?=
 =?utf-8?Q?43hD7x3XnYpwMODg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 465aac89-5678-45ef-8429-08dea9fc1f2c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 16:42:25.4808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G4/wZWWtwtSNAwm2W8s+q9Ku9a7MA0JOvA1+pQRNVaZu6UulaUOyJ80i/ERoV5sGOPZp/zcMHS9DSWiRB72Mm+RxRvWgQ+QFmDIoObAOMQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5797
X-purgate-ID: tlsNG-c1860d/1777912949-C1B6CDB1-5107D739/0/0
X-purgate-type: clean
X-purgate-size: 2796
X-Rspamd-Queue-Id: 22AFB4C18D2
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
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:Samuel.Montgomery61@protonmail.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 04/05/2026 5:18 pm, Samuel.Montgomery61 wrote:
> On 04.05.2026 XX:XX, Jan Beulich wrote:
>> As you point out, there are issues with default-disabling. We already
>> have the "bootscrub=" command line option. Is there a reason this can't
>> be used here as well? I.e. is there a strong reason to put in (perhaps
>> significant) effort to identify and cover all the corner cases
>> associated with default-disabling?
>  
> A skilled admin could certainly use bootscrub=off today. But I come at
> this from the Qubes OS project, where most users expect the system to
> work out of the box. Your average Qubes user won't know how or when to
> pass a Xen command line option. Having Xen detect encryption and do the
> right thing automatically would substantially benefit the project.
>  
> I also forgot to mention in my previous email that there's a broader
> opportunity with multi-key encryption (SEV, TME-MK). In this case, Xen
> could skip runtime scrubbing as well, since a domain's pages become
> unreadable the moment its key is destroyed. That's a separate feature,
> but I think it makes the case for Xen understanding and acting on the
> encryption capabilities of the platform rather than leaving it to users
> to set the right combination of options.
>  
> I believe the edge cases actually support the case for automatic
> configuration, since any user manually disabling the scrub would need
> to reason about kexec without a full hardware reset, suspend/resume
> restoring the previous key, and firmware writing to memory before
> encryption is activated, at very least. Auto-detection could handle
> these transparently rather than leaving them to the user.

What exists in Xen right now is a mess.

Scrubbing is ill-defined.  One part of it says "make sure after a crash
we don't have old guest data around in memory", and encryption is
specifically irrelevant for this case; the ephemeral key doesn't change
on warm reset.

Something relevant to QubeOS is that for DRTM (Anti Evil Maid), it is
required (by the TXT spec at least) that Xen scrub memory between
receiving a shutdown request and actioning it.  Failure to do so causes
firmware to zero everything on the way back up.  Fixing this is an open
TODO.

Another aspect is to populate Xen's free memory pool with ready-to-go
memory.  Here we have a weird split, because when scrubbing in Xen's
idle loop as introduced, the boot time scrub was not disabled.  Except
that doing this in the idle loop during boot is bad because it
interferes with microcode loading during AP boot, which is why it's
delayed until the machine is mostly up.

There probably is room to tweak a little, but "RAM being encrypted" has
no baring on the other safety justifications.

~Andrew

