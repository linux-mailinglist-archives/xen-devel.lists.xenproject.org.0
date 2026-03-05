Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dCsODCk9qWmn3QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 09:22:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C64120D629
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 09:22:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246285.1545490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy3xs-0006Jn-4S; Thu, 05 Mar 2026 08:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246285.1545490; Thu, 05 Mar 2026 08:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy3xs-0006Hl-1n; Thu, 05 Mar 2026 08:21:48 +0000
Received: by outflank-mailman (input) for mailman id 1246285;
 Thu, 05 Mar 2026 08:21:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NtvN=BF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vy3xr-0006Hf-4v
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 08:21:47 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 572b95bc-186c-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 09:21:43 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MN6PR03MB7670.namprd03.prod.outlook.com (2603:10b6:208:4f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 08:21:40 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 08:21:34 +0000
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
X-Inumbo-ID: 572b95bc-186c-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYNdTzTZL5EQrjiYcRRCAtPQTW+zuaD+0lQFIAZ2HpP/dtXK17WFm8P7Yh0owLnjCU2t9fMhnhFjru7UkMiNTMZAKQNgofDAhpnsmWlTu4zE5Fvo4vhO+OqWcJmDY7B5U+byFgFxHiCN0HNLmknm9KxIF+qv658cMWpoEFIuhvSizFrOB1wwp6qrMfFBka4ypyXIjaFoCHP0lmItQLvIp5YCXiUbEAfzwHpbzuFT6Q/hvG6sHZG2/6Nd8rCTWupL7BqG3QZ2/TPkb3X6wPqERyzuXcfhEaMz4con40MrURFf2Xhl2DH3T+tBVxYMaTqmz8u/OY6sZNn7sjhWn+PDuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbagBmizmxbYiOjp43L/459VWcp+y6LwL4g6BQXNYmU=;
 b=mOv5tPfrOav3wR696Z7G8RoiThqNSZk3MPwsW2PKyWN7N1S5SlTdw94Nwx4I07FJHA5WgzJQm5GLUAlueHpKBZ5Uoc7rqanpe+8NpHfzks7S8nxqQZK99aosY8JNaxISBQMj4W4NI3HGc+AgS6o3LwA6KZgcc+UAKt5O13Tlpls6fOvjxp/dSYzTIt2MFIf1MYRDEY7d6ye29GUa+tl4q/TC7ulqaw+Q33Mda4d8jGQAHzbyJcvFGjkS8SdMBdOI+P7FYzcKWIt0wAT/z33eWlyb8S3/AkTuOKMEblfTgHRcc2xsEGT+F7PGeiKz4iCtenVP9PQlQayMsJ/geFsHSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbagBmizmxbYiOjp43L/459VWcp+y6LwL4g6BQXNYmU=;
 b=Q2/nn4ewJ3f6a9N/e9NrVj7ejlf7mh89wEh3DQgkQo6zNiaim3XuVNY2DRFMomjOWpaE67Kv9nWMrxg9sH9CbZ5E/knWDBVMivHxGyp8v7Gv/8o2dpYDxAEPTwEIUEd5qpcCnHh4BBD2yKO+Yfu1kVtSrDVzHktJ9WG+iuNh9kk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 Mar 2026 09:21:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 01/10] xen/page_alloc: Extract code for consuming
 claims into inline function
Message-ID: <aak9Cr6ySfc1xEj2@macbook.local>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
 <7dd887bc26830d6c50e5bc2606391963e65285a1.1772098423.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7dd887bc26830d6c50e5bc2606391963e65285a1.1772098423.git.bernhard.kaindl@citrix.com>
