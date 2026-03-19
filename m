Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +C8kJw8jvGkptQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 17:23:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FAB2CEB9D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 17:23:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257376.1551785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3G9V-0000Fy-T0; Thu, 19 Mar 2026 16:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257376.1551785; Thu, 19 Mar 2026 16:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3G9V-0000Do-Pw; Thu, 19 Mar 2026 16:23:17 +0000
Received: by outflank-mailman (input) for mailman id 1257376;
 Thu, 19 Mar 2026 16:23:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAdu=BT=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w3G9T-0000Di-Ij
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 16:23:15 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eac837ed-23af-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 17:23:10 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ2PR03MB7167.namprd03.prod.outlook.com (2603:10b6:a03:4f5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 16:23:00 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 16:23:03 +0000
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
X-Inumbo-ID: eac837ed-23af-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQmpDmaxlYIVg+BlrhTUykwnD/I3MFGR5fghj1MTIV8Xb5BXgoLysRvLFVCSZjG75tuTUqJkFh5rPtLPzaCjpQ7Yr9LGEHEdyd3w9JpvCtTuXUHZlgh/I4JwZDjMTyu6BTBeo8K1NP62mHjw7T/VCkD4X3DxGBOUa2pu4RJbjI6iaOfI2ppF/8gseHfSmqZbBp/kGB3QmLDBgGKySiVfT3N9uKZCFL6sM9Sld9MKNBbIjLCzHuSPA/1Ie6ZsO61w5lrdEewZzmRdR+laIQTdvxyZCoumeX7SQro5k7x8t0/tDXJC70JOCtckjzAUvwyLBV8QqmBT+VONdH6IN3R8Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ewCac4RB+z4tj4Pq7tSCM3EqezQxecL7xe5ZdDJw9E=;
 b=NIQpoTIFLKL2WIKM85qRkqqRc7kCGXqZTG0rGVzRUFmnWR23QW9jI4VXng7mE17uz4mG0blYp9zKQ5SGSu+lpMBsU7XHPzRyOSRhOo+/oeYpUq9Rw/tyhBxzY/fmK/kFsh1ya8u1rg5vf4pMPSmrCkRoe0nIStSp4Rds5wTf7/r1cR9LBeosUDRXfyuLk6I64SMETKww6J4iJaPZK8fh/BSNXcVdFWCrWsQ4MDEjQqtfF7PKqSrZIU60hyqPRk4mKsENV0c/iG3d3VwEJMBpiONqSt8hJ/iaC4JOfbYaoranWgawiOCo+ETDsrC3qDUt+IqR06zw5zhuzPQYmPCwuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ewCac4RB+z4tj4Pq7tSCM3EqezQxecL7xe5ZdDJw9E=;
 b=cNM6Xu1op+L6M3wvGEqWtCS3XcT9Xi/e/sfgZIjuvUuooUpywzXuuqo7f0ZFeBBib7OT7zYNp/XX6eq9Cqqz48FSphGWoDXB2uAnV1rwT8lR+uCb+BdBTQr4kyPXGTXNyqegH1qGf0GbDCUzNXmkEUB0H1KBpjiVZMqng576o5k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <097d504f-2013-4d3b-9936-a97ca4437294@citrix.com>
Date: Thu, 19 Mar 2026 16:22:58 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v1 1/8] x86: Always use eager-fpu
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
 <20260319132924.1469809-2-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260319132924.1469809-2-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0299.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ2PR03MB7167:EE_
