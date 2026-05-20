Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJCbBNjtDWpb4wUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 19:22:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B37593760
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 19:22:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314217.1584200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPkbp-00081t-LY; Wed, 20 May 2026 17:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314217.1584200; Wed, 20 May 2026 17:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPkbp-0007yZ-IC; Wed, 20 May 2026 17:21:29 +0000
Received: by outflank-mailman (input) for mailman id 1314217;
 Wed, 20 May 2026 17:21:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wPkbn-0007yS-GC
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 17:21:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPkbm-00HSTV-I6
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 19:21:26 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0ded94-5cb7-0a2a0a5109dd-0a2a45059a88-2
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 19:21:26 +0200
Received: from [40.93.195.30]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0ded94-aaa8-0a2a45050019-285dc31eb4ce-4
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 19:21:26 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH8PR03MB8324.namprd03.prod.outlook.com (2603:10b6:610:2ba::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Wed, 20 May
 2026 17:21:22 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 17:21:22 +0000
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
 b=FG+XGNbIKVXvKZmXzFbL2JZ7jfWZSOfYjA+flsZHq7FRpXtZFtyIEd6roa8Nb1QHut4mhbaF6Mfg/eyDlBIUMJZExYUaySNbQyauO/bU43s7RMJrdufrYYV6Fit0ZpC/q3Pw+YpwuG0Aj/RlQaCp6LTzp/G95GUpXsRwuLXOXUlHzfDi/ILlHLM8MJzRe/t5mkSBumuE0ptNXTLojBhl347ugyGlfADvB5Q1U4aj+2FC0rr/bdnkeK2yT1G1O8OKGjSOXQLrU6wI0KnQSv05UfkOZWU/1vNvp3lT3Nem93beR1mBoVnbmOtYlcCHZJmv5FNyCsv39Z1nsBhzQcbYew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJMYv+lFmDMeADUd2BTKbkLoCZoHH0E3Nr1XiM/5apo=;
 b=j+7YVF1AzQDs5SFFtqxMbPEmxIOETQrrzotaCxwlDi78GX5WeEoXHO5EOauko/gFSoNX9KwGYS/ICeKaJNxxRQwzEoO3/iimCDff1j8+Wr5QuWAzlKaeF8gro4mridzbjSrg9wqRqMtjsMsQF7cZa27mdr+VSkh8CKskjmkYb2vLpm8CqDn3z6LaNkgpVFhV5NhQcmhZf+56Eld8orQkCC61KWI8Lm7becWBvNFdbEbYAwSlk1ehOdOmR/iQWSZD4oqGxG/vpTmGkq+4KdHbdoJz8iTIzN62GQsy85rTJ3D3xBtr60vu7pYt0E//UrAkbKBsCpeoTT9iZAhfzIXCPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJMYv+lFmDMeADUd2BTKbkLoCZoHH0E3Nr1XiM/5apo=;
 b=tI/zhwO/6O4tTnDOt9AcfDMyvfr2lc8j8zWMpBuIQLDcN/DxT1/gL/sLhyUEmNK+qr9LRPtQrP+VZFpFcDitlBILJV2ogeAryHjzJulfEy1m/YeG50NLRwpmyCbe+FNfi23kkcX+hTzEcOacwv44aFj/oBdScNv47cR65qiQiQg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9a6f4d03-651b-449a-80d0-35077170c8c8@citrix.com>
Date: Wed, 20 May 2026 18:21:18 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] pv32: Fix bogus cr2 on fault in emulation gate
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <1779292317.8631fc262581453bbf619ec5b2062170.19e46162869000f373@vates.tech>
 <0e23078f-30e0-4077-be1e-365a265603de@citrix.com>
 <1779295699.8631fc262581453bbf619ec5b2062170.19e4649c100000f373@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1779295699.8631fc262581453bbf619ec5b2062170.19e4649c100000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0310.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH8PR03MB8324:EE_
