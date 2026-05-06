Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHX2KkNy+2lgbQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 18:54:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EFD4DE623
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 18:54:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301975.1576083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKfVh-0002Fy-PU; Wed, 06 May 2026 16:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301975.1576083; Wed, 06 May 2026 16:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKfVh-0002Dm-MM; Wed, 06 May 2026 16:54:09 +0000
Received: by outflank-mailman (input) for mailman id 1301975;
 Wed, 06 May 2026 16:54:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wKfVg-0002De-4J
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 16:54:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKfVe-003QUT-Qi
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 18:54:06 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fb7227-5cb7-0a2a0a5109dd-0a2a4503dbda-26
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 18:54:06 +0200
Received: from [52.101.201.46]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fb722c-672d-0a2a45030019-3465c92e5e63-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 18:54:06 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH2PR03MB8088.namprd03.prod.outlook.com (2603:10b6:610:280::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 16:54:01 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 16:54:01 +0000
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
 b=SOg3qYpEaQ9V2sj1DPcD3Idmjr1HhjPaueAJVWq16aoFdZtyYKfAqWJySH76/KMMAdb2q6yBRM/N41bdVz29QjgP8YmUVPaPQtNpGxAN+bGvGl2eaH9OoQfO6itaj/6iy3nb/nddeEhj2UNVWRxKx7lYWRjMeXhTl17W3U4YQn84MdHOh7/A6qqQp3PDQIgFwgIeTdOXV2e21yIyHQFY1bjqlhnI88ZuI42GcLzk0CXOdM3IjszfClx6zwxABzobYTSLEn4SNn3crv0eR6/rCp1qUhHrP2jBKRHfrsQ7emw9TInG7kJeS87tIqxgnpNSzOY0Vy46CmtP7RBgWxfnRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llQc4PMsTH1vgzwEirpFN2JeAJBSPqmipiQTEKQgLlg=;
 b=oxBSSxdF40h0loWqoDmz/YGLVdXQ/+gPjyj127BzxcALD3da0X5JGPjQBPk95HYWtpmuZ1SVsAx3KPNVvZcAZVxdhtg6d5ENDT0qDsDF1khfm6BFbbjOJCw7ZHaZcm2jtIwRl/l6+CZ5JHFWKSGiWnnLK8JDJ0Bkopxew8KFPzKUojdt9UfhYMUwASbJkgNvHc7bmfwFOBe/cNRAhVwJzNkfFcLpl38z/dxhZac5RVtHJqt/vGw6E4qwtDW6bFYs+XdPU2FdOgq6PbQgObTL3sO+FQruhks5HWZc0B3eim1kxHYE09HE024DAYpdClVr/xJ5o2E8eOBI1PxnBNgPDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llQc4PMsTH1vgzwEirpFN2JeAJBSPqmipiQTEKQgLlg=;
 b=YWbs2Y2eW2/rR3VMej3GeilvLNQcKyAzZkXpzsDHXgtBu00iEdEfD0vajTkaFn/ZeP9Jvlz0OnXWSzym8WyZqKn3MxeRKaRk8VxqJZDGeaVl52cD5hGG3PfFbj6CyZuOSwpXLT9b/56fgaZhcbOuCzZuA5SGAjdjznG+NgzZfXQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f852b896-5d18-4adb-97fe-c707a4ce8831@citrix.com>
Date: Wed, 6 May 2026 17:53:57 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3] iommu/amd-vi: do not zero IOMMU MMIO region
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260506165157.68567-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260506165157.68567-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0504.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH2PR03MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: 32acbd84-66bb-4ab5-331e-08deab9012a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sTLbdwRjbwaFt089XTH20ji2ZTjZcoAJWHESW4jqpg4sgbBYzptlcLEyJ4eLlHJk5EaD/spDBfftNmH/qhwzJFMe3X6ETGXbcpsA1DoRpPJxJnD/TnvtFx3MbkSyHdB/CjJ/bFr8eKZ0ZPggUQRizVLkS3Y+4VBC0rpifeZCBlTTFUXZGPe2mSAxZNkTj+MYTwDa84f9RHjjVXlT47Gl2IfV+Movmu3ktbv58MoZy6n4pCP/JPWoz1buBC1vAp7aQUmSJsGoyAIgpR4mv3DHKQmGtROeN8CmYxerMlTK1HMjBoQMkq7uhUnyJ+Jpr6CaaQ/MlM9RHPTQKJQ44O0YL+7FuKUit718kMAzzBrjCa9dzSIRlgzCOYG9NrsGul0zdG3TYfllHIUl2079nG1wJmeP104VGrqQwi++p6dqglx/8a+uEzBBVNzZtqC5MYTqL9nYpweJsnwquMNCXfhHMFfntQc28lxxeqe/xmnXT3C8swNo60Hj4vysu6jOp2p5vVvh3nEW96MoTVv/KquwtC+jk51/AbGZoAh/NiiyVartUA7W0q5czyfyI3dIXzSREsCUi1i/pGaOgCrQHWATLk7phBJ7CmORHsRx1C3nTb4BH/hlt1UtDKKzfHX19pQNBld7JDgSl4sFCpmIGOwiVlZ6/1rMtd6gT1miKqUvKciKx0Eej+v6FQvUyDQLf9/1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVVJNGxTS0tBSDdUZll4RHduamNkR1dhS21YUTFpSjFybXhkM25xUWwxZmI0?=
 =?utf-8?B?d0RHL2FsQUFmZ08yMnZSOGFLSlZuUHdWZUY4ZUZ3VFVGUG5JYjQwWG8yTDdm?=
 =?utf-8?B?UlI4OUlPQmp1TS9vY3FEVjlHcUFKVWNHVU1Wa0x5UkYzNy9KSUZDR2VCTzk4?=
 =?utf-8?B?NWN1dHBlWnlXdWV0Z3l1SGd3YUErZVc5c3FCQ29kUmp6TVA2UWwyMXNnRWtx?=
 =?utf-8?B?VTIzRjVTeUJyQWtNMUx0SHByZVJWdjJ5cHZxSGdGTm9scjBRMTJMVWtxVEE1?=
 =?utf-8?B?QlpLdzVDemkwemtDbGE2cU1BY0FMbUpYZzJKNVpNWVNVdVhiSWs4V2MwSXF0?=
 =?utf-8?B?by81eERaYytRYTNQN2N5dFJlSStWV3NuR0VuNXgvSzZ4TXhJRTZrQWxJRkND?=
 =?utf-8?B?TmtheGRjK202cFB5Q2VJdDFoaTM4ZGFDMHhIUWVPSUlPbEZpRzl5SktLSXB2?=
 =?utf-8?B?WVhpNXVlVStxbXRDTElxdVRaMG9VTmpQSktNNmI2NmFwSnJaQlByekRKcUF4?=
 =?utf-8?B?d0hCSXR0YlVxSVIxNjlKQ3lYWC9vVUxUczF2V3ArU1c0T0VsYkE3Y3lwTmlP?=
 =?utf-8?B?SGgwZzdnMTF6cXRZOWJMYUV2azZGUEdkMzJPU2hJRTB6Q0lLblZidzJ0emZl?=
 =?utf-8?B?Ty9zVlZUMVc1a0VkNGpIeEhzVEhVTHlXem4yMjFrVFNFK0RPdmhNRkdZOXBL?=
 =?utf-8?B?RW9tUXM1eXJSdVFGOG5uTVRNdW91TWgxcFNkSmkwQ3VNNDdqVDZ3dFBKcjBR?=
 =?utf-8?B?ZVM2d1VEbDZYWUZuRlQxOEFUaDRYbGc4UlNZREJldWlzYUdhQThiN1JDRytG?=
 =?utf-8?B?NmlsMjk3OXI2MndwSi8xM3hZRUh5U1p5dFhPb3dyR2d3VGdhZEdUWENVRG1C?=
 =?utf-8?B?Ykt1KzNaMCs0WTY1UTFwdW9JZnhOVStDeERzclFZT2lrb0c5eFQ4eU5sV3hW?=
 =?utf-8?B?cWhlUkxHRnRiQnVPNTdSZ0IvTG5XSWNLVlNNSmdIbWE4YUw1MHhrRVpIMjd1?=
 =?utf-8?B?Zjc3eGNlek91WGtDRVA3RXhsdldFWTZGcVhmeGE5Wkt0NE16djYwaXlCaTVy?=
 =?utf-8?B?OUNyZVVaZGNJZXpCNEtrRVVyQ2tRVE5NZTRZaVcvVWpONk82SkV1MzhwbEUr?=
 =?utf-8?B?Nm9CV09GeVVqTzdWUktZeW9WKzVDUUFlcUsxTnB3YkVrcUhhS2RCbnR3MFlO?=
 =?utf-8?B?THZkQ1FZalhJWlFmR05JOGloam5TclVLT21zS0RtaW55Q1VEWVRFckhYSzZp?=
 =?utf-8?B?dWdYR1l0SFdFcUFwUVIvSEMxbFo1RWVIZDIwWXBHOURmMHp1emQ2Y2c3RVM5?=
 =?utf-8?B?SjROUVgyQmVrODJKYytZNGZENkt6d2N1SUIvZmoxNkxmVlgzU080SGxiMHhU?=
 =?utf-8?B?SkpLYjlYUEFocVYvTThqR0d4SVVhdUVxYUVlN2x4WkdoTVNMUit3U1NlSm83?=
 =?utf-8?B?T0lQRS9DWkR6WmVXOGNXaTIyT0xidEh6TmtTdjNpOEtNZVJqZTd4TU5ROCti?=
 =?utf-8?B?bGc0Rnp4akg0VUJmUVIyMktrendhWWc1WncyWmZHTEl4N1dKYnVKSGxLM0ty?=
 =?utf-8?B?bmxla0Fvb3hsZHd3cHMxeFQ4TklIRzVIbGROdFVITnlBU1B3UDFPN0ppeCtv?=
 =?utf-8?B?WGl2c2EvUStEeS9wQk9WSlpjUFdzcFJ4em9oSGFDUU5TR2hobU5hZTloblZr?=
 =?utf-8?B?WFoxY1pSa2MvSlNPcGhxUnZFQzN2eWlyK1NXMVIrMzBTUWJMOGU5QWU5bzh6?=
 =?utf-8?B?aXVXYmRqQXRvRTBCK2RleEFhUHdKM1BNKzhTZDU4VG9nZmhnNlloYzRQTWI5?=
 =?utf-8?B?U1o1RldYZjF4SmhsR1NTQlF0b3hFYmwwNS81cXl4dUl2aGhMeHBZWG1yVkJV?=
 =?utf-8?B?M3VoUFVscENBWENySldYRkRBdklGU1VNRWpSR3A5Q1NWbzI5VVlpRTA4Zzcz?=
 =?utf-8?B?MnNkTWlqaFg3YXVWbjAyb1kwUjRjMk90SnEwMERMa1BmMkhTSW1qMXIxRmZv?=
 =?utf-8?B?RlZ5c25YYVBIeHhKbVRNcUI1WVJmL2JuNFh4VUIyS2lYRHl4QjdlcWV3K1VM?=
 =?utf-8?B?cGpGTXFZbVFXZkdCajVCZHBsL3ZxTForbWxjSi9TeTVIeXdEcWNib3RpVUh4?=
 =?utf-8?B?RW1wV0dQWC9RT3AyaG1NdWtsTkhDSFlRaTl2MXZ3UjJFZTdPZllpSlIvZDhp?=
 =?utf-8?B?T0dGbUhjK1NkV2lrZTRIMm5TTlNCbmZsajJPbDhQRVg5R2FGcmtHQzlnV0c0?=
 =?utf-8?B?b2FFQklsbnYyL051RGtSWHRldUNjNC9OMjl4b0kxaW5ZeDlCL01Td3lpNWJH?=
 =?utf-8?B?WlI5Q2MwTmZRdG12N2Vqd0U2Q2ZHbGV4TzM0bWZjUDNEWXJWRHF3cGZ3UkVh?=
 =?utf-8?Q?bvXFifKyOTO0b7r4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32acbd84-66bb-4ab5-331e-08deab9012a9
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 16:54:01.3686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BLRppxnuhHWflhrljMx5V3rQY7tGeQgfAPsMrhUydnqb4d8OmaOSSGn3UmYCGMtwOp/SMXaubT3UU/iPQ1Axoicqqv0qcpBKawYbD/Ojmis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB8088
X-purgate-ID: tlsNG-33051d/1778086446-38975938-1015D56E/0/0
X-purgate-type: clean
X-purgate-size: 1055
X-Rspamd-Queue-Id: 21EFD4DE623
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
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

On 06/05/2026 5:51 pm, Roger Pau Monne wrote:
> Attempting to memset the whole IOMMU MMIO region to zero is dangerous to
> say the least.  We don't know what registers might be there, nor which

what->which

> values might be safe for those registers.  On a forthcoming platform doing
> the zeroing of the MMIO region does put the IOMMU in a broken state, which
> is not recoverable by the IOMMU initialization procedure in Xen.
>
> Instead just zero the control register, which mimics the current behavior
> with regards to how the control register is handled, and ensures the IOMU
> setup is done with the unit disabled.  This approach will need revisiting
> in order to support Preboot DMA Protection.
>
> Fold map_iommu_mmio_region() into its only caller, as the function body is
> just an ioremap() call after the removal of the memset().
>
> Fixes: 0700c962ac2d ("Add AMD IOMMU support into hypervisor")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper@citrix.com>

Thanks.