X-MS-Office365-Filtering-Correlation-Id: 68334f1e-e606-499a-80b4-08de85d3cba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	b+7wLT1muVbLW2VA7nWl9lbIPv0/yxF5tZTFK3uvzHPjkhswY72P7r3I2A+Ybe9rhYfm6Sm+PvPqP1nlXzt3cxCuvG1BCGK/j9NhrF4pIoBn4bdwd2HD40KE06bdt8cKj71rLpJjWuPp6+efFpr2D679LRGZzIudoOMNaiC92HzkXSSBsOxOq5EgwIIMidWaUV2UdQiJsmW1hA9irPOUSOawXosvEQjHDzqTU01/uVcXQ8KnK1qCRTlq7n8EbFk+zvAjahLL0WdzjUMV0fxsFNq0Ys1Vmiwe5/8L42fobt5ciojI21vimJkM/FfyifeeF2rBpNGlU3L3c+L3vBPeJLFhtqVifKONJjZHWn710dLHdFwa2BXwTkXYGVBZLAkdM98ct042j9A6+0lqbhKbHs2wOnVeZTei/RNo3UBzsG4Ki8dYFDojoGg0hgXjF1p0vEG/QW8PbCYeD97JVXkVE38OLZ4aOP4HEjeC1DNDqqGE/T6SX35RnJYBf6CGKXwBTUJJAMyFUqVijsNHptLt2VGkZXm+xoDRTj5XoD7uiAi30q2ne0cxTiwOSYKCUk6nwBbcEmC07T732zoSVuDv5WjorbfVw8j/G1x8MRaE8SztdYjLGy/DBz3k9FqYOvP1TDqvpRzuUrKWTQ4Gr/po37nyKc7VC9bM1WdUcK27mwfzOFAuUeDEK45Ao8NmDU/1qKg498PU7sEigJK4KRrsTfAtXP1ZF+9teSA6ctc72Zk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmpBd2t1UU1vSVMrQzhLUHAzeHdSZVorRXFKS2w4K29wTDNHb2NGRDk5Tkdp?=
 =?utf-8?B?aWV2K2hEUUJtTDl0ZzltNzcyQlR0eUNxeEhsUG9Oc01pQ2g5eWJXNGtnREtD?=
 =?utf-8?B?clZpc2lucW1nRlJaWDJFSlFnaGgyVnV5LzZJcS9zVG5xVm9vL2NyTXRsSytN?=
 =?utf-8?B?aWsyUXQvcXJRcGRBM1A3b0R2S2xLMW50bkw2MzBQSVVWSnNGRzFPU1pjMkNM?=
 =?utf-8?B?Nzlxam4xUkNSVkhuSm45TW9kaGZneUhtbDJVVjU4cEczcUxIWmNWZDRidkY4?=
 =?utf-8?B?c0FCc3FxdXI5UHBSWEg4dC9wZEo0WEtINUJjTVRuNnhnTDNydjdaNTZ6UmNE?=
 =?utf-8?B?eUNybE14bHVRM0lhWjlTM093elZNRUdlMFc2Qm1XQklSN3JuT2E2UXpkOThn?=
 =?utf-8?B?c1FQSVpNRHVVSGl4RGo4N0ZmRmU0TEpLTWtsSWNyQlgvczJxaFlvR2EzRDBj?=
 =?utf-8?B?NFV1L25IZS9CVXc5ZHo1eGc5U0dSK1M4SHlNZWkwQjFabFBJZHFDOG5oQ2ZJ?=
 =?utf-8?B?UzhtSDBLcXJycGEzTjFHQzExaGpkREIwTEdjSTd1eWYrRWdudXQ3OTRiZHpC?=
 =?utf-8?B?V1FHOFl1b0I1V3VkVnhKYitIUkFmMTd6RXg1VmxxQjhSbTRwWGFvdFpIYmM2?=
 =?utf-8?B?eTdKcjczU3BGUWN3bW9LcXFIQXAvZWt5U1c5WTJyQ05NZVJseXFzaUd1RklE?=
 =?utf-8?B?Q0dsVmJvUWVaS1o1N0d2bCt5QUpweXZPT1c5NXJwZjdqMXRvMWxLLzJqOXpT?=
 =?utf-8?B?b21qU3hhNnpXbG9yNWpXZXhwWUZIK1lLbVBVaGUyQTdnL2Vkd1dTbEdydEg4?=
 =?utf-8?B?dGFPdjF0VnYrYlJYYkJPWU9lRDlDejdkRk5abW9Gak5ic2JIcnNSbEJBTTUx?=
 =?utf-8?B?YnkxTy90QTh2dGRCby9YYjJ6YU9obUx2RzJ3ME9pN2wyU3RDQjB4WU1PbGJ2?=
 =?utf-8?B?MkwycUlQazFtei90NUl1dU1pdmxoelRvL1RVa1Vvb1ROeHNRM1dCT0dmVEN6?=
 =?utf-8?B?c2RxQ1V6a0pqSkNHdGxHU21qcC9SY0dSNXdXOUIxa3l5dlJHYTJWSHN2MEJh?=
 =?utf-8?B?eXhPa3dYbVVIb0JLckxPMVU5VEhBcllyWDduM09ZVUh0N2htUTRpZlJlQ05t?=
 =?utf-8?B?b2FzamFaY3lBY3N4MVhEbUgxNjJyeDVxS1l4OHJmSlJ4eVNtNlVRWWt5UE96?=
 =?utf-8?B?WlUwVVdsNi9wRzZLdXQyZDlia2lCTjdDSyt5UW1va2JYMUNFT1didElzTmNF?=
 =?utf-8?B?aGZuTEVraUlpQmdLdUJDSkNqL2k4dWdkSy9rcTBkVW1jSDZRQkxDQXd1SjhJ?=
 =?utf-8?B?cXJNU3FhaVZmWGQvcHhDanhkOXE4c05LeEYzVXR4b3ZYR2JOWWNYTWh3SDBK?=
 =?utf-8?B?dFBtbW00ZjBIUmk1TlhqTVY1QklVSmNUcU14TkVUTStmWnhhNGM3WlR5ZFc1?=
 =?utf-8?B?R0szRnlOZmE5aWRSRFMvTHRaQnBZRWxKNTQ3M3pwSE4zWDdkOExvc1VoSC9E?=
 =?utf-8?B?UzhrMDhLMXRnR1dSdUN1dUQvQTh3QXRiR2lDelRjbzJ3SmVyckpUbzRQSm9W?=
 =?utf-8?B?MW5jZUNVbHN4SnhIdDRMcXZFSlEzVU4xRzRNNURCUlBCV1JBV0FRQ2tnZnBT?=
 =?utf-8?B?V2lKaStqMndTalliTFpsVWhGT1pRVEF6L1JiZ015YlptMHhvbHh1TjZNejZx?=
 =?utf-8?B?bEZCWDkzTy9uSTRvSVdPMmNxWStxUEdSRjc1Q0kyOVBQb1pja09Vdi90cUpw?=
 =?utf-8?B?MVcyN0sxY2Y5REY5ZjNuTjZuYmIyR3h6MVNjUDhqUDhxeU54OGp1bmRrTGJT?=
 =?utf-8?B?Y2l1SzQ0dVhaR216Q0tRbkJnRlVzZnBvN3VoY0psRUNmRUtMVkdhcG9VUXF3?=
 =?utf-8?B?bldlay9mTHhtREFUemJxVWlWU1JCZEpBR2lVRWUvbFNDanl4clAzaDgyN1dS?=
 =?utf-8?B?VXJBSW51ejNyVDdQenEvZDhCdzgyNytrQVRvWU5MZXFxNlJEbkE4YXRkRjd1?=
 =?utf-8?B?aGNBaWtkQ1IxdG5MaXErU002MzQvcDBoNTExeFlvYUZLT0UvUllJZml2VWRP?=
 =?utf-8?B?Q3lVRUxabzdUVDJGYmllR1EweXh1UERRb1JZR3hZaGNnNS9Oa25raVlRZFgw?=
 =?utf-8?B?Nlp5UHE5MzNCVllBaFQ2N0crMmMxc1lxNHArbmw4Q3I3U3ZNVk55SkFuVllF?=
 =?utf-8?B?ajhWaUJTVHd4SjBFTEhMWmdUY1VGTzJURzZaV1RHOGdvd2FXb3BlUnRnb2po?=
 =?utf-8?B?cTBBRzU1eHRPaFF2bEl4d0FHUlRGNElpU0ptSFVsRXlnRE5id1NpK2hzRGVy?=
 =?utf-8?B?TklIZXByZTd1Rm0zRklOOURkSVJMUkN1WDMwd3kwTUoyWCtpbXA0Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68334f1e-e606-499a-80b4-08de85d3cba7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 16:23:03.5656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kbJ3QCQvcucOBOpFk237eMIDPI7qx6kBc9aL7A4qRveAasFlTkgut1lmYeM1R36JeVimqWsLUYHxQak9vFwcHtOE58Mjk4LpekHGcd17w8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7167
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 12FAB2CEB9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/03/2026 1:29 pm, Ross Lagerwall wrote:
> Lazy FPU avoids some work during a context switch but pushes the costs
> elsewhere:

