Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C24AABF7F1
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 16:36:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991960.1375740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHkXz-0007Hd-Ps; Wed, 21 May 2025 14:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991960.1375740; Wed, 21 May 2025 14:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHkXz-0007GW-MX; Wed, 21 May 2025 14:35:55 +0000
Received: by outflank-mailman (input) for mailman id 991960;
 Wed, 21 May 2025 14:35:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cemI=YF=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uHkXx-0007GP-Ns
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 14:35:54 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20619.outbound.protection.outlook.com
 [2a01:111:f403:200a::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e47c19f4-3650-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 16:35:52 +0200 (CEST)
Received: from MW4PR03CA0215.namprd03.prod.outlook.com (2603:10b6:303:b9::10)
 by CH8PR12MB9743.namprd12.prod.outlook.com (2603:10b6:610:27a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 21 May
 2025 14:35:47 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:303:b9:cafe::65) by MW4PR03CA0215.outlook.office365.com
 (2603:10b6:303:b9::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 21 May 2025 14:35:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 14:35:46 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 09:35:41 -0500
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
X-Inumbo-ID: e47c19f4-3650-11f0-a2fa-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEnn6FmoKi9B5gdhZrgw7eGnSRtg/m1P0zxbhYZ8t5T+lBB+ITPo3xQdUCttQJvwQOwg1USpiLakJcDS1wFDi+kfJHNTkBisRkZDqkKLBSt++fa36QnqsENbJo0Bq6/FEsMaL4kvR5HHHgxhx3EckILUbmiPSDEmiEhHbb9i0ufCpY/0f3K67Yzn8p6HQznyPDFSb+VqT3myaie9I9sSr3rGn4wG0rtNCikVcEs/vXZN1iTAWs7F4HPJkNqw25nMfRGtJKgYutYoqOIqeiGlCBegea4A1X+14aMzYnIiydy9/ke2oWwRRYEG/dGbufPFszBW7cvQoY8vNlzRSNKwZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxNF8yPnfKOnRwgsU15acE56A5/eYkWJV+RhnqKWZoQ=;
 b=zE/OJtWwbSlS3c8rDzXTabqoM6G1tz/zrAYeLhrL+uJZPBMxdu/Qgsr0XAQDaCZlNFoHtqa6cMYdfFXzrceERaNhhcJj2DYOuUJBCqdU84bP38MmIJys90qwpjWkb0tGcBJtgCq+kvADjdf87F08IsOKD28oThZpedzNZlhdwsNK0QFQqsAAPV8I/qCAqFZpWr4NyF6U4v2aWvjorPULhksbQ5C8bro0Smr30mq4d4IvEt0ps3ClqRMyQK4+h2tBxIhKoJJ8ME1Ul9D6nJHnP/JHq1LyEIMY0WlLt779Ubpihy9r/+fdYFpAS159AXruk9UeAQGsBQ85l0hsBADzXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxNF8yPnfKOnRwgsU15acE56A5/eYkWJV+RhnqKWZoQ=;
 b=fp4vrbtNMzHoN1t661tk0KapRYyAIlYiZZ1OL10bs569SSzjLAOc9IzrePq+BBX34Eqb27QUBT8cuvf2M1FWZiZFF/Uem90dLQlW8mSTB/8YSanK5j8wmJqACcb+DUdbCUNUzT6vX6+4/uiqUQOZUKgPw5J3QIEZR+TQXwyZ6Mw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 May 2025 16:35:38 +0200
Message-ID: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Michal Orzel <michal.orzel@amd.com>, "Jan
 Beulich" <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: Hyperlaunch/dom0less code sharing
X-Mailer: aerc 0.20.1
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|CH8PR12MB9743:EE_
X-MS-Office365-Filtering-Correlation-Id: 93459236-bb77-4f6a-3a68-08dd9874c61b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3d6VVlSa1lXRHpYQXdyUmhtZ21QT25ObTQwT3JZL2xhaVRkSVJXb1pla3FX?=
 =?utf-8?B?MTcvL0NibHFpZ0pCSUNjUDB3b3k2OVlETi8vTE42c1ZWVStEc252ekVPaE44?=
 =?utf-8?B?NkJJV25KQTh6Zm0wYzREd00rNWZvUVM0S3p4eHp2MXk3Y2lLeHdxK2trZ1Uy?=
 =?utf-8?B?TkpyT0lSendaamNLVGp4UkVtR1gyMnhVU0VwZnZ4L2k2VU1HanlXWkxpcWNN?=
 =?utf-8?B?Ym1OdG5EeFhaZkNRZzNmQUhJTXRwWEV1bTFYeUp0R1ZPeFZCWDA0eWphUzN2?=
 =?utf-8?B?bzUzZjh4L3JFWEtWRldQaHkzdDk4RlRmWU1oT3A3T3ZhRGJpSEZvRXpwRDlB?=
 =?utf-8?B?a0pJeloydGtyeXlQWkRDV3VTUXB2M2Q0TzZiVGVOek50aDRqT3RhSzAyN2VT?=
 =?utf-8?B?SFZVMExpRnZUUXVTNy9HOFhKK2phTGE4czBiMDBRREpEMnlCOXdTRmF3aTBz?=
 =?utf-8?B?U0VEaFRIbEZUTXJQM290Y3VlaVEvbHEvbnJzRDdIZDVDa3hPNHg5d1JPMVRo?=
 =?utf-8?B?a2VsOE9lUVlUOWtudk95SW5nSGtWTHJFOFBSd0h4ZkxhYnZRQUhOcUJBQWNW?=
 =?utf-8?B?SlNGMGJ5M1RnWTZMT256WDdHdzVVV1A5S1ZmTXdSVDFOaXA5UmVjTGNZTXRl?=
 =?utf-8?B?U2xreGdpRVk1R1FEekNnODVuQi93akRYV094T2pYR2FsbXhzVThFS084L2t0?=
 =?utf-8?B?SldFSWpoVlpXdUY3YXlJdXpwUEl1M3hBaTNmZTZSQVlzSmpTN2ZocEhIZkEz?=
 =?utf-8?B?aE1vQ3g2UWtkTGFnNFdtbHVKM1ZYMWIyN3lrbUJWaVdNTkxYWmFnRStwQm9v?=
 =?utf-8?B?bm9HSnJ6Z3QwS2dndUFHd3p2TFNsZVQ3SEM4L2s2QitlMFJtN0MrSzBrNzJo?=
 =?utf-8?B?UUFicjVNaDc2cS95cG56UWFzenkxUUM2VnZwN1BJcXZ2RXdZazY1L0FCcDVv?=
 =?utf-8?B?c1BaRU5ZTHBEcW82VHAyUXFud2FkNTlnRWltSFovc2xTbkNHVXZrU1VlSXN1?=
 =?utf-8?B?R3FDd0lKWDNYL2hZU2ZSdHkrZ3JlM3pOZ1YxakFUM3JYZTA4UnRISDRqNFpU?=
 =?utf-8?B?Y3pTZTA3K2pzd2hlZ1VVekR1cERBOTZLZUtXbVMrd0VOVHJaVWZEQ1dlRnlL?=
 =?utf-8?B?bVluckIrZGJBNXZyeDNsZ1lnalBSSDNhQXF6VXVCR0xUU0JRM1pEVHcydmg4?=
 =?utf-8?B?bnVWaFV5ZTlYeEtLcDdMZkFhOFVyb0JLU0pxU3h5SlFWYk90Y1A5b0d2VHhm?=
 =?utf-8?B?MUJNTzZ1TGFQQTJlbC9aNlhXVitkc1R3WHQ4VFU5U3hka09tTEJkMHdjYkVp?=
 =?utf-8?B?UkdHSGFxUk5JU1JuVFlSOTlzdS9MeEJFTE5lWWYwcjlrMTU5UnR5TG5IeFhW?=
 =?utf-8?B?ZHNQNUIzQU9wSjN4MkdRY0h4MmFsaWFFREw2Y0trdDl0MG55bzV3Zm9STkFQ?=
 =?utf-8?B?V0ZDdWZWcGhjRTNISzQyUFV1VXUwOFhoaFNqZlNaYXdJd2V1ZmE4VCtYTFN2?=
 =?utf-8?B?RENJY01oL0M2ejkrVmhScEpsSDRGWkhXUXlYdUdCR2FWaXNTMFdxQmt5cVBo?=
 =?utf-8?B?QjdJUjhBTVZTMjBXUmM2U01uWkZCWVhqbHN6NTg0a09iTU9kV0xFbXV5KzNW?=
 =?utf-8?B?N3NrOEUvNU4zR25RcllrNzNxVEtpaXUwNW11OHZaN0VlYTRUbWlUMDhibHFx?=
 =?utf-8?B?eHYwZ3VTNXJLUmt2NEVqaHlRNjNQc2dneUJ4YU9ib29yL2ZlTHcyVEFPUm56?=
 =?utf-8?B?U3VzVlB1NW5qL2RCaFFKNEZjZU91dExMT2FsRnhzSHdkY285Y0krQXRaOTFJ?=
 =?utf-8?B?TXVQeVFWRWRHUU9UcW16WmF1aWxhUHp4cXNBTFpPQmxoMU5od0xOTFpXaHFn?=
 =?utf-8?B?MG9NaFpMUVZIU1YzVklTbG9kQVRkSUZwdmsvNUZqVThMMmRJVjBMY2Q0UDZW?=
 =?utf-8?B?OHNUYUYwZmE1VHRMUUJDMVFDRXp6MGlrNThsdUdvOEd0S0hMazZ1OVkxSkx1?=
 =?utf-8?B?ZXhERzhhSS9MK0t0OVlLUFNNWEtXUW4xSVZmVVVZQ0d5NkgvYnlMSGw0WHE0?=
 =?utf-8?Q?qT63Sh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 14:35:46.2527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93459236-bb77-4f6a-3a68-08dd9874c61b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9743

Hi,

(There's a TL;DR at the end)

While working on preparing and reworking the hyperlaunch series for
upstreaming it's slowly becoming apparent the degree of duplication with
dom0less.

Oleksii's latest effort to move all that code into common[*] (see
ad03faa942b9("xen/common: dom0less: make some...) makes this even clearer.
There are 1:1 relationships for every key data strucutre, and by deviating
we're overcomplicating the ability to share code.

  [*] https://lore.kernel.org/xen-devel/cover.1746468003.git.oleksii.kuroch=
ko@gmail.com/

    dom0less           Hyperlaunch
    ------------------------------
    kernel_info        boot_domain
    bootmodule         boot_module
    bootmodule_kind   bootmod_type
    membanks                memmap
    bootinfo             boot_info

The difficulty in code sharing is not just unfortunate from a vague sense o=
f
elegance or neatness. Having different code paths parsing the same DT bindi=
ngs
means it's a matter of time before x86 and all other Xen ports have differe=
nt
bindings, which would would only worsen the situation wrt code sharing and =
user
confusion.
=20
I've been trying to get _somewhere_ in using parts of dom0less on x86
and develop a credible PoC that highlights the use of dom0less parsing
code paths. The results are interesting.

While I didn't get to a full integration in the hyperlaunch series as I hop=
ed
due to time constraints I did get far enough to:

  1. Replace boot_module, boot_domain and bootmod_type with their dom0less
     counterparts (pending some cleanup).
  2. Isolate binding parsing code in common/device-tree so it's dettached f=
rom
     the not-so-common dom0less domain building logic in dom0less-build.c
  3. Do early module kind detection from x86 using code in (2).
  4. Do late binding parsing also using code in (2) after unflattening the =
DTB.

And it works well enough under QEMU to populate boot_info to a first
approximation. It's missing hyperlaunch-specific bindings (like "domid"
or "mode"), but that's just a matter of adding them to the already
existing per-arch binding parser ("mode", maybe, would be a candidate
for this) or retrofit them in dom0less ("domid" is a very clear
candidate for this) and integrating in the larger series to be able to
actually boot domains.

The PoC does not go all the way due to time constraints, as I said, but
I think it goes far enough to convince me it's both feasible and
beneficial to go in this direction rather than that of a full
reimplementation on x86, specially seeing how Oleksii already aims to
have full code reuse on riscv.

A brave new world would reuse all data (including bootinfo) and code
(bootfdt.c/bootinfo.c), but I couldn't get that far, and I don't think
I'll be able to in a timely manner. IOW: I compiled-in device-tree.c,
but NOT bootfdt.c or bootinfo.c, or any of the others. I merely
extracted from those files the binding parsing bits of interest.

It'd be nice to use them, but the domain construction logic is just too
different at present. As for the code I tested with,  I need to do some ser=
ious
cleanup before it's ready for sharing, and even moreso for review, but befo=
re I
go through that I'd like to reach consensus on the following points before
investing any more of my time working on the side.

TL;DR:

I think we should aim to share binding code wherever possible, using common
datastructures (kernel_info and bootmodule) as dumping ground for the resul=
ts
of the binding parsing functions. I seek agreement on the following 3 point=
s
for the end goal of DTB multidomain boots on x86 before I start slicing
my hacks into reasonable chunks.

  1. We want common data structures, with arch-specific fields to hold
     information from xen,domain DT nodes
  2. We want to have a single collection of DTB parsers in the code.
  3. We want to operate on the unflattened DTB for the majority of parsing.
    (plus a minimal version on the FDT in order to bootstrap, also common)

(2) and (3) are tightly related. There's many reasons for wanting to use th=
e
unflattened blobs as much as possible. They range from quirks in specific "=
dtc"
versions, to complexities parsing phandles, to corner cases involving dupli=
cate
properties (i.e: due to .dtsi files), etc. Unflattening an FDT brings a
lots of "maybe-ok-after-sanitising" FDTs back into canonically correct DTs.

I'll share the PoC code as soon as as it's in a presentable state.
Hopefully by the end of the week. But I'm sending this ahead of time to
start collecting thoughts right away.

So. Thoughts?

Cheers,
Alejandro

