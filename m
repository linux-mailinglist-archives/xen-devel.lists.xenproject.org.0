Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHU1ELoC+2kbVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 10:58:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B5A4D8336
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 10:58:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301342.1575628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKY5B-00069Y-LG; Wed, 06 May 2026 08:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301342.1575628; Wed, 06 May 2026 08:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKY5B-00066a-IG; Wed, 06 May 2026 08:58:17 +0000
Received: by outflank-mailman (input) for mailman id 1301342;
 Wed, 06 May 2026 08:58:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKY59-00066U-Vx
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 08:58:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKY59-008pHf-Ch
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 10:58:15 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb02a2-bab6-0a2a0a5309dd-0a2a4507e2fc-24
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 10:58:15 +0200
Received: from [52.101.52.40]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb02a5-229c-0a2a45070019-34653428de29-4
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 10:58:14 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB5682.namprd03.prod.outlook.com (2603:10b6:303:94::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 08:58:11 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 08:58:11 +0000
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
 b=gLsRfbpiN6+6haQ15mjdG+ylwRsdoG9mVL2hsVw0hFSHyHgomP1WxusuhSXNt1Laf+P506vCBxKHPAP76k5bgKuhv86ag8cU+Rgu3XqltnOy6KaBNnA5UbRq3TSbyoZUpgs4NVQDPkrQvEy9HMKakPoiWEjwwcgNbD3J2JYjXfgc1HG6OiG0zOtyGBSV7FyIbDrNzk6GA4GheC46YKgFaJ4Nh/2BHS9ohlM5lG+LfleZzV+2I39Prp2ZF6CAFbUAQuo/4/V5pZiH8ltQhwnkhl1gMFD8xkceVme9mcZPU928SynB8H3XXn1WfMmtAd/4KB/Z2iL4YN5FH4bK8Prhtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1bIEWEl09txaJq9NaXywCmuWvzukYda6goVbTYM4oI=;
 b=c0iesZzn/cPne/agN0nm19tdrL/QJvO0po7FeJq/bJHInwni4+Q1IOVL/PyEkYyOG07wx26YS8FkE/2Dkc/T4/HwGMQ9MEPnY90xchwgjXqNc1ZvWztNsV4HbmqO4CrGVJAt/ig3kmQWos260NZwMW8BLCjyMWSfZerq1IPTfE0PgO8kWo2SnnpjDikuOQj1Eo9t/ghcs4REcQXtL6zk8DJpfwFq4tGDk50A1FcJjOm1XIFd9+P7tSxw1xFANunqviYHAEaxGFJ+wJ0bzcK/y7ZEPjc+ITd7cxgtZ9WSLt38uQlp0zn1amAjwtxMsKYBXPyFAld6hpO3k8jVbljH7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1bIEWEl09txaJq9NaXywCmuWvzukYda6goVbTYM4oI=;
 b=gEGAtHdYm1TIyLnGkpp7ozbRVR6oDgprzQuX6KsjiZvNTEqCLyidWVZveuwDrevKwiFCr7H/g1Mpf/e+rbx8U/uzZ7trLj3KxO4aUwSOE67wWFqlWUgrgOcsqOxd4cM1jBfJleo7iHkXYI++yLIwLp3ZifXNhNGayH9jlFnDNiw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 6 May 2026 10:58:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 2/2] iommu/amd-vi: do not zero IOMMU MMIO region
Message-ID: <afsCn28tVltkg0u5@macbook.local>
References: <20260506073719.40075-1-roger.pau@citrix.com>
 <20260506073719.40075-3-roger.pau@citrix.com>
 <41ec5134-b117-47ee-8e59-682ac1e4a69f@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41ec5134-b117-47ee-8e59-682ac1e4a69f@citrix.com>
