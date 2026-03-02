Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JaBDw6xpWkiEgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:47:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5034E1DC20B
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:47:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244416.1543863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx5UK-00009b-Cz; Mon, 02 Mar 2026 15:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244416.1543863; Mon, 02 Mar 2026 15:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx5UK-00007U-9W; Mon, 02 Mar 2026 15:47:16 +0000
Received: by outflank-mailman (input) for mailman id 1244416;
 Mon, 02 Mar 2026 15:47:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OlTG=BC=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vx5UI-000072-KU
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 15:47:14 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1423503b-164f-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 16:47:13 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5817.namprd03.prod.outlook.com (2603:10b6:806:11d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 15:47:08 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 15:47:08 +0000
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
X-Inumbo-ID: 1423503b-164f-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nf38qlXtLyPOEiEubE01tKmOKd0kIKb9Zv8DRjQ6qzVwbs9/dMAIfM5LzH6ypn2t///yRCR+0fcc1rk448WbM6T9piRe1VFLXnMSovqiUHke1fVbGrVKS/XvJCnvJnnVkRQrS3SY7CuL2hsBGr1WgtZzMfTJhsOeiud6P2HkS8bfkNod2WW/FTPIL3sZnpGBlD00L6hYHmczY0JFPkFEWrCt1nPiLW0HtRtpyV5K4Rn36ZjYcuXzP3FRhXttiWi225IYnfFoCCWkQO1d/Q+z64Q3LEo4QmhD4x55DJa4ZLP8oU38rgSxHgkUTn/C5oDicF/LKycBn9ZSYz/8FDm6MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0y+S1Kp3BTitawanS0oApxEXRRZN8x8ryHCgv2OtqCM=;
 b=pR3seyYgfYPkrTtj0xaTP6KeGNhTIKGW83PDnjbV5H7FjFY/LkxjdgtIuHyafAMKPk41fhUkeq02ExbrwYpFj8QrasI0GW8eXTWqpeQH4G4Ihm86t7TuCSvL3QAANHtlUrokgBra7oIJIyMUCKMnbLHJE9Vj1/h8du4k8Kf4IxMt0o9cPAPUNVmaDRgJqrvHSzKD1NbBjAiXDzWm8tOAv6BBlY19nS5Kq5wjN+chxD4Lb0arsx17pA+NIhN5wY2L/vOjGYne9LjkboeXtF2hflrc+ffCkzU3IMszUOlS7OKqYgdYQZrAJfD7dXCDmMaCQiRblCZTx/nSmSfB3M0srg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0y+S1Kp3BTitawanS0oApxEXRRZN8x8ryHCgv2OtqCM=;
 b=PwHvx90EBzzlAbcnFQ2jwejxtkceZw9p6Jn7u7kccL0qcxPzQEicsXQK5C9axBWSEBvgTJ9JGGcTWac8QNapftqye8ATA6clAs4CP9NK9YZ8t5HzPev5frz8CHNog09wTm1i1lM6m3rmTWC2hn5QzvH59WWWgy2OFufYcnRZ1ss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2df919aa-5eac-44d7-a707-4a658b78d1af@citrix.com>
Date: Mon, 2 Mar 2026 15:47:04 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 06/14] x86/traps: Don't configure Supervisor Shadow
 Stack tokens in FRED mode