X-MS-Office365-Filtering-Correlation-Id: c764f151-2a6c-4be0-948f-08deb694368f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	3n/KFIiD88YY522lRSxCEYjOqw1zRoiOQjtAM1ZYYFRdOeMXF01K+7b/8fpNT6VWDWXTI1FbFWDNdJFdVKS1F0H6Xwx+q9ZCOHWTCw0ubQyU2yGeA1nvPF9MoRFMrFD6FiW9jhvJro+qIQ8P3EFMRXZAjA5Tmp82POVhkPhktyATpkB/sXc7P05Ty+6GrvbnTteWXBp7qYZh1f3DY8rTq5oJTbvySWO0w0RAldTKD/IDjtPd/D+hlcNPYPR6MS/SA5cO+YInEAQ2tVGhIK+vcnM3SJIx5wJTkfcI/RGEQq0o2vrPGvcKlz/Kl3NWwL1c1+07Jfq5A9Z9Y+2D/JNhG0X7bTd63wvP4D88oIM81fNqhF5ZdwZMk4SkS1P6bVNuoaxQD+dLOBUtgcp0uGkqUG3fctp7uXyqe+cYOq++tMHxgsDbWIy2iEYnGw6UlZeju1Bi+KqQuDR+jbM5Mq/D3IxhL33aWLkZhXq6eQ7tVVr6we2adJiE3kWdUwGrh/mmeKhxbb/CsZ9FawJdU9aGw5nlaITIm6muEA6aqEIxrNe0ANNcKdmv/kTFh1sk12sz4m5MQuBwV4sms+x6fb4ThpA4ZYbsWfx8lXMTI2Dg20GoqUcvMlu+DYZaEXhw0st08vR8V4L3vDmYiW/EeUOn4Xe4J7iWbdplmAVxP1MwQdoLFcFtwgj3/rCd92FKoc+7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTNIVDZUdjZtVmFFVFdBSnUvZmhHRWhnVWVDVCtodU1CNkVtQjIrOWpDeFk5?=
 =?utf-8?B?aGtIeGRiZUpVUDBhZFlGeTRDcnp2amZ5eTNvaTJaSUVHMExXQThnMFhCeVdH?=
 =?utf-8?B?RVZxaDdzTlVrdmhCZHhpQm4yaE9jRndBVUlhQ2MwVk9ZYURSSGkwRzVUYXJs?=
 =?utf-8?B?UVM4ckh3MVNwV1RxS0dZV0ZmdjErdyt2bGFKSWNiME9ZUkdyRlFENi9USUFh?=
 =?utf-8?B?S3lQTWt5a2JYMW55OHQ2KzEya29WdXNvbGlTMWJaMGNVUnp2c0d1V2ZENFh6?=
 =?utf-8?B?UFdjM3NiUitRMzY5d0RKTUw1V1Bkc3M4R29yL0FMc2l3RkRpM3Jrc1dwR3Rl?=
 =?utf-8?B?NkRmdElkRW93cVRlOHFQcDJHUUlibUE2emU5QVB1SHpqOXdmb25obGJzN0xB?=
 =?utf-8?B?VmNPOGhEM1UyNXRrQnhhcDZ6aWdEcDY0UVZ6M0pQemNRalQ2WG9YSGV0YlE4?=
 =?utf-8?B?b0VEd2FDYnRzOGNkcHNlVDlCb2xVV0p0SEdWM0VmaVUrU1JtblhKcDRjYkR6?=
 =?utf-8?B?RHlQQjdrMVJ0UDhGajZ1Nlo2VkJaK2tTcFBnQVRBSjloWnVreUVVbDNEME9u?=
 =?utf-8?B?WXBBOTI2Uk5Ra3BlUVFYc25QYVNXbEh3czhZdTBvOEh0bHlxL01haFBIRXRO?=
 =?utf-8?B?bHFEZEFXNTRlVUpOYXFydmI3RFgycmpRb1prZDg2QU9BUEE3ZGNnci8wZm5h?=
 =?utf-8?B?V05iREtCOGZBR0NDRW9Ec2hNMU9yZ3NWZzRUVFJOWXN4b3Rhc2Zsd0RMYnN2?=
 =?utf-8?B?bmNRcmFKTGdaMGNRVE0xRWtOK3o5ZnZZNnpzZ0c2Z1JXK3NLd20zTC9wYVh4?=
 =?utf-8?B?aFRsalIyeTB1TDJjUTdGakhhRFBva1BDYkczUzQ2NFJpeGt3ZkVtUnN5Z2Zn?=
 =?utf-8?B?NnFZeFVrYkk0Wkk5STNaTWNaMDFTcy91eTc5RWp5RG4rNlJhRjA2N0liVXZG?=
 =?utf-8?B?a2RnYTZpcXRWMlcrMnAyNk1EcnhJZkE2NWMxR094OGc0a28xSkVwaGw2ZWZk?=
 =?utf-8?B?dXlJeWZuNXpDeThrWC85MHp2d1B6TGxybWkwcStaZEFKOUhFTFBBZlp3Sk5Q?=
 =?utf-8?B?N25xOW5sMHQ5c3gwNGdZT3VyVUhxdFRLUW9WZll1dUE4NVpOUVo1clRFNU8w?=
 =?utf-8?B?Z1lpZzFxUkQwQmtYemJvUW5RY3VxTHNsc2dRT0xNNDNldWhPMVlHUGVGNEpk?=
 =?utf-8?B?dytyUjBZWTdnUEdIR0dhRHNrTk1ONUhwY1hhbFBiY0tnMnlvc0hRWG1PV0ht?=
 =?utf-8?B?R0cxdlFucDduR3ZSSVROZGxSQklHUEh6SFNSdnJRUzVUWGk1MDVicDBHdkVx?=
 =?utf-8?B?NnRhK0cxUk5tUkpoOUxNK0NkNnlFVDVjSkdQWHBEUjE2b2dDN3JZRXUrRDA5?=
 =?utf-8?B?ckI4d2UyYjBYMWJYYlU5QjZTbmF6RE50VWF5WDNMY01RbUhBRzlIRHdFUk5i?=
 =?utf-8?B?QTdYYUIxb01qemg1ckFGSXVPbVVPb1Rwb3ZiVTJVeGIrRnlHZEZOQ1prSWZQ?=
 =?utf-8?B?TWNZdENibzVoOUp0MGZBa1NzV1JUNnBoUEVFYUhrajJKTzZST3AwWDdWb1Jm?=
 =?utf-8?B?cDJrYkViQ2tiMzdEcm8vSXcybjFQQ3BWZEJXTG5lNFlENDJWcDV4SHlrWFp6?=
 =?utf-8?B?WktWTGtsZGtSY3k4Y3BScVBmOXBjT0lWRjgyTUJGV2EzeWZpSVdWUUJrQ1pv?=
 =?utf-8?B?SS82c3JKSmVlVUhucnNEN0REOE8veEhybDViT2JqajU4cVhVVnpwU3dEeUw3?=
 =?utf-8?B?TXVSYlgvdHRLYWJlejNYemR6a0JOOWczVFFyZEpKeGhNZmRDNEdYMXhMUzdN?=
 =?utf-8?B?b3dZMG1MNE1ybmJCV3VuVzd3aUhEcHlhR3pvWWI2dXdmT3lpcWVZUGkzcldo?=
 =?utf-8?B?ZnY4WldLeWVTVWJNUTNLeVNrdkdoV1oxUmdUSUxUc1NMU2k2UFYwbmZ5S3ZJ?=
 =?utf-8?B?K21PU25QUEd6SjRwQ0hCVmE5YUpPWXRMODVmYmVVNDNPTkJXSjlOSm5CZVQ4?=
 =?utf-8?B?a0VGTTdqcGpBMXZjWm9sWHppV2krdHBocjVQWU1KSzBtWmZ2Q2N1c2M3Njly?=
 =?utf-8?B?OXNabXhFTzlSWVlTdEdNa2pOdHpHMjFuYVhNamNTV1FueXp2SklFK3lFdGxO?=
 =?utf-8?B?YVRuYWxqTzNBYmFyZWppK2VLb0dWQTFmSXlhemM5alZGT0xXVVBqVUYveUx1?=
 =?utf-8?B?SjI0WGxVZlBTek5uY0lwdUZ0M2tLeWNDbkVpNi9Dc25XaDRaK1FqQTJCT3hi?=
 =?utf-8?B?SjNadG1NNnlnZSt3dkxwV29tK2xQNWxKQU5kSVFCb3VRT1MycjBoMzFGdXR1?=
 =?utf-8?B?ODhLOFRkVU9UMWZBOTY4NExYdUV4RDlDdXpWQmVPUFlHSGNFcmlPVm16S2U4?=
 =?utf-8?Q?GSeq45dzhzaQJuw0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c764f151-2a6c-4be0-948f-08deb694368f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 17:21:22.0976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0ibDbmUEk9ur07b0an51WBbuiC85OK4h4oZZTIiVfG3dKtFziZC25R9GhVIdymOf1lWfze/0DkwnrxueljnnFBviifSalDJIThoVjcnsLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8324