X-ClientProxiedBy: MR1P264CA0156.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MN6PR03MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a9535c-df93-4dde-0575-08de7a90366c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	yRt43RM0upJF7Sm1CJOb6/iJa0r15F07nt9XoNw2TB5wnOcy/AjJSlYd523ljW2OClFTBaAP/mlzfpoh9dlV7ElGPRtNHOOpAq10M5qNB6hf9YNKHjeTuX/tpBeL12s0GIwEAEEdxBr4PhJh4pBQHpj3UozckEcHwj69oIqVBDMCzbaPjSuPpe92xPOq54ilF7m90hJYxKJGJCa8s2OxUq00bCNsQuHqi1QcKwn6q8dYg1isRQ3LQvkg51YjSP/pAVnGH3fwbQVvXeqP0isXfyxrRIlo2QXZncEcli80dFqxTFza14eHC2ewPLSCWsGXaCGz+ipCrTDaiznndSAJKGhTy4J27a1fHLWa6FphsR11ClUlxkLEC4XGArJtlLthV1JkcKMpl8GB4kQ0pqP6ftNRmZ9LiqnNyFwAw6/jAtLhjx/xY1FusoOOn7OxXSAz0WB+V2MHjlQUv57S27lNf/+EZjl/0sUaj0ab0OY6LD6bWg5s7FUGnbi0IPdTIQlhfHZ74nlnMyHV3kd0E8MN0ng/2qqWfmWLiIsYdqbLNs+ZDQLgkyfi8tIho1iuWtLjls0BW5Ss9IaAKa6zQl1nNqOPKDPmhx083x/cexhBPvv3NMVVDlv0gqmEDkLwL46DQA2QVE0b8wvVR8yViwleZTrW3Cv02HNeUNqXcu06oroU005aTuJ9WUuU4XeD2wDLuiiK9/fVmTSMBdSRDGVjtOxOjj3d6x84A1+J3Eeibnw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjBuZkFPTk90U0MyNVhIamw4dWxNeVlMalFmSjlHMnJic21OOEorS2tiMERU?=
 =?utf-8?B?S2NYN1BTbXpHeUVMMHRHVTZTdzB3TWh5d3hqRTVGU1lIMTR0T0lXaStoa2hB?=
 =?utf-8?B?T1FvRkNmK1Yybi9EOVBDN3hzV2labGZ1MzJtRkxWZzF3RDhNUVdUMkd4dGxE?=
 =?utf-8?B?OWtGY08wTmFhZWRLQkkvL3lEWkdJaGdqRUhMS05rdGhYTDY5ZWlFK3d4dEhZ?=
 =?utf-8?B?b2o4OTZZV2lKVEhLTlVzYXBEY2plT2VYN2ZhYkFTaStqRWdPQzlyYy9vQ2ti?=
 =?utf-8?B?cTkvb21Jd20zd0kvSVZjTGRVQ3Y3a0Z1NlNCOEhFbnZFcjVJUFR5cFIrcTlO?=
 =?utf-8?B?SWNUdy9hQjhPcmhneGttcmpRTjdOMUxFOU11blVRaWVnQ1RRQXNrRFV4eVBy?=
 =?utf-8?B?K0ZJSk5uMGxsT3NweTdyTVhMOVdkV3J5aEh2RVJNTlR4VzVVOEtkMkVDeEow?=
 =?utf-8?B?cnB1aUNjODFRemh4WXJmWlVPeUJzUEltK1ora2kyN0F1dGg5MFlPa2tpTytn?=
 =?utf-8?B?ai9SWUlsNnlOaWhWVWgyREVmZGdmSXd0UlJIdld3ZjY0R000ZVJBNXE3UUd5?=
 =?utf-8?B?SVNxU2hzUUkzQTR3SUtINXl0VzBweE1GbEF3dHg1MGZkZitCZlRmSUM5V3hF?=
 =?utf-8?B?MmpCODhWemVmY2tYNFNEd1dSMVJLZjJvMWJPVFdUa0RkUWNKL3ZVOFpsRFhE?=
 =?utf-8?B?ZG8wMytkZ0E0elplZ0E1SkJ2NjByc2w0WFNiTWQ0bHFueTFCZXRsSUU0MUxz?=
 =?utf-8?B?T1NmMmNSVGphanpoSjZrODE5SkJpR25HUmFqY1A0d2hCZ0RqclQ1cWJ0UG1i?=
 =?utf-8?B?K0o1TnFPWjFqT1h3L1owQ1IyTEF1LzRueGVEQ015elNLSnFONjZGb2ROSnZz?=
 =?utf-8?B?bFdhMUJMc3FIY3Q4OUR5OGpYUVRPMFNVYWtDKzVaYUFXSWZuUjRZV0theHla?=
 =?utf-8?B?dktPaC9zR0xmUTlJYTg1VHFMVHV3UjNHeFNid2R3SERNc21mMndBa0Z1Qlpq?=
 =?utf-8?B?V2FVK1RhQmlWZWZMNmVQbTdZR2NJdmM4WHJHcnlDbzFhWlFpMnVlMGZubi92?=
 =?utf-8?B?MVdRMm9LdzE4TlVXa3lsbVJ3VkpQRkhuOFlHV0NrOWdxTFRaaGo2SmtVNTVY?=
 =?utf-8?B?cm1ueHdpaWJDbGZHQ1dxNzhFUUhubDc1d2pFeUFmOC9zYklLZ0VhbmZGZVlQ?=
 =?utf-8?B?Uno0TzJzOWVaS2JWeFQ2dCtlNUtxUzNaZDFRS2FMYnQ2LytiWEcvWGhZUWNB?=
 =?utf-8?B?akFUUVZMcEhKbmZ3ZEsxd1dwUmpMTk9SVG1zRWFjc1FXeG5PZlZ1cmpIS0kx?=
 =?utf-8?B?SzlTVG8zc3dGZmQvMTA3SkNqK0VwS3llRmExSkxsZFRLSHlyRGNPbndMVkxR?=
 =?utf-8?B?Szg0VXprRXl1K0RzTzlqUmMybng5TjVpMWFCSktRbnBGTjJaa3B6d2lINUZC?=
 =?utf-8?B?a2pZWlZwVXN1MEVpOTF5QzIwOW5jSkdiOXZ0VVZmM0t5ZlNzZGZwZmhCK002?=
 =?utf-8?B?bHRpWTRKNU9EcjVQMEZyVzEwUkZOSnU3YTIxeTdUV0lGaCtRWndnYThqNHVu?=
 =?utf-8?B?L3MveGQ0VHEzelpZWHdJRWYwNFNQNVVaTnJLdlN0Uk81Y1IzdnpQRC9jalpN?=
 =?utf-8?B?NnVBaklyVTRoelRGdVVyVnRKSVlrTklmTTZ5UGZ1RGtMTWNCK0dpYXpmM2R2?=
 =?utf-8?B?L3Q2UHFGSU9ZYXdMbmllOWx0QkZQejFrWU9XMVk0L2dYT0RQS1BNelQ1SXRJ?=
 =?utf-8?B?bnFzbHpXanBpaVRhbkI4RWNTVko2M2pLdG55Uk9tVXIzQmE5d0hBMTcrdE5j?=
 =?utf-8?B?SWViNEhZSGwyZnNPTy81V0VpZ0JsTHZ6TjV1bUhnSzhxSlYwemhqMDRCQmZx?=
 =?utf-8?B?am54ZXBjeWpoMW9ZNjNDVzRxeGZoclVzanZrczZKOGxIOWdJSHhFWFgxUFRK?=
 =?utf-8?B?MlB2WDVyR3JMV0ZyYUdPUm1nWklHSE1NVEIwRkNQTkd0VGF2eW1rY3ZnUWxW?=
 =?utf-8?B?UVlSVzcxRXB1TnNsbmY1RU04RDkzRS9rajVlNzcybW9Obm1DcGVtc3dRYk0z?=
 =?utf-8?B?RmtySzk3dmR1WUl4WHVvb1JwZHN5am81U1dFdzhrOS9YcURsUWRnb3JUL2lq?=
 =?utf-8?B?cXhxVnpYZDVYL1lUeXNGUHJGWkxUU2huNDJKTWFsSk1pRkxuUktWVFdFRjRL?=
 =?utf-8?B?aThqY1JIYkYyOGhLS0svME1ldW84MTkvci9DUklXb1h4WnNXNDM5eTlrRWk4?=
 =?utf-8?B?UGtCK3FZaU13QjY2ZmN0OUx5UmpMVW5HY1lLc0dJWWduckNnSUU4dHFxdUZh?=
 =?utf-8?B?ZFJUZS9qZW5PbkNJWkV3MXkvV3U3MDJRazRoQ3hjc0NZSlhsMS83Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a9535c-df93-4dde-0575-08de7a90366c
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 08:21:34.3633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kfp0dZsx5ta1uK/kYVc7/Z5RshLat8CWTnqq/Z1/XyqWOg8z0j61R/S+scUrilO/Ci5KLNqDejDrsgQeyUcL+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7670
X-Rspamd-Queue-Id: 8C64120D629
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:dkim,citrix.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 02:29:15PM +0000, Bernhard Kaindl wrote:
> Refactor the claims consumption code in preparation for node-claims.
> Lays the groundwork for adding the consumption of NUMA claims to it.
> 
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
> ---
>  xen/common/page_alloc.c | 56 +++++++++++++++++++++++------------------
>  1 file changed, 31 insertions(+), 25 deletions(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 588b5b99cbc7..6f7f30c64605 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -518,6 +518,34 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
>      return d->tot_pages;
>  }
>  
> +/* Release outstanding claims on the domain, host and later also node */
> +static inline
> +void release_outstanding_claims(struct domain *d, unsigned long release)
> +{
> +    ASSERT(spin_is_locked(&heap_lock));
> +    BUG_ON(outstanding_claims < release);
> +    outstanding_claims -= release;
> +    d->outstanding_pages -= release;
> +}
> +
> +/*
> + * Consume outstanding claimed pages when allocating pages for a domain.
> + * NB. The alloc could (in principle) fail in assign_pages() afterwards. In that
> + * case, the consumption is not reversed, but as claims are used only during
> + * domain build and d is destroyed if the build fails, this has no significance.
> + */
> +static inline
> +void consume_outstanding_claims(struct domain *d, unsigned long allocation)
> +{
> +    if ( !d || !d->outstanding_pages )
> +        return;
> +    ASSERT(spin_is_locked(&heap_lock));
> +
> +    /* Of course, the domain can only release up its outstanding claims */
> +    allocation = min(allocation, d->outstanding_pages + 0UL);
> +    release_outstanding_claims(d, allocation);
> +}
> +
>  int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
>  {
>      int ret = -ENOMEM;
> @@ -535,8 +563,7 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
>      /* pages==0 means "unset" the claim. */
>      if ( pages == 0 )
>      {
> -        outstanding_claims -= d->outstanding_pages;
> -        d->outstanding_pages = 0;
> +        release_outstanding_claims(d, d->outstanding_pages);
>          ret = 0;
>          goto out;
>      }
> @@ -1048,29 +1075,8 @@ static struct page_info *alloc_heap_pages(
>      total_avail_pages -= request;
>      ASSERT(total_avail_pages >= 0);
>  
> -    if ( d && d->outstanding_pages && !(memflags & MEMF_no_refcount) )
> -    {
> -        /*
> -         * Adjust claims in the same locked region where total_avail_pages is
> -         * adjusted, not doing so would lead to a window where the amount of
> -         * free memory (avail - claimed) would be incorrect.

As Jan mentioned, you really need to keep this part of the comment.
Claims had been broken since its introduction because the above was
not respected, and that resulted in the accounting for free pages
being transiently incorrect while an allocation was taking place.

Thanks, Roger.