To: Jan Beulich <jbeulich@suse.com>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
 <20260227231636.3955109-7-andrew.cooper3@citrix.com>
 <f3e84e41-438f-4a28-a2e6-863f818e948b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <f3e84e41-438f-4a28-a2e6-863f818e948b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 019f0179-7437-4303-91fe-08de7872f5d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	KVNE6wzj9kePr4xlARLKst+owzVWjrxICFHHZvwIAr34E7OA6eJBQZmpqeqIgvB5HlECkkzHJYug0KsaFN1b8Z3zKoJRtk1W8C18yaMmX41CW9TvCiFLmEaUTpOi2pm5ACRSY+nyY+e+nA+QhDU3Z5TG+Lq2IhJbsWIw5MCznw7YuAvjjIJ1mUm7YWqwTVB1n23Y04cTLcH3zUTPBTSwjfnApPpy0p7cY7OFn2h96HduJg30BwaECy1U9g/p2hxu2DwYDN5oI53FBCLsD2iwN0f0Ced7ivbsFWdu7QekPmJ3hGdaH19l6W/7v/43chnd6lGoZgLSD3Op6cxrIW+uvTdoNUljaAT/I6AH6G+xnpX83msOPQLu4YIUklI/UHnUYhtV6ulJVfrZGtc/xGjCT43WmvuLz+6/ujMUS6gatnQdDhnPJQgkzCJ2Mrar7YkzzCiSluso5vaAcySahlphXEzFz3+zq1P04r797s8u6SwJ4cgTMKcEmLjp1jKEGFF6FNfRU013FntPhc00klhqIkm+0ptTKnSBj4Upc4Q1Xu5riUsYHdhTgIud2282LgB3h7yctW/uJbbaOPSrRsNaQYq/1xeXQWlDo5+R+xnJTGx06roJr14gptRSpm7eiUDoAE+4ijz/DGXpeCs0DDRTjRCxyxyRvOi1WAV4DGyOtCpnCBpjNyjCGN+jxakavA1VFse7AmoHxvb+iBC9THCb6HgfJEtvYmQulJUG7MFX+Dg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzM4QkpVbU5XRWxnUUI1ZWdkSGR5bDlYWkp0ckcxNG1pNndXUVJldnpFeG9y?=
 =?utf-8?B?Z3lsQnRaVDNkMVBERVdLOExueURRTUJwcHpuUS94Z0JKMFZsOEFVenVJMlFU?=
 =?utf-8?B?WEE4b2tpcmpJMFNyS05QMWxKNGxMeHE1V1lPY0g5QnpiODhFNktKM1F1VUd3?=
 =?utf-8?B?L1dyMUdSalZuaXZUWGFod1pUbzNaeDZvVUtRYUFJcFVZSVlYUFJXWEZwVHZt?=
 =?utf-8?B?dTRzakV0NjFWY1Q5ZnBWWUo0cm1ERVgwYktvTzNMNittTUE5K2d3OC9LYVhn?=
 =?utf-8?B?L2JnU3ZpYmNLbFE4NXRoRzNSUDQ1QW5CZktqMDg1S2kwTDFoT3lpZ3AweW5a?=
 =?utf-8?B?M1Z2MGI2SEhTc05qWTd4N294enM2SXFyRHBrUnF0NGxmd1ppd05CTkozZnc2?=
 =?utf-8?B?RmZXeHQrdVdaTDJ0bmV0MVBqOUdxL0FQdmlpbitILyt1Vnp5cG9aWGpLakxJ?=
 =?utf-8?B?ZVpkcnp0ZXRPb05JSk9zRyt4RGNEcUY3Q2Q3WSswUmlvUytwSVZYdGJVV2JK?=
 =?utf-8?B?Ykx3ZFZuYnpJaDNWRGgrbmc3RWNaczVPZWRZcGdicTlNTHZsdlNwSlNQRXFO?=
 =?utf-8?B?SXZXdW53YWFWWDhkbUlrSERPRzluL0xScHBockd0MlFHeFY1V0dNcFVsa0Iv?=
 =?utf-8?B?VTBueEJhbkZ1T2FvbmVJaTRGZVBiaU1kWXptOXNoWVR4NGJCS3NnbS92emJl?=
 =?utf-8?B?M01UQ3VLOXRpcGhlRmEvMmNVTjRFOTFVTjdhRkkxNEMxc1lWclg2WDhJUTNz?=
 =?utf-8?B?U0tHVXVmWXJsYjZSVlErMFFnazhBSmZnb2I4NG5EWHBxQmpITEs0SGx3VXdx?=
 =?utf-8?B?dHAraTdsRmZjcWdCNjlybkd0UlFpNHhoaDl2YVhmeW40R0tIVVZRaDhibzc0?=
 =?utf-8?B?UEloaW5kTCsyQUhTMzFTZXhKSnpoY0xGVzcranpNa1UxZTExcnRWV3pJUEtL?=
 =?utf-8?B?bGMvcGlvd1NCWFJNM244bXNDR3B2a0pXTFMrYkZISlJaQ0YwdkcyWFU4ekVS?=
 =?utf-8?B?d2ZaR1ZUeEZCSjVnQk5JZWZnbTNTL1NXWlVRUWZPUTZhbzVNQ0h4cGw2a3N0?=
 =?utf-8?B?MkpCdnk0WU9XUW9RekhIT2lmQUJpMlFLOThSbE9nSzNsMUF5bFFhT21aNnRN?=
 =?utf-8?B?UXd1VkNydllNWmlDS2ExZDluZkRFZ3R2K1dRVzFzRU83RkxabFJCVWU4UGUy?=
 =?utf-8?B?TnRqbWtWMEdsZVB4QXY5TTcyam5scmgyVERielErUXRzVUtFYXh0UUYrYTZ0?=
 =?utf-8?B?dmFXTkdqN2FtWUU1QXBHSTFRd3ZFbFRqUDZLeWFTT0NNM3I0b3llMzdkMXRs?=
 =?utf-8?B?M28rRU5KQW9Wc2xESWxnMzZHbTdaQTRFWjIvakZXcWIzbFpjeVVoUzNtT0l6?=
 =?utf-8?B?eC9pRHplRWFiTzlEbFkwbng0VUJrQnZwVTN0Ukg3YlhvSlZ5WVBUVlNuSW5E?=
 =?utf-8?B?RExhVUhnUFJ5bk94UGZ2Rk9tdEN5V24vK2RYTURzc3MvUHBpOVptS3lBb2Vq?=
 =?utf-8?B?aG5FaksvcXh0Ump5Um9Cc1dNR3JMYTJETDROcjlyNTNidlhrL1JpYkgzZkhx?=
 =?utf-8?B?NFlzWjBYQTdOL2NhYjExZW9iTVJ4Zjd3dWJiT2hrWnFkQnZPSU9vdFRWVm45?=
 =?utf-8?B?eXAwZ2paV0lwRlZKU1ZjSzFQWVBFNjhXN1Vka24wM3U1Q1JQTnc5VFZvRDVF?=
 =?utf-8?B?VjljKytWd0s4QnNDbm9mZldMTHNTSzUxRGZ6Ym9aRFo3aFhiWElYU1I0NGtj?=
 =?utf-8?B?blZYUmg3NUFzV3BPeVdZUTdFbUx2YU4zZnRLeWxnWUpnRUR0VG1LTHIvSVRE?=
 =?utf-8?B?aW1RZ1lwTzFSZ0FDTDE5ZFliMG50RS9ITmRrUkhDSXl2TnpmLytRa2FwYzZM?=
 =?utf-8?B?M1F6SWI3aDNaSFJqVlgvUStyQkVYQjA1c2tEUVNwNjJlME95a05tN3NCVDRR?=
 =?utf-8?B?NU9jVXF1TXJvaU5kMDJ3UHl5OXVmOWJDYTVNOEl1bS9MN0RnWjJkSXE3UUtj?=
 =?utf-8?B?N00rbkFYd2xtMnZqa3F0c2tib2dzN094aFRXcVU2cE9YKzdBb0xoVVZBS3Yv?=
 =?utf-8?B?eE1wYVNBODVWYUVJQ0lycFJDYjE0WVVXZ3gyUmJVZkRWQXlwdHBNdVJKY25t?=
 =?utf-8?B?TjEwbjdFQWVQOWRNMDdhL1RXT0JHR3RUSGFTSXlabkIyZG4xOHF3T0FRcklP?=
 =?utf-8?B?blBrdmJsaEpuWXR3RldndzNUajlqcTlENHBUMllvZVgrVm5pMVZHWDZwcjRW?=
 =?utf-8?B?RVV3YnhkT2ZXN2xybC9jWEZkZklMM05vRUl1NDVzK1FURi93c2Z4T0QwVmpj?=
 =?utf-8?B?a1Frbi9RUVNIZlhsV1Z2OHV0clhjTzFUYlBBZ0cvUnpEWS82UVV0dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 019f0179-7437-4303-91fe-08de7872f5d3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 15:47:08.0594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A51T/NibxaCcuhB5KrMPSc5PXJoguXH/F2Xe8T99zxVAEFWUUbl6bRnv5t/ChyER6jXnoDMiZdFbnBtypUz+Mfe48Odrdob9wQCKbRnwwIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5817
X-Rspamd-Queue-Id: 5034E1DC20B
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 02/03/2026 2:50 pm, Jan Beulich wrote:
> On 28.02.2026 00:16, Andrew Cooper wrote:
>> FRED doesn't use Supervisor Shadow Stack tokens.  This means that:
>>
>>  1) memguard_guard_stack() should not write Supervisor Shadow Stack Tokens.
>>  2) cpu_has_bug_shstk_fracture is no longer relevant when deciding whether or
>>     not to enable Shadow Stacks in the first place.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>> The SDM explicitly points out the shstk fracture vs FRED case, yet PTL
>> enumerates CET-SSS (immunity to shstk fracture).  I can only assume that there
>> are other Intel CPUs with FRED but without CET-SSS.
> Isn't CET-SSS still relevant to OSes not using FRED (much like you do for
> the fred=no case)?

Yes, CET-SSS is relevant outside of FRED mode.

I just don't see the point of the note if all FRED systems will
enumerate CET-SSS.

~Andrew

