Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKr6C0/9pmk7bgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 16:25:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8539B1F2814
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 16:25:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244889.1544245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxRc3-00045q-0p; Tue, 03 Mar 2026 15:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244889.1544245; Tue, 03 Mar 2026 15:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxRc2-00043I-TZ; Tue, 03 Mar 2026 15:24:42 +0000
Received: by outflank-mailman (input) for mailman id 1244889;
 Tue, 03 Mar 2026 15:24:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KsTL=BD=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vxRc2-00043C-A2
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 15:24:42 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 187acde9-1715-11f1-b164-2bf370ae4941;
 Tue, 03 Mar 2026 16:24:41 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB989099.namprd03.prod.outlook.com (2603:10b6:510:3ae::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:24:36 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 15:24:36 +0000
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
X-Inumbo-ID: 187acde9-1715-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZp+5LTLn345tPyV0VqRmi1Xc9zCGhZ8BpqGsOESK9ns4ui18Fl1FGVF9G1XXXzRFxoa+4epxESO6fJDyZVOjY3u76edkoNq8GcFaC8Z1w/UHdZBQ/WWMSATd9ixeJVxw2ErTsW0j9Xu7sPm+LmXjwIIK8/JK0UnG+Z9AE0WTYwaB/smEfzmz76HzIDltMSoVp0v+cgzGIpZ0tpRLjU34iqnuFmj6Uov6+QShSDtioIY9R4E1CTuXsqXdrxeGTt94F70eCwMApRmSKjfhoQOUgAUlt39XNHQmZ+LSYcoDEbkjDkmf/EiFdsHEOAZowio47m0pfNBEWO10LjNZCBFTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKmfsrSHU2A47P2t7ur29OSgAcpnzWZ/Dz6hdWCxs3U=;
 b=lMXqvIOXHGLuMoIHOoyOGi3DoBnQw5+epFyuZ6Mnh4mKoKtG3OymYi5Vn1trT4kqfRdO7oiMFX1Ehf7J3G4kG6sVibJghC6QPtLjnZS2R2SJJVo+s5rJWSmtVYMNtnPj/gT1WyR3YQXVMzMScZYwHHAunp7MXK8bG0a4hD6tKZbq9+GjUsgsBGeOfT7G9JxK+Drv7gRuXmd+ALH/k1vop61HlZZUAF6sl4cOJ+PaQQKuGLKAbyovUzrPykmpJeom3cfQYjTfARWEPogy7siyVX9hIbVSdU5AtU/pO9juU4aGqxF2EOeUsSAbz4+9sh8jT1F+hHHWZOmsdXUt/B61Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKmfsrSHU2A47P2t7ur29OSgAcpnzWZ/Dz6hdWCxs3U=;
 b=xUrN9MoTxdnC7GoU6ug4+u28T+d7LsgmO+nzVWZ+UtX1ShzS7w5VRSAGhHh8IkuW/A3j9F4OmboN6nKkAxRpbWuJqnvTltdyBhAPnKMf9b/DsV0DA3dzswv2esaG3gP1CWSOnrI8GXEB9ItWsa/ai2MI9KvP+i2f8TTWYlcGDa8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e98a89d4-2862-4baf-90d3-7512d0423f5b@citrix.com>
Date: Tue, 3 Mar 2026 15:24:33 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 4/4] tools/tests/x86_emulator: avoid passing NULL to
 memcpy
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?=
 <edwin.torok@citrix.com>