I'd phrase this as "more expensive costs elsewhere".

We're trading off a slightly-longer XRSTOR now, for

1) in PV guests, an #NM exception
2) in HVM guests, an #NM exception and VMExit

and the longer XRSTOR.

Lazy is only a win even in theory if the sum of time handing #NM is less
than sum of time doing the longer XRSTOR, and with ...

> * For a workload running some Windows VMs, I measured about 83% of
>   context switches out had used the FPU so most of the time the FPU
>   save/restore is not avoided, just delayed.

... this "No, 83% of the time", falls firmly into "no not a win" category.

> * Setting/clearing the cr0.TS bit is serializing and reportedly slower
>   than the processor optimized xsave/restore.
> * Linux uses PKRU so a partial xsave/restore is performed on each
>   context switch anyway, followed by a second xsave/restore at some
>   point during execution.

"This interferes with the 'modified' optimisation that hardware uses to
try and reduce the cost of the following XSAVE".

>
> There is no measurable performance benefit for using lazy FPU and it
> adds unwanted complexity so remove the option and always use eager-fpu.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

I think we want one other bullet point.

A key difference between 32bit and 64bit OSes is that %xmm is in the
base featureset for 64bit an thus get ubiquitous use in userspace.  This
is likely why we hit 83%.

Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> diff --git a/docs/misc/hypfs-paths.pandoc b/docs/misc/hypfs-paths.pandoc
> index e86f7d0dbef9..1553cb0bcb7f 100644
> --- a/docs/misc/hypfs-paths.pandoc
> +++ b/docs/misc/hypfs-paths.pandoc
> @@ -108,12 +108,10 @@ A populated Xen hypervisor file system might look like the following example:
>              active-hvm/      directory for mitigations active in hvm doamins
>                  msr-spec-ctrl "No" or "Yes"
>                  rsb          "No" or "Yes"
> -                eager-fpu    "No" or "Yes"
>                  md-clear     "No" or "Yes"
>              active-pv/       directory for mitigations active in pv doamins
>                  msr-spec-ctrl "No" or "Yes"
>                  rsb          "No" or "Yes"
> -                eager-fpu    "No" or "Yes"
>                  md-clear     "No" or "Yes"
>                  xpti         "No" or list of "dom0", "domU", "PCID-on"
>                  l1tf-shadow  "No" or list of "dom0", "domU"

Juergen, do we want to nuke this whole paragraph?  I recall that we
never took the patch wiring up the speculation controls.

If so, it will be better to split this into a separate patch, rather
than to wonder why we've got a hypfs docs change with no associated code
change.

~Andrew

