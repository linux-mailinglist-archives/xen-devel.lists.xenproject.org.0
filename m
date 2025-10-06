Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C7BBBDDE8
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 13:30:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138119.1473884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5jPr-0005Bz-TG; Mon, 06 Oct 2025 11:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138119.1473884; Mon, 06 Oct 2025 11:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5jPr-000591-Pv; Mon, 06 Oct 2025 11:30:07 +0000
Received: by outflank-mailman (input) for mailman id 1138119;
 Mon, 06 Oct 2025 11:30:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hel7=4P=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v5jPp-0004C7-Pp
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 11:30:05 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca811624-a2a7-11f0-9809-7dc792cee155;
 Mon, 06 Oct 2025 13:30:00 +0200 (CEST)
Received: from BN1PR10CA0016.namprd10.prod.outlook.com (2603:10b6:408:e0::21)
 by BN7PPF5D27497F1.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Mon, 6 Oct
 2025 11:29:51 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:408:e0:cafe::71) by BN1PR10CA0016.outlook.office365.com
 (2603:10b6:408:e0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 11:29:51 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Mon, 6 Oct 2025 11:29:51 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 6 Oct
 2025 04:29:50 -0700
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
X-Inumbo-ID: ca811624-a2a7-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x54I1ZAhRTO0GFHXL6N4QXvOXeq+OoJ9PgXA8i5OfswsLnp5sRnfHNRer0QODB6NiXfCC+gd7HyRpIEGj7R3CJZgnDJ6nBWbpFXTO3m5PrH0bMuuuFlgMIN50NbwIPlboqGQuq20QgSniYUWDZGrv6LrIrJJNSIwArYzmLLgGoxLkiu84mGf51U0AP3u3bt6Qt46pVat0uDhLfpey5zCWuOeFcEOJv+hlYnx95SFpzrIug7F4oj7MBdZpSjqMyTdgNw8w4740a6RhBB3MBR0lBt6UJ38wpqFoJhVm/TeToguElBzIViBehDPGN5x+XcgApw6/2ioj75ScbOdkshutA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8SPXQIfqorhJ4I3lcB3mQLCmYorHd5RZYtwTE4aoEE=;
 b=QlTTu0jW03yA5XRQ12LvhmpS5xW2Hq8BEfI8htNL1mVhKKoDsc5jzc8NR9tmmvvtdG4cI76DbnHT1Yaxs/pOkrG4x1iFmQqRBd6eLrt03yfJqdFjcBT2Q3KgTur+eGKeFzPyyjCovssnhLwgQT4Z9abuO7i/kdjtaRTPV+z54LTVirrs+O90c9NPWFAZErDAwKgOY/3+pCMDwyX6XqKhTFW4p9XzIkGEk1ECPMFUB54dA4ZeYOUR1yvzHt+gAhebC4UhDoGo6OOK0H9vqM+nca/vLU/8c4fxyCxVnRNQd5Rlb/MXF88CQuXl49Ydu1PpPzlJP/Y2tc8fQKBRwP/HQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8SPXQIfqorhJ4I3lcB3mQLCmYorHd5RZYtwTE4aoEE=;
 b=OJes5Joa96gDnGl5EDJxQgsLcIsMZnNrFYbRlYfBt/+wBHmE+fnzWxQmxtUdgmpm96F26mP1M8O+ULgvU53z+bpNzy3Ov7XjAqCexHyKOeP/tBCG1eZQkaqPydeMoah/fzwC9cd/Zzjdlpu5LM4P0S7bkgDORium3FMCf2XcEy8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 6 Oct 2025 13:29:49 +0200
Message-ID: <DDB7DOIV02H0.3P4Y4VQVY1HWZ@amd.com>
CC: Jan Beulich <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH] x86: Add missing forward declaration and include to
 hvm/svm/vmcb.h
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20251006104608.12149-1-alejandro.garciavallejo@amd.com>
 <588656ba-dabf-42f2-941f-6cc017961271@citrix.com>