X-ClientProxiedBy: MR1P264CA0128.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::10) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB5682:EE_
X-MS-Office365-Filtering-Correlation-Id: a14f0422-c639-49d2-c5b8-08deab4d99c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MVA+Vrys6eAnkKWelsHDW/7dA4EQw3yBYCkeK56kE9/qtkqL+XcYHzr4mbWGMfIplg+OKeUNEg5+v227NhNp/k08wstCDqanKVWkBJvVvS6jk7ldMlVdfxsYLZJ2mmajLcifDfYapHvO5yS4P5pdxDuDwbev6LeEn5Pa5P3tkSv/Rk+2Mm7dR5mCdFBa4Bn5jlx3Qo42sXanGLpyOcR0WTHdaW7iHXf3hep5BWXgurG72pKZEgLAfCqXq/vsErsm2/TOZTJGyR/N5VSMZNAL/S0xfSmndkH35WHyB+OYkOCzzHG29GOlI4Kpjih6UGmh/Qdd626TgrkvTjLjj7k28hkCKLlY9OrQNmzS6AdnSHfPYpFwH2wb1M231KIPsDkC5h7cpLfkozgrYtBSbs75VJmSPn+brKfN0XSRiuaRJB7LkOjmfiADRKkMrAdlGvjCdKc9HEr3YzdXl/cBXrthbIrqHeey/QKwxZCug+GYRFz7SKKWGwA/t3ksS9QGpYUEdX4UUWLVJw8z8cnvxu78/asLxIq4ttBMn96Pk/XdaGd7Ijw79ucRnsj5qAmmQeBnFsWlGNHYs7FonTiBo7MnyJEtLXQWqZW732tc10xHgdsUdtNbj/n0bnRw14Qro9MYr4ftIq/8Jww1vLVe3VOmuZpCXPOex3ciOGmm1vsbszmzo6aG/hnlxPF/Rdc0e5ER
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXM5alNXczBiMFZFR0E3REd5T2g0a3NuUldWRDF6ZktMUklrdWZRdlpWd0JO?=
 =?utf-8?B?VzUzdUp4Nys4WVhVV1l6NjFrQjB2ZFlsOG4zcDRYNXZyT2liUjF3LzU3S2lT?=
 =?utf-8?B?a3NQSTZDRVdybWZKVXBpNk1YZmMrTEtNVStyREhEaU91aVpSUHJZZGVmYURX?=
 =?utf-8?B?WlNyLzREWHZBbmo2QS83M2tlYTJtNHJjbmFFdzc3aWRsSkRZR0hHQ0FXc0J1?=
 =?utf-8?B?ejI1ak96OXByTHduMFV2bzVyZ21lN3RNMGZoNTA0MDJtQ2hsVVROM2t0WDhJ?=
 =?utf-8?B?M1o1Y0ZQSXViTncxUHBheUVYTVdGSGRueGtGNnhnWTVJdkpLb2RqbFA5ZFZU?=
 =?utf-8?B?QXFNeFZxSW9laS9RUFozSkpxdEFZZVlubnNjZ0J0SzdVOVNYKzF5MTJJek42?=
 =?utf-8?B?Yi9ESVY4bC84TU5Ta01YV2RndFRoNDE4bW9JRTRVcFFrU01sR3hwUDB0Y2lv?=
 =?utf-8?B?WlE3UzhXenFDWDRiUDJDWlpiekVJckNmNkl6c3lrOFNEd3h4bXhqSGxGaUQw?=
 =?utf-8?B?MmMrMW9kS0VDNmpHeFlCT0ZLL0lwdnhqdW5oUGREY3F6WDJSbnNFKytybU4y?=
 =?utf-8?B?Z0l3OE9wcHF1UGRFalkrOTNlaWg3OVNjOGsxTDVLMW5wVVhLTG8rTHhreFNV?=
 =?utf-8?B?RENxWjFiM2FZdW5IZ2JxWmQ1SExFWktaek5rVjlqWVYzRVYwUktadlJ5eGVC?=
 =?utf-8?B?cFFNRDNFL0pDNVZWSUlvbXhaY01XeFIybzMyMk9XUWtTVEJCRUMyTWJ5U0xX?=
 =?utf-8?B?ckRubkdqT0ZlYkRpQjBIaEUwSnlNRHNmVzdGbUhwRTZVSTdUbVBkUk81NFhw?=
 =?utf-8?B?UE9VTlZkVHhTZzdHR3kvMVJJN2xSNTNrMllOUHM3elhVUXo5eFZpRUJPdnVO?=
 =?utf-8?B?T3J3T3EvL2xjT2dVMXM1eWZLQzcvQjVFV2tEM29KRHpyeHFPZkgvVUFLdHQr?=
 =?utf-8?B?dHllSEE4UkJreVJKYmtUcCt3bXo2QmJWUm12MkFQUXFIQ1hneVE5ZGJTc0V1?=
 =?utf-8?B?a1ptV01WTkpNN2dVdElUZEc5R08vZ0xDSXhZRjZiREd4bHBJOGFhM1VVYjVO?=
 =?utf-8?B?NUU0ZkVLNklTVzFybENJVHdYQVc0RFN2REREaGdHZGEvYzJRa01salNzU2Zk?=
 =?utf-8?B?YUNtNzcvQUgwOHZYOXZvclVFbVBDQ0l3WFZyaXpUanhhRmgxTFBpbjhPd1oy?=
 =?utf-8?B?SHNSUUk3VVRkUDJMLzlPbGx0TVZwcHc0bUUyaUtNSk1Vaklkdm11K0dFTVU4?=
 =?utf-8?B?Nkp3REx6OE9Nb0NtbUFLc0ZYNEtJNkhDRUV4YUNoWmdjRFcyRUxBRTdrOVov?=
 =?utf-8?B?Mlc5L3FSMWJaZVYrUEZyOVoySUpmeHd4VW9rZ1VBRnptQ2ppaGdlY09PVlBw?=
 =?utf-8?B?ZThYYTRyN1c5M3hqVmdqR1FTeUZSVlRMbGVYTUlOblBDUVZrd3NBTE1SUGta?=
 =?utf-8?B?d0pZUEwxb0t2V2xnZHNBSUw3d2tLaitZOW5iYlpubXRQN2x6THJOTFhJeW5m?=
 =?utf-8?B?RjF6QUlSU25LaDdKWmdvQzRURy91VWc2Q1RnQWR6ZDM4MGxXZThkQXdrUWhC?=
 =?utf-8?B?dGxyam1tZ3JQTkxLOHhlald1MGpyVm5GT04rSGwxWU0rLzhnUTEzdS9uaE9W?=
 =?utf-8?B?SG9nMEZrOWtzblZSS2FBSC83MFg1Z2dHclkvKzdXTlY2OUF6U2kzOEprRVZn?=
 =?utf-8?B?NDhaRW93RmRBTXpYUFdxRmo0SmRuUWhQdkNHTVFYOGZlNU5pRTI2UStHekty?=
 =?utf-8?B?Rk1aVDdUL25VY1dmRkcwQURsK0VpcVpFWW1nd0EzWUdpSlVJTkNmUUxVR2FZ?=
 =?utf-8?B?bE4xWjI3SkhFSlhIWnZ3NHN6V0gvRVd2SVdhcW5tWXdwQUJNYUdXRnpQd2M1?=
 =?utf-8?B?UlNxWlVQLzNlN2tzMmRzenVmOVR4YjlHaXJCU3RZdXdyQ0J0a05zNFMxRUxn?=
 =?utf-8?B?d1hoY0psb3VuR2tNZUJkSDZlbkdhSEFjaGdLdktkVWJXZDlXM05zUmdFUTlB?=
 =?utf-8?B?dG1EL096emxyaGx6QmV2MThGNnlKVW9JV0Y1d2xtYXgzeENqbHRVaHhDZDhE?=
 =?utf-8?B?WXhzTVEwTDBvNldRL0I4eTZwZkF0dStVcDM2ZHNaYWx2OEI0UEdzNVVSVTVF?=
 =?utf-8?B?WWRra3RGQlptZmw3N3BHZUlPRWVaaVNYeDhyUTdGd2pEZzJlWTI2ZTM0ZE1E?=
 =?utf-8?B?bEszMFoyR25XUDl4Tm44a2JENjZNQ0FEdGlsVnpNNENteVo2bEdtYmRmMStG?=
 =?utf-8?B?UGR0SFVIak5vN1JkUGs4bGRMaXZ1UTZ2T2N2YW5GcExVREl1UWx5cERydmgr?=
 =?utf-8?B?dE1Ic2czOFJkazF4TFJ3aU0wWVBWVEs3M0dmOHZ3RS9UMEtRbnI1Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a14f0422-c639-49d2-c5b8-08deab4d99c4
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:58:11.5827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fkvxs1/DJbIIRqy8KdVVYa6MHk5X12gV7+qXnGY0O3XIboy32AFLOv4UHUnRTb/b643F4LmIYov/RvtjSU9Kxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5682
X-purgate-ID: tlsNG-ef75cf/1778057895-1585EC48-13A1DBBE/0/0
X-purgate-type: clean
X-purgate-size: 3020
X-Rspamd-Queue-Id: A7B5A4D8336
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On Wed, May 06, 2026 at 09:20:07AM +0100, Andrew Cooper wrote:
> On 06/05/2026 8:37 am, Roger Pau Monne wrote:
> > Attempting to memset the whole IOMMU MMIO region to zero is dangerous to
> > say the least.  We don't know what registers might be there, neither what
> > values might be safe for those registers.
> 
> Minor grammar.  "there, nor which values".
> 
> > On a forthcoming platform doing
> > the zeroing of the MMIO region can put the IOMMU in a broken state,
> 
> "does put"
> 
> > which is not recovered by the IOMMU initialization procedure in Xen.
> 
> "recoverable".
> 
> > diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
> > index 76ae78e5ea53..8bf5ca4de18f 100644
> > --- a/xen/drivers/passthrough/amd/iommu_init.c
> > +++ b/xen/drivers/passthrough/amd/iommu_init.c
> > @@ -1367,11 +1355,14 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
> >  {
> >      int rc = alloc_ivrs_mappings(iommu->sbdf.seg);
> >  
> > -    if ( !rc )
> > -        rc = map_iommu_mmio_region(iommu);
> >      if ( rc )
> >          return rc;
> >  
> > +    iommu->mmio_base = ioremap(iommu->mmio_base_phys,
> > +                               IOMMU_MMIO_REGION_LENGTH);
> > +    if ( !iommu->mmio_base )
> > +        return -ENOMEM;
> > +
> >      get_iommu_features(iommu);
> >  
> >      /*
> > @@ -1381,6 +1372,11 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
> >      if ( amd_iommu_max_paging_mode < amd_iommu_min_paging_mode )
> >          return -ERANGE;
> >  
> > +    /* Read current control register and forcefully disable the IOMMU. */
> > +    iommu->ctrl.raw = readq(iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
> > +    disable_iommu(iommu, true);
> > +    iommu->ctrl.raw = 0;
> > +
> >      return 0;
> >  } 
> 
> These two things are unrelated at want splitting into separate patches
> at a minimum.  The removal of memset() critically needs backporting.

But is it safe to backport the memset without also backporting the
disabling side?  We might then be dealing with an enabled IOMMU which
could lead to all sorts of fun.

> As for disabling the IOMMU, I'm not certain it's wise.
> 
> Linux can already "bring up" an already-live IOMMU and Xen needs to gain
> this ability in due course.  This is mainly for supporting PreBoot DMA
> Protection, but also for things like the kexec environment.

Note that Linux (when not booted from kdump) will do a similar sequence of
what I'm attempting to do here for Xen and will call iommu_disable()
ahead of attempting to enable the IOMMU.

I understand that when Xen supports kdump or preboot DMA protection we
would need to be more careful there, but going from zeroing the whole
MMIO area (which disables everything) to not doing any kind of
disabling is IMO a dangerous approach, and I would rather backport a
change that at least attempts to make sure the IOMMU is disabled.

Thanks, Roger.