References: <cover.1772189234.git.edwin.torok@citrix.com>
 <340f6a9fc4fdd4216f41e4bbdb1234069322d1c8.1772189234.git.edwin.torok@citrix.com>
 <c1ae770f-a408-45cb-907c-dab200ef5326@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c1ae770f-a408-45cb-907c-dab200ef5326@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0403.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB989099:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c2c0f98-62a0-41df-58d4-08de7938fab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	g+/14XYyt2nObEwikbDp3wQ1eu8bVDgijHNjYjQvIdx7RvyhcbFG7I2EXHLBgzHnizmUtpBAIz3RY/37FraU/MShRIUQWqqRDFas2dfyZRVSmWuZehFEGCgz+CqvS7/RMizDGYegxbx7n55g2/EfvT9ZjHi25jCgyrzGYGlts0FGG7EcbRjeiLkQo78pRmQSfeC09Qi2yNXcWvMvSQN8z4tZ0Ru4WJb9uq83MaYSxc7njifOSJmmTn6A5avpappGrVJvOnev5vrjA2LSIZPyWDS6srQsvLTU10xyjluZFggzZ3EStCBX9WKezcQf9/XiiepYIV8YzzyruOT1KIL7yDnnNy1HBpRMx7KiggDMBn41aLSQR3ATRidbE9tLVqISMu/kT+/XZnK1v4xidWKydXEJmtoB/glTThHXqvHfMeJ9uDQS+3c1zNXW+96JEc7lqvvGiUlRZh5ZAtx8zHXn1OHO//6Z6RJf0kZrGhn6hxjjvxfPadasPPsxIi1HbSiEWUuTqMtVfMg1VJWW1wSzt2Sy1NE1iiHAMebXS4kNfiC7eIVr1O2R6ymg0ednA15lFm1ov06vC0hkBbVN01GXi9OZicQ9k9zQZCB3KsW7I4I4R5QcGYpy67ZJcEDuc8gLmfpDt/r934QIJg/2AW9a0XTNy/bi+QsYMrs4Cuj7vmXWJVTgrQuQc2QMku7KVNL6Hu5+vnLyjaVnO5lY5Xr0itPCcvxuxSqFtlsWw2HeW+g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3hxZ2FZNlFBbFFqR1VBa0NzdlA1Yk13U1ZvdWZvV0pYSUMyelczNUVxMXJi?=
 =?utf-8?B?b0JDK1RXVllacGVVNXBZRlM5bEVMRmJBdkJ0Y3lUeS90cEV5SFpHcnVZME9F?=
 =?utf-8?B?UHIwUWhZK3N0OW5BL0VIUjRQS3gxRlh5UnVGZGwvVVVyWlV1bXFzNERLc2Iv?=
 =?utf-8?B?ZVVOdWd3MmZkMjJ0MllNT0FyTlRVWm5ITlYyRlE1bEJjczJPcnZMWnorZWkx?=
 =?utf-8?B?cHQrTXR1R1hlUEg5cy9ldURGWjVnWWprWERLK0FySGdjNkJPdktpYmIxQis1?=
 =?utf-8?B?REFGLzJXUmluWDZJd1YwQjZVd24wWVdYcG1DR2VwUEFSeUs2Yk0rdDR6L2pD?=
 =?utf-8?B?ZEVZMTZKV2ViV3o1K08yUFd3UFh3b29kU2piTXhpV281c3lIN29uUTBpZExh?=
 =?utf-8?B?OVlEaHNnQ3k4NUllcXRTYUY3OSsraHFZOVlDVTZwOStJQjFrbEt6cWNZaWlF?=
 =?utf-8?B?TW1nTWJsVndBUzk4Y0l2cUE5TndKOG5oSWhCbHQyeDdhQlpxcDVscVpUdjhX?=
 =?utf-8?B?aFQ0TjdCVnJxTnJaU01ERkl6dnhiMjFrTUtnUGhhMmViblh0K1JLV05IWDQ0?=
 =?utf-8?B?ZkJHWUFWVVEzdS93bDRzOFBUR1V1bkdDdTRwK0NERVFycCtKcHNtcmxNS2xh?=
 =?utf-8?B?WjhaV2R5U2JYckR6R2hTcGpiUkRwSHlRVXZldGhYRnZpRk1tbWdkeUxkRHox?=
 =?utf-8?B?RE1WWnRDTC9rc2RwT3lNc1dGcWFFZjZkSjBpMXF4L2poL2tNMEJUOEtGV2sr?=
 =?utf-8?B?MkFnNXpVVlBjd1p0dytrdE1mcG1nd1V5VHBEZlMrZHQ0dXE0RkJEeERLUUpH?=
 =?utf-8?B?Mjh3ZzBPdnYraEF6NXNENnh1TEFsOUtCV3FDTTFTRnJ0UlJmZkg5b3BsbVdy?=
 =?utf-8?B?RnFtNTkyRFhHT1I3Y0FQRU9WMDBLclNpbGdnYTM4Zy9KYThnS1JmUEN0d2dJ?=
 =?utf-8?B?bSt3ek14V2tDbWdJS2lUNTZGWmc4bTY5eVNOd3hIRUVzNWoxM0g3OGpuUzgx?=
 =?utf-8?B?ZllZNXdPRmVvWHVxeTR1R1hXN0dVZlZuOUVpcDlFckZGWVpDT0VtMlhvU045?=
 =?utf-8?B?REhmM1VkdlFqaWt5Qkx0YkU3U3pqdXFoMThPU00vUk1kcG9iSXBQSm9vU1pa?=
 =?utf-8?B?aEtnd2pRc0NEZXBTK2Q2R1Y3bHJnekppRzNMYUszZWZpTEF6aXZXcW95Zkgr?=
 =?utf-8?B?RStaSm9nTlltMDdhNzZCdXVLYmhoYjhuTDAzN1U4TGZzYm5rbnU5bHpWWFEz?=
 =?utf-8?B?RmQrRlJhQndxc0lGTkRzMXFiU1djUk5uUEptODZRbjZ4b0NINmlkUXYzVmVV?=
 =?utf-8?B?VlZFNUFOTlVLT1pDdGdMNzB2dU9LeWY5Y29CNmRaY2FlT0RMcnlITVN6Q1Fs?=
 =?utf-8?B?c2hYcjJldEc1cmRDUGFwQVIwM3E5and6TVA5WGRtTGEzUEY4LzNId3BEZlpY?=
 =?utf-8?B?citWTFJ5WXE1cjdnWmNybEhWYmRtNnZpVDd3N3IzVUorbVZYRGVGYWdNWGxt?=
 =?utf-8?B?bWt0WTIvRzYyekpSWHR6TGUrQnorUnIrL0d0cWhld282OVkrbzNTcHpOQzNJ?=
 =?utf-8?B?TkpFeGxUWDlhWEJHN1NaekxBVzV3d0RFUWRpN3U1ck9NTXZObHU3OWtaVkZi?=
 =?utf-8?B?U0xPbGV6Mm1JajNDM3hTdmlWcktKYUtzTXRuRGFFeEhNdE5TYXc0QWlILzNu?=
 =?utf-8?B?SStnVHdnaGxnRkVmU3NhamQ3M2s1a3RNUDVnSUNBUCt2d1kyNW9vUmkzeVFy?=
 =?utf-8?B?VVI4dUxCOXRMS2VQV2Joa1ROZmM5U2puSndTZ3BIVE9zWFhmU29UTitqZ2JJ?=
 =?utf-8?B?TmIxczRxT0IxQ1c1aUJmd3NmUHdlbnIzNS91RVlSbzNXbHJnV1Rjd1E3Z1Yx?=
 =?utf-8?B?TXFHbUpybUg3VzNqTHV2VHJDUUs2aUJTcmxweXpSWkZmT1hhMHRpNElZVFlC?=
 =?utf-8?B?WGF1cWRnaVI5Ulh2WmxXekJLd0hkL0RiM0N1Ry9VZ1VqOTVDbkR6MCtWRXdF?=
 =?utf-8?B?dE5DRklwaVNsMnpzN05ZZk9ZNzZKVlo1dVp3dTZ4dm5QeTc5RDZCNnhzQ3ZJ?=
 =?utf-8?B?NHpOWEhXKzAxbmtjVHVmaXJVaEI2NzRYQXB0OElHOHI0VHY1TlBvV2RUZEFz?=
 =?utf-8?B?WFkwUEFiVHloVmlWRlVXbHJTRmlRZCtHOVo0TUxvQk5PL25hZHF2U29ncDZT?=
 =?utf-8?B?V25qTmxubTBHdHJIdzJIT25iOVU3ckIrTUVtWGk3WVR3RStiL2txZmVZcElX?=
 =?utf-8?B?ZWJ3VEtUaTlCRGUrVlU4aFg0VitWMU5xWDVuVVVIeEhBSDRXY29tSHFwTmlu?=
 =?utf-8?B?SGpTbFV3ais5b1Q4T0FpRmZNZUkySHQ0Skc5VjFNR3UrV1F0aWoxZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c2c0f98-62a0-41df-58d4-08de7938fab6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:24:36.5301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwL6eSWGOuoPeLZOS5FjzpycNnmkIlhJecCGpLpgrA63/KQEKY0LsLPqlYUEEffnBB1Y2lwmD8Et1qpTIWxrMb6c5XvAkLvEvjnSneOBTQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB989099
X-Rspamd-Queue-Id: 8539B1F2814
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:edwin.torok@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 03/03/2026 2:18 pm, Jan Beulich wrote:
> On 27.02.2026 11:58, Edwin Török wrote:
>> Fixes this `-fsanitize=undefined` error:
>> ```
>> test_x86_emulator.c:614:12: runtime error: null pointer passed as argument 1, which is declared to never be null
>> /usr/include/string.h:44:28: note: nonnull attribute specified here
>> SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior test_x86_emulator.c:614:12
>> ```
>>
>> Although this is more of a grey area: I don't see anything in the
>> standard that'd forbid calling `memset` with NULL and 0,
> There actually is. In the C99 spec clause 2 refers to section 7.1.4, where null
> pointer arguments are excluded. Imo for memcpy() etc exceptions should be made
> for the case where the count is also zero, but sadly nothing like that is there.

C23 does finally make NULL with a zero length be well defined behaviour
for memcpy() and friends, but it's going to be a long time before we can
rely on this properly.

GCC 15 gains __attribute__((nonzero_if_null)) too.

~Andrew