In-Reply-To: <588656ba-dabf-42f2-941f-6cc017961271@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|BN7PPF5D27497F1:EE_
X-MS-Office365-Filtering-Correlation-Id: bbbfc79c-88ef-4741-a84e-08de04cbaa56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|30052699003|82310400026|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VlBBdnhZVmU3TEN3ZDB3NjE0WnVJbDNIZjNhcmZWa0d5bHVOQjhHenpEWjVD?=
 =?utf-8?B?RGtuQlVRbXo4NS8rS1hPMExlWitoT1lUZmM5NDlnTWZUb1ZkcGxlTVN2WTFY?=
 =?utf-8?B?OUo3Wnoxb0NSRmFLWVpZNVhtSzVrRnNmSXNjMXl0ZERoN01JZFNCWTJ5SHpK?=
 =?utf-8?B?UUxZazNmRytNTDdFMUhuVmZjSDdad3dTN3VlT2pRcG1neTM2NDNJSVBBWkgz?=
 =?utf-8?B?SEZOVmsrYUlweFpPSk9sR1F3eXRpVlZVd09LV1d2NCtJVFFzM1IxSDY4L3JH?=
 =?utf-8?B?cDJ6M2tsQXZ2WmNJdmdkd2wrNGExTVBQSndLaytLL2tnWUNpZ1RhMWljbUhx?=
 =?utf-8?B?UUZUcGRVWGZnbDNsck9FdVVpRVo4OFM1QWZpTmlkanh1WC9RRHA3NVlEWERF?=
 =?utf-8?B?TWF1UHdvZ3hPSTlubGZzQ1djN0xjMVBkQm9Gb0hoZTdXT3NlaUpITlRPZjJy?=
 =?utf-8?B?MHNFYmVGeHFJKzNjSUNuZng0bG1mUjFxQ3QwOVZob1JneGVTdmNVWHVYcldO?=
 =?utf-8?B?RTJIdEIxamo1cmt4YjFQNE5UL2pWVFkvdTVXMW1DMjNDeG90N0ZpSm9POWw1?=
 =?utf-8?B?STB6b254UVNNWnFVSnI1SXp6cUdlK3htYWxpazZNVXpFdDlCd0VvS0lVMnUw?=
 =?utf-8?B?Y3BkSjNNM3RHS01iSTA2cFRmVk5scFNJR2tsVEpBYjJBSzczQlU2d21pRm1J?=
 =?utf-8?B?WEs3c1NpTU9JdXdLaU1NdUd5YW1sSUY1SDRCQWZoVk10V2MvU1hRcHBuaHZk?=
 =?utf-8?B?TFZCNzJtS3lTTFFSMUpIOGw2QTNtbG03Ujk5alhrakFpalI3cGttelFVZ2t1?=
 =?utf-8?B?MC9YQzBITWhCUzU5WkdWNHdxalJVOXhYRHNhWGovRzJhQkVZOEsxVGtNVlNi?=
 =?utf-8?B?Qyt0S1Fodm5TZzFTeFBvR0UwNnVESW5vRWRTUDFkQ1hoUWZ5UkNKbFhVdDVv?=
 =?utf-8?B?RVpFZ05sSEZ2MmxDLzM2cU5EYjBwYWxjSWRlKzJjRStDTi9Fd09VWlpwVW0r?=
 =?utf-8?B?eFl3bjFBanJMdm1mOURUaDE1MFFpdWlnWHNtUmp5RzQvL3JySjhlcnJmVVNo?=
 =?utf-8?B?UkNYQk05Y0FqVFhKT2dTMDBnbmg5UTU4Ri9ZbkRqMTVBQlNKRy9hVXNPRjRr?=
 =?utf-8?B?c0VZaXl2SURNZXpITnF5SkZubkVNZnorM2FaWmlORjJQQ1dPQnJWQ2ZZTHNT?=
 =?utf-8?B?aW5pQ0RLYmhZdG1pbHVSMUUvZTlDeTFuN1d1QVhoVGlneGNEYmpidzBkRnVV?=
 =?utf-8?B?Ny96NWhKeW52UlhnR3UzNW1RNElMNGVBTU9Gb25raUhrcjFubXIxVWFMNTNk?=
 =?utf-8?B?c2F5MU9TUkJjN1VpNitPbEVOWUxyNWpja2YxbGp6UVhaeDJVOVJXd21xOURG?=
 =?utf-8?B?aVN3MzJRU25XcDk3SnloYU1tQm9BbjlaaWNQcXNDaDAvNzUyMnNzMWNJNkRs?=
 =?utf-8?B?aHVYc0RqbVRJcTlKSjJMbVErT0d5blAxUkJxY2FHVE1qenJsQ0JZWXd2WUZm?=
 =?utf-8?B?WVF6WTBJMmlnaFJ0WDNTRXIrbUdRNzV1dWdtQ0VYZktkRW8rNEg3SG5MSFAx?=
 =?utf-8?B?N3I5blVrcSt0aXlkV0VmRWRmY3ExeXg1Wm1NSSszbjVVbmtXNFozekRWM3p4?=
 =?utf-8?B?b1VhZG1ldGdSMk0wMFNhazdMell5ZXV3UmxzSFFrb0I2WXhJLzk0Q2IxaVhz?=
 =?utf-8?B?SWRLazFpeWRpRWh1VEpPTnh3MTRsN2U3RnE2UW5JSFFWenR0cERMd1BEVGRl?=
 =?utf-8?B?b2h4STVEZ0ZydWg0QlVLVmpyMm5keGhiUC9wS2NIQXpWc2d0WHhGcThqTGxN?=
 =?utf-8?B?T1ZXNlI4YllHQm1VMTBVMVpleWF6UjBzRUhIbWRZdXc1M2RUZjNDVVlkaHMy?=
 =?utf-8?B?SmF1a1V0aVBnZU1KRXJFdUNyaHFUdjhnNGJGQk9ySTJsRGZldmNkWTd5Lzkv?=
 =?utf-8?B?SE03RkhnV0w1RTA3ZzdXbm9MVlFuSDhaWGVzeDFxcUIvRkszWGw5ZFVGMHJT?=
 =?utf-8?B?ZUdsUEg2YzJsNysvTER4OHl4WjNabEl4SDFUYm85bkxTemtTRlN2d00yR3BR?=
 =?utf-8?Q?ovjNH0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(30052699003)(82310400026)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 11:29:51.5327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbbfc79c-88ef-4741-a84e-08de04cbaa56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF5D27497F1