X-purgate-ID: tlsNG-c201ff/1779297686-E139A443-58E49D25/0/0
X-purgate-type: clean
X-purgate-size: 3171
X-Spamd-Result: default: False [-0.18 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,vates.tech:email,citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 47B37593760
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/05/2026 5:48 pm, Teddy Astie wrote:
> Le 20/05/2026 à 18:34, Andrew Cooper a écrit :
>> On 20/05/2026 4:51 pm, Teddy Astie wrote:
>>> __{put,get}_guest returns -EFAULT on access faults which causes
>>> the injected cr2 to be off by 14 bytes (as EFAULT is 14) which is
>>> incorrect.
>>>
>>> Fix the computation by relying on copy_{from,to}_guest_pv which
>>> reports the number of remaining bytes instead of a negative errno,
>>> such that we can compute the offset properly.
>>>
>>> Fixes: 70ad570b2799 ("x86/64: paravirt 32-on-64 call gate support")
>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>> ---
>>>   xen/arch/x86/pv/emul-gate-op.c | 5 +++--
>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/pv/emul-gate-op.c
>>> b/xen/arch/x86/pv/emul-gate-op.c
>>> index c2c699fbff..cacc171115 100644
>>> --- a/xen/arch/x86/pv/emul-gate-op.c
>>> +++ b/xen/arch/x86/pv/emul-gate-op.c
>>> @@ -289,9 +289,10 @@ void pv_emulate_gate_op(struct cpu_user_regs
>>> *regs)
>>>           int rc;
>>>   #define push(item) do \
>>>           { \
>>> +            unsigned int __value = item; \
>>>               --stkp; \
>>>               esp -= 4; \
>>> -            rc = __put_guest(item, stkp); \
>>> +            rc = copy_to_guest_pv(stkp, &__value, sizeof(__value)); \
>>
>> Oh, this probably violates MISRA, but you don't need to use a separate
>> variable because sizeof() has no side effects.
>>
>> Given that the expression is now &item, I think it needs to be &(item).
>>
>
> I tried something like that, but it looked a bit weird and clang
> wasn't happy (at least in language server) because of the &(x + y).
>
> We also need to ensure that we're actually copying 32-bits scalars
> (and not 16-bits or 64-bits ones) like the previous behavior.
>
> That diff seems to work though
>
> diff --git a/xen/arch/x86/pv/emul-gate-op.c
> b/xen/arch/x86/pv/emul-gate-op.c
> index cacc171115..b72a3058dd 100644
> --- a/xen/arch/x86/pv/emul-gate-op.c
> +++ b/xen/arch/x86/pv/emul-gate-op.c
> @@ -289,10 +289,9 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
>          int rc;
>  #define push(item) do \
>          { \
> -            unsigned int __value = item; \
>              --stkp; \
>              esp -= 4; \
> -            rc = copy_to_guest_pv(stkp, &__value, sizeof(__value)); \
> +            rc = copy_to_guest_pv(stkp, &(uint32_t)(item),
> sizeof(uint32_t)); \
>              if ( rc ) \
>              { \
>                  pv_inject_page_fault(PFEC_write_access, \ 

Oh, that's a second bug you're fixing then.

Pushes of ss/cs need to be done with 4-byte writes and zero extended.

I've added:

The use of a local variable in push() also fixes a second bug.  On all
but the earliest 32bit CPUs, segment selectors pushes are
zero-extended 32bit stores.  Xen was not doing this for %ss and %cs.

to the commit message.

~Andrew

