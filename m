Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAJOMUMvD2r+HQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 18:13:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C75F5A902E
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 18:13:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315555.1585323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ61m-0006Q0-QG; Thu, 21 May 2026 16:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315555.1585323; Thu, 21 May 2026 16:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ61m-0006O0-N4; Thu, 21 May 2026 16:13:42 +0000
Received: by outflank-mailman (input) for mailman id 1315555;
 Thu, 21 May 2026 16:13:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wQ61l-0006Nu-7w
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 16:13:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ61k-00Bu3F-I6
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 18:13:40 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0f2f31-e002-0a2a0a5209dd-0a2a4502e96c-4
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 18:13:40 +0200
Received: from [52.101.53.57]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0f2f33-af86-0a2a45020019-346535392b1b-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 18:13:40 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB6434.namprd03.prod.outlook.com (2603:10b6:806:1c1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 16:13:37 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 16:13:36 +0000
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
 b=Ouu+Vdtcw62fwziOhE5sYyERanTrg0rh/8nuu2E/GvKa/8NbLoFDRq3PwkhWd8NadIPAbN5wHGWE1QBGOqHCvj4Om/mYeg42emXL/rLyAI/aU/BuqDFWodsbP9bLkYUQwNFDLsuXW89ZAnZNQk2mjVeHLZ8H7dkasw1QP/KvMUwtSvET/r5oBblX8I90TjR2ojksZ2FIq9fOTMB1Xt4g9l4ARykyw6u2QKxE3ZngtvIfaAXqdz4hf9QVySar6yUIKTwM0abuOYrdWlfdqhK8Jnq/kumfOvzlITCuF2omavvZc7XuqYA/++FZjZwhbKL8yPkJ3Ig6KD5c2HkPFqWweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5xNII3hj8gty8GfUvNS+hTs+MRbWU0WgkzomPKrsc4=;
 b=BeHwQD7w+MZfVjssHAKut2ISeVD8OJlNWtpmdSHws0yhkYbUb4A4scbgPTJAmrXSJILlfIT5j3FcnCpsUWQt6VEUI40Gi1Gi8A7l/eBbugac45sbsupRziBykmnsCqF9IQxE7SYBF4eUUclCgkrROrttKanvu3R34qztcK2R12B512YoK71bKEx5LU+38FWoqV0E+AWsY42Hko7Sr2k8el8bNyzA2/yxoMjTbCzA9j3QiaGvz0cb6DsVFtRvWf205qcqkSRKJBDWK5Bn1+NK9nacYZBPsIf7Cu23bSdZnqSleUgHxlyAI8U3Quyp701nHpfotQMLwQs86AsPof9WOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5xNII3hj8gty8GfUvNS+hTs+MRbWU0WgkzomPKrsc4=;
 b=U5VHwFAPQ18FJUjV31k9jy5excTDmxscgw9SGOyUcTBnO07qCsGGxooc/PSOvumY3FVxhk5s/H3RYF7s2bW6Py9SslYNY1N8fek6PzdCMqmFlBUE+vfKdVkNKIzqGWCEexpVkqpHyirc7gl1mVekik9kjl/oTvgKs52tQUdaOJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <35746cb2-9b36-4c4a-b9bd-71a5df64ed92@citrix.com>
Date: Thu, 21 May 2026 17:13:32 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.22 v6] x86/svm: Support vNMI on capable hardware
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20260514175623.1869042-1-andrew.cooper3@citrix.com>
 <ca7c7f2b-ab85-44ec-a62f-1bab60d045d6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ca7c7f2b-ab85-44ec-a62f-1bab60d045d6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0019.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB6434:EE_