On Mon Oct 6, 2025 at 1:04 PM CEST, Andrew Cooper wrote:
> On 06/10/2025 11:46 am, Alejandro Vallejo wrote:
>> "struct segment_register" requires a prior inclusion of x86_emulate.h,
>> and it's missing a forward declaration of "struct vcpu" too.
>>
>> Sort these out so the header can be included by itself.
>>
>> Not a functional change.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>
> I have a pending series for 4.22 which does substantially more
> rearranging of this file and others.=C2=A0 See
> https://xenbits.xen.org/gitweb/?p=3Dpeople/andrewcoop/xen.git;a=3Dshortlo=
g;h=3Drefs/heads/xen-svm-hdrs
>
> I'd found the need for struct vcpu, but not for segment_register.=C2=A0 H=
ow
> did you find it?

By chance. I happened to include it in a file at a position where the
x86_emulate.h header hadn't been included.

>
>> ---
>> This dependency already exists today. I'm just making it explicit.
>>
>> "segment_register" is weird. It naturally belongs in vmcb.h, but the
>> emulator makes use of it and must be compilable outside of Xen.
>>
>> I don't like having vmcb.h depending on the emulator header, but I see
>> no way of breaking that dependency without breaking the emulator unit
>> tests.
>
> Pulling it into a new header is fine.=C2=A0 The emulator can include anyt=
hing
> (free-enough standing) in arch/x86/include/asm/

I thought it didn't, if so I'm at a loss at to why segment_register is wher=
e
it is.

Be that as it may, your series conflicts with this patch and it makes no se=
nse
to keep both around (when none of them are going in for until 4.22).

Will you be including a fix for the segment register in your series also? I=
f so,
I'll just drop this one.

Cheers,
Alejandro