X-MS-Office365-Filtering-Correlation-Id: e204eb92-6132-495c-89c7-08deb753e96d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|11063799006|4143699003|3023799007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ANGPgrhrvu7MNukQcVfrdLun21FenkYFB8XpGpORs6lFBrsQaOrMRdaO1iqecPiFqFVHwSmh+w95dkqFzyiAep2jT8Q/g36uBE2nXvQDZXYX18FPOPu3k7tmJmcnl0/fdW6jgTPPu3MaiEvOOB066g96aBbSWhWtuw0N6K1yQOBjR1j2aLzmouhszap7huWB6JII6pbNXgKnsuGr4+xmuk6csnib4MsDbgaaT1f7hk+lK9aKzJFmqhDewq2ryqhJZzBI60nK3rj6qe+i2yHDD4IQeJMpR2+jiXH6EFcLZkicqxc2e3DLArDP5Mhmu4qszg2R+/iRdUEnUJTQYiuNbAtxT7boKlupXCnLYq0qV36j8DVIHSo6qUZZ3ap0Ak+DtpJT3aVBgr/buLM5jFaibZhU4lSrSoLWllbTCZgympjiNLk4KBSPtfwxK2DDp1T1KKXa+P7EfqEhvjsU/7Xd91wDAUZVzMgqKYqbuOdECXDdgOUL0HUJKZIDHz1I910YsKkJ6m35hjUMSJP2Z+0vKQsRtrQmPsniKzm+HoCbJjjjXthp5RV1d2RoXujZZJT2ZUx/UJ7O6n9sqadABx3wja5Wi70FDU/BJCFXknSjM074aUcYgUQ5RMwumq6AWwtTywr+wgPp2zzReFRqGj1hS/OvnykWnub/R7wsfoVg1utIvds+RU7EbNt/id9T/Ktq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(4143699003)(3023799007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ak9lUG5waVhwL0lacEl6Z21LVEhLQllYVjMzTlVYN09PMnJqZFNKSXBOVyt5?=
 =?utf-8?B?MWQza2plT3RKYUFldENIMjNqc0NLMksvNkdPT3RSOGppR0VVVDR2QVlrZjhH?=
 =?utf-8?B?em9KR3JLeFJCSnFHeXVBbFpURjdERnhIZEtKRXNrRWpQN1BXZ1RaWFFhWWJ1?=
 =?utf-8?B?VlNEdVRmTFlWTktOYnFEY1E2aTNmM3d2bHlXTmc4ZlFQaGx0SXdhanFaa1lj?=
 =?utf-8?B?MlZGUlBaVTNxd3RmcVowL1ZhUmFJYnpVZTJESnVMRHFuanhIQ3A4bC9kRFRw?=
 =?utf-8?B?bFF2WmZFelFYSzRVTU9QdjVlaXRvenArYTFCUzZ5OUpSSDlkWkdvMVBuR1M3?=
 =?utf-8?B?MkVNRkg3L24wZVM4OFEwUkFnWFJiSVEvaFVLODJjOTZRVjBUcjFqQnk3dDdo?=
 =?utf-8?B?NlBsbVplRXdXSjBpa0JrSkxwZFE2Zks2aVpYMTB2eFJVMmZFc2xRY00xVzdX?=
 =?utf-8?B?M0xidmxBd3poZTNQdW5SNE9vS2VuUnhtMGd1dEdUL2R6SEhDSTdoYlR0ejZh?=
 =?utf-8?B?Wno1ZG5tdnRhM2lNUXVEUmxmdFhTVzhkOEVDNmIyQzIzZjloOXhBZUZXRWd2?=
 =?utf-8?B?N05yQThzMzBVbmJZM0puWHVhYytBa2M3ckoweG5uZVpMZGttQ1FET3dPNXcz?=
 =?utf-8?B?YXJQdGJlR2F3cHFTRjRpWU0yQktxUFdUQW4wbEFCeWxzdDVVS3Q1MmY1dGdY?=
 =?utf-8?B?YWFEN3RndS9jNnQ4ZEFGL29MVGgrdTU4RDZ5QUJmN2k3UTZQODE0TndWQkxx?=
 =?utf-8?B?R0NKbHVZdWIyS2o3Nm1GMFRhUU9QcTNqM0ExQWdleFdCQUdSU2c0dDM0RHBI?=
 =?utf-8?B?Q0tmUFlxN2ptSkNMYVoySXRmc0tSZTJzcnVnSmpUY2tCeUpBRG9vbVR4aHda?=
 =?utf-8?B?T00xbHh6bUxodDEzUEQ2WUNHZmZHLzZ4NStPT3dPMzJGamk2MFNkMExvdk9v?=
 =?utf-8?B?YjlyWnkvd2l6b1RtNi83U2JZeElZUTkxdTU3MmRCbzh1cGZmdFNIUUU1Y2ZY?=
 =?utf-8?B?Y0lpUlczTVoxRnlmL2tjeStWd3Y3TTVIWFF6U1ZxeVdNK3Y4ZWpqdVlXeExa?=
 =?utf-8?B?WGo5SG1rSGNZLzRkQjg5bWxBUXBDVE5QeDRla0t5NXdBRzQrZVVhZVZwQnI1?=
 =?utf-8?B?M0REc3NENjJpa0RtWE1jamdub1oyalNKbWJyVEVKb3ErWWFSMVJ5QnM5dTBn?=
 =?utf-8?B?WHVzMVkzODlwMHJWTi8weG1DNXFBd1FFWWNEOGRNNk83MjVPTEZTSUpCZFNJ?=
 =?utf-8?B?RUtNQUpqcXMrTXVBMVBqUkpIWE9EcC9MWEVVeHc5ODFjN3MyYytYaFhEb0kv?=
 =?utf-8?B?MGZSSXMvWVBQeCtWQ2xpMy84cWhpUkVzeFJaM1lORHZPMHlxTkxRV0hiSXNy?=
 =?utf-8?B?bUVIWHNrSEt1KzAwZFphN2wzcFp6NHk1NGhxb0s0ajg3dVRTM05OdkU3allE?=
 =?utf-8?B?eHN4dm9EdDNaYmZSNGwvZk9mKzc0UXNiZmMzN3dncC9ZTTQzcWNvNnR6YThj?=
 =?utf-8?B?Q3hGbW9sVmNsOEd6akFkMmlLdlFtSDZhN2cwWEx2M294YWFXVEVlWmowZlNF?=
 =?utf-8?B?Y20wNkc1bnpBSGhGMk52SHAzL3czTnpMSDVVek15QnI1ZFlZOTd6bDJmcGpu?=
 =?utf-8?B?YmYzMHliTU5ReCtVR1hLeFVFeWVwSDcySEhuWm0xUDhUYmhqZldEdXhKZGx3?=
 =?utf-8?B?SUk1SlhSSzJPQUR6TlFXYWhZL2R4cnEzamFRL3BBS3d5Y25vTFBoOW9STTk1?=
 =?utf-8?B?VkZNbVNQWXhTVEJCMWljS3lHMWEyVnBTRWF3MFFncFVNZ2djU1dQWVFNTGV6?=
 =?utf-8?B?d2FRTllxVTdkcklya3l2cXRtRzZIQlBFZ0FpYVg1UFRlb3JIaC8vWEMzNVBu?=
 =?utf-8?B?R0laVjkxVVltQUZSK2Q4Qy83Y2lJV2wrcU5OQjc1aUtlblM1MmhTNlgyNmxD?=
 =?utf-8?B?RXNsZ0hmQWpIYm1mT0JaZ3hMWVhUNm1kZERTdHgvMWhjTmk4U2hnTWxBWkRa?=
 =?utf-8?B?ck1aRndKMC81Tkl3ZlNuVENLUllaOU9hdXN0T25DUzhjeWF2TXl3Q09lMXVL?=
 =?utf-8?B?NWFlbE85TG9LRCtGazV2Z00wdFdwNVdYMEt2eUN2KzkvNCszNkNjVHg0ZmFl?=
 =?utf-8?B?cC91YU5NNUhpWVdTZE9PRDV4emlrSkJsOVlkK0hKQ3dvL1V4dGExY0pEdHE3?=
 =?utf-8?B?aFUxeHd5UEVkNVVVY0p1ekQxamJQbkRDYVcrRHYxbzF5dXdVSmJvUjVRaDJG?=
 =?utf-8?B?N2pJQURBQmZUUHVCN0gwNFdPWFlNMGZJem5nWEJ2cmJhV05XZ2VHMWI5cHY5?=
 =?utf-8?B?bWtDVzlGdkZaZXR5ZDRkTnUzTjJOMnRELzRtUUg3OHdNVzd0S2pTdDRYOVl5?=
 =?utf-8?Q?Mxv669EvPmj7Bbmw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e204eb92-6132-495c-89c7-08deb753e96d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 16:13:36.0444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBKP6rKdhpb/QH15kyNlqDsdc9B8fpFqz+vS/ANzI8DTL1PutLIU3PrIccpmLk0MXZaEuYkZd+t8P+O6zrAAk81KwChlHddeFtfSk9bzgtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6434
X-purgate-ID: tlsNG-720697/1779380020-83961161-6D1755AC/10/73395122804
X-purgate-type: spam
X-purgate-size: 2289
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:abdelkareem.abdelsaamad@citrix.com,m:teddy.astie@vates.tech,m:jason.andryuk@amd.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,gmail.com,lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:email,citrix.com:mid,citrix.com:dkim,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1C75F5A902E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/05/2026 4:51 pm, Jan Beulich wrote:
> On 14.05.2026 19:56, Andrew Cooper wrote:
>> From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
>>
>> Starting with Zen4, AMD CPUs can virtualise NMIs for a guest.  On older
>> hardware, determining when an NMI is safe to deliver is a challenge and Xen
>> does not handle all corner cases correctly.
>>
>> With vNMI, there is an enablement bit and two new bits of state in the VMCB; a
>> pending bit, and a blocked bit.  These directly map to the CPU state for
>> handling NMIs, and are maintained by hardware during the running of the vCPU.
>>
>> When vNMI is enabled, have svm_{get,set}set_interrupt_shadow() work in terms
>> of the vnmi_blocking bit rather than the IRET intercept.  This allows an
>> emulated IRET instruction to re-enable NMIs.
>>
>> When injecting a new NMI, simply set the vnmi_pending bit; hardware will
>> deliver the NMI to the guest at the next suitable juncture.
>>
>> One complication is that, when delivering a second NMI before the first has
>> completed, the mix between common HVM logic and SVM specific logic will try to
>> open an NMI window, malfunctioning as it does so.  When vNMI is enabled, short
>> circuit this to not consider NMIs blocked.
>>
>> Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Teddy Astie <teddy.astie@vates.tech>
>> CC: Jason Andryuk <jason.andryuk@amd.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> For 4.22.  This is somewhat overdue and makes a concrete improvement to NMI
>> handling on recent AMD hardware.
> In particular with this remark in mind - should I perhaps pull this over onto
> 4.21 as well? Or are there dependencies I'm overlooking?

There's this patch, and a prior patch from a while ago adding the vNMI
CPUID enumeration and fields.  There are no other dependencies that I'm
aware of.

I was intending to backport this to 4.21 in XenServer in due course.

vNMI will be a hard dependency for supporting FRED in guests on AMD, but
I doubt we'll be wanting to backport this as a feature.

~Andrew

