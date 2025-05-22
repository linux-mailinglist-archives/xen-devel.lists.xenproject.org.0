Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9CFAC0B09
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 14:02:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993826.1376955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI4d7-0000K6-Fl; Thu, 22 May 2025 12:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993826.1376955; Thu, 22 May 2025 12:02:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI4d7-0000Ic-BC; Thu, 22 May 2025 12:02:33 +0000
Received: by outflank-mailman (input) for mailman id 993826;
 Thu, 22 May 2025 12:02:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D/RR=YG=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uI4d5-0000HA-8v
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 12:02:31 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2413::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1dfddf1-3704-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 14:02:29 +0200 (CEST)
Received: from BLAPR03CA0037.namprd03.prod.outlook.com (2603:10b6:208:32d::12)
 by CY8PR12MB9036.namprd12.prod.outlook.com (2603:10b6:930:78::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 12:02:25 +0000
Received: from BL6PEPF0001AB4E.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::eb) by BLAPR03CA0037.outlook.office365.com
 (2603:10b6:208:32d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Thu,
 22 May 2025 12:02:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4E.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Thu, 22 May 2025 12:02:24 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 May
 2025 07:02:22 -0500
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
X-Inumbo-ID: a1dfddf1-3704-11f0-a2fb-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=No9qwNZEfinG8VZTFYbVUqHk/fE1OEgqu8bNc/y5tuxD0ojCoc9zMrBRqeQt/1PUMFhJA6/8m7xT7pXQE3wTQgKnPqIaUDkiz4LIPlNro6z0yKFAeLhyRNZ3dkvp31U4N1wvDjdlefxYIAWZwH/Nk9YRAca0ZsjXpoB8PUkCCuSgztgq0mR/g2uYBNfN1+gyvx5lbfv/Hj0NAgoderZ9qvAYn4ovvCWQwAJnMwNIP++GEsnRhRavxJX7uuIg53AmuAcxEr7yvECTqooSTmwYaWpMY1Cpg0D4DuhAaPjuUCJWhGARTRdmzmrk0RUsoLKWs8kQiXQvJmXoE+C/oUEbIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jex+Qt+qWx5kNzevt+0dG6ZIVPt4PtXsw3oH3ptE2Aw=;
 b=CvzP/q374AIrxNy/F1gtda0NxoPSKSALkFc1E6lHPt3tWS0MXJFPyDyepWbqfzhwa6xpnutaCMfro7tH27iSJGPqGLVUlilpJu1+b1prdCO+0qp2GevFdvNGCO7rsa9UexL6JF4iPwiUQjol7h0nXx80V/yg100Sl9SrnGjZgmFj2oFqtlWZ3Ll7y1H0Cv7ga8WtGZbiqu/LLRnY8MQjKOfYJ+a2csp1r57VPLf8Ox4k8uL8v+BNTHKeD4uU3MPqJz26Y6RwBkj88HyzN5wpm7Ivgyiiwna49YV5HNRsmFys5M5HxyuJRBmQVDsMMKrFRj07gs/By5kly8dfmSTxTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jex+Qt+qWx5kNzevt+0dG6ZIVPt4PtXsw3oH3ptE2Aw=;
 b=2X8SjZbAVYw7f6f6rfhR+0m2MfTD3mVW1ujMpOHTCsqGCZ5aMgFFkV2f2P1HMgDud/BIHVOzZqpmwVt3JExpxcYNoGXm32i1lGDIirb/rb23cQFs5eXjC3HPqUyd3TPpvQSHn4/Bg7ZR6nBeiDI4G8mAqDlGX5NR6O/0f691N9A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 22 May 2025 14:02:21 +0200
Message-ID: <DA2O9YGHUHXI.317T6SOVESFUE@amd.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Jason Andryuk
	<jason.andryuk@amd.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Xenia
 Ragiadakou" <xenia.ragiadakou@amd.com>
Subject: Re: Hyperlaunch/dom0less code sharing
From: Alejandro Vallejo <agarciav@amd.com>
X-Mailer: aerc 0.20.1
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <958f591f-35ac-4a10-93e2-9301ccfc5353@apertussolutions.com>
In-Reply-To: <958f591f-35ac-4a10-93e2-9301ccfc5353@apertussolutions.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4E:EE_|CY8PR12MB9036:EE_
X-MS-Office365-Filtering-Correlation-Id: 94a14ceb-1e21-4984-866e-08dd99288417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0VtVXdrZTFheW5NTHFNNUJPeGw5dmpPcEJZVVRUTlBoN04wTTJEUHNIVkRG?=
 =?utf-8?B?NXI5U3NNNC85N20rYXVsQ2owM1VPWnUyVmxFc2ZGbFl0eWZpT3VCQTl5QzFt?=
 =?utf-8?B?bWJNeVN6ZWtvRnZrZnlReWhQWkNlb0JXSS9iUzlieHJxZFRsUEYyd1Z1ZTNR?=
 =?utf-8?B?OHJraiszby9hcTZ4a3R3d0dOOFBocU4vR2tvZk9YcE8xWXJTWStyZDZ5djhG?=
 =?utf-8?B?N3lFWEtybHdFWnVrV0hkY1BRVE5DUG9LKzhyRzFlYk03UUlKcjRhNEYrUHhm?=
 =?utf-8?B?eldlcWZoam5tM3hNYy9JSWF2TEdxck5QQ3ZhRlRHL3g2cWpEZ0xoVUxDSHVM?=
 =?utf-8?B?OTlJeEVZbHlXS2pXcGo3d1o3SzMzdUdONU95eGduQU9nSzlMKzB1bW94ZHRK?=
 =?utf-8?B?K2pBZ3VaWFZQaHFUdWNuU1ZGKzdNaGpmSmF2ZUdwYlEraDNQL0d4QU1RWith?=
 =?utf-8?B?Q2ZSaFF4MTNNYWNGeENRam53TTRab1lhVlhsVlZNcDVicm5VYmNPRE5PR1lB?=
 =?utf-8?B?aFZvVTduWk9VRWdVcXMyQTdaR1dGeTRPL1dVQWdZK3lFTStSVHh3QWZ0Ync4?=
 =?utf-8?B?bTErakUwNzVzS2s2WTVza29Hc3VJclhpMVdGd3JudSt0QnU1UTcrZ2FHNkt2?=
 =?utf-8?B?SUg4cUNkYkZvOEU1amJpUGwyMis5YmdaUjEzbUtGVEJuZjdLWjJqQ0hiQ0JO?=
 =?utf-8?B?Vk9kbm1raUhVV0g1NHY2cmtmSzBJdWJEbklTdjZKWjR4Tm1DNDhnZ1VMV2Zp?=
 =?utf-8?B?ak9LWjlVUVBYQVV5VnkwcU8vNjVuMUdXWDNHQjFLU3pCWm54UmlDM1E4QUxI?=
 =?utf-8?B?eUpQSmFFOXJZdjc0MHBKNmFvSVFCT3BrOCtCZ0YvQ29UcElGQ1pQOFlQd01j?=
 =?utf-8?B?UHZjWHNxZVhYSFlzcnVRZW54d3kzZFczV0ZwaU5DaGdERm9pTk91cVZiamFq?=
 =?utf-8?B?am9yT0pxdDRMQ2c5aDJtTmYzM0UxbnNENjhZTDlXeWhzY2Izd3RQTzlsVUx6?=
 =?utf-8?B?VVp0S1hyaFJVV05XU2tJRzU0MTlyZVJUblUwOTRMM3BnN1Q1L3FaK3oyQ1F4?=
 =?utf-8?B?TFB3cXR6bndXcUcrWGp5c2VEVmlWV2Z0NlhGNjdDLzUrR3dvTi9TT0ZVUDhh?=
 =?utf-8?B?c283SE1YNzBWU2U5R0dsZVVPd1h2ckZBMWU3Q3JNT0FMeE8rMStMR3BFZk5U?=
 =?utf-8?B?eWMxdjlUWDBLekdxMERJdjR2b0EwdC9qZmV4bzByYUttWElnZXBzMFVEeEFS?=
 =?utf-8?B?U05kaGhOWmNNRk9xb1JFNHpBeE9rWnlvL0R3anpYWUI4SHhYMmpKRnlhSU5z?=
 =?utf-8?B?NE9GOUNFODl6clpHeUFjUjZJOGcxN2pFWTk5T1N5aEU0SWZXaTlEQ1ZUYlBG?=
 =?utf-8?B?MWwzZEFUbU9ISHNaTHlmOHJjbWtzNzV3Ulh1emNIVjJTUy8zTU5DRzRxZWs1?=
 =?utf-8?B?V0d6elAvdS9xejVwL0c4TGw5SkEyMWdsU1ZpVDh3a1l2Q1RTMWxpa1I3U2Yv?=
 =?utf-8?B?YTVxbU9YTnI2cms3NTNPZExFa3hRVnFHRXNwM3MwclNvQ1VDQlpITm9RTkF2?=
 =?utf-8?B?NUtOMTJaRnBpeHpVaHZrSzRuWnBNSFZUWngxdzUrcmtSMyswaktDQzVYVTRm?=
 =?utf-8?B?eVVtTTVTU2xEVktaZ09jQXFnMG9zUXllOUR2RjRkOGw4QjRtSk9xS05QWnlu?=
 =?utf-8?B?RHRlUDdSNzJPcVNPM3llcDJTMlZWUDF6MU1WSUQ5L1FnRmRvLzh1K2NoZjFr?=
 =?utf-8?B?S3ZqSnFrd1FjbXdlOEU1VVh0YUdBb3hWMHlCZjhjRWhTMXpRNXRvUkQ5SEh6?=
 =?utf-8?B?WS9QVTYvODRNSktlb2FRY2xSK21mNVAvQitEdlpNYW5WTEpLRXpjNzRiWkFN?=
 =?utf-8?B?WE5uaElyVG9wUDBtRlFmKzl3SDdwMGJBMXR3Z1NET0d5dnVwRkdBYkVOR3M4?=
 =?utf-8?B?MzdCUTQzc1g1T05YRjR1cFY2SlZabXA3VzgvbU1JMnMvNkg0Mlc4eXZKc3N5?=
 =?utf-8?B?Y2FwUWJUWnhBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 12:02:24.9888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a14ceb-1e21-4984-866e-08dd99288417
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9036

Hi,

On Wed May 21, 2025 at 5:31 PM CEST, Daniel P. Smith wrote:
> On 5/21/25 10:35, Alejandro Vallejo wrote:
>> Hi,
>>=20
>> (There's a TL;DR at the end)
>>=20
>> While working on preparing and reworking the hyperlaunch series for
>> upstreaming it's slowly becoming apparent the degree of duplication with
>> dom0less.
>
> Yes, this was by design so that when we got to the point of convergence=
=20
> it would be apparent where the commonalities are and thus be collapsed.

I'd say they are already fairly apparent. So long as we're all in
agreement I'd like to collapse them sooner when the differences are
small rather than later when it'll be a bigger PITA.

I'll prepare and send what I have so far. It'll all be code motion and
non-functional changes to remove struct duplication.

>
>> Oleksii's latest effort to move all that code into common[*] (see
>> ad03faa942b9("xen/common: dom0less: make some...) makes this even cleare=
r.
>> There are 1:1 relationships for every key data strucutre, and by deviati=
ng
>> we're overcomplicating the ability to share code.
>>=20
>>    [*] https://lore.kernel.org/xen-devel/cover.1746468003.git.oleksii.ku=
rochko@gmail.com/
>>=20
>>      dom0less           Hyperlaunch
>>      ------------------------------
>>      kernel_info        boot_domain
>>      bootmodule         boot_module
>>      bootmodule_kind   bootmod_type
>>      membanks                memmap
>>      bootinfo             boot_info
>
> If you go back, you will see less of these differences. A lot of the=20
> variations have been the results of reviewer's request. And that goes to=
=20
> the fact that dom0less was developed with Arm mentality in terminology,=
=20
> eg. memory banks verse memory map.

bootinfo and banks/maps are more complicated to merge (I do want to
merge them, though, but one elephant at a time). All the others can be
merged without much hassle with minor code adjustments.

>
>> The difficulty in code sharing is not just unfortunate from a vague sens=
e of
>> elegance or neatness. Having different code paths parsing the same DT bi=
ndings
>> means it's a matter of time before x86 and all other Xen ports have diff=
erent
>> bindings, which would would only worsen the situation wrt code sharing a=
nd user
>> confusion.
>
> Only if we allowed it,

Granted. But mistakes happen, and if detected late enough you end up
with aberrations like x86's compat layer for hypercall parsing. I know I
don't want to see that kind of thing ever again if I can help it.

> but with that said there are subtleties between the arch that will
> require variation. Such as mode, which is primarily an x86 specific.

Yes. Common code can't mean exclusively common. Fortunately, dom0less in
common gained provisions for per-ach bindings (see arch_create_domUs()
in staging). With those hunks extracted (keeping the arch hook in them),
x86 could use the same, keeping private bindings where appropriate.

>
>> I've been trying to get _somewhere_ in using parts of dom0less on x86
>> and develop a credible PoC that highlights the use of dom0less parsing
>> code paths. The results are interesting.
>>=20
>> While I didn't get to a full integration in the hyperlaunch series as I =
hoped
>> due to time constraints I did get far enough to:
>>=20
>>    1. Replace boot_module, boot_domain and bootmod_type with their dom0l=
ess
>>       counterparts (pending some cleanup).
>>    2. Isolate binding parsing code in common/device-tree so it's dettach=
ed from
>>       the not-so-common dom0less domain building logic in dom0less-build=
.c
>>    3. Do early module kind detection from x86 using code in (2).
>>    4. Do late binding parsing also using code in (2) after unflattening =
the DTB.
>>=20
>> And it works well enough under QEMU to populate boot_info to a first
>> approximation. It's missing hyperlaunch-specific bindings (like "domid"
>> or "mode"), but that's just a matter of adding them to the already
>> existing per-arch binding parser ("mode", maybe, would be a candidate
>> for this) or retrofit them in dom0less ("domid" is a very clear
>> candidate for this) and integrating in the larger series to be able to
>> actually boot domains.
>>=20
>> The PoC does not go all the way due to time constraints, as I said, but
>> I think it goes far enough to convince me it's both feasible and
>> beneficial to go in this direction rather than that of a full
>> reimplementation on x86, specially seeing how Oleksii already aims to
>> have full code reuse on riscv.
>>=20
>> A brave new world would reuse all data (including bootinfo) and code
>> (bootfdt.c/bootinfo.c), but I couldn't get that far, and I don't think
>> I'll be able to in a timely manner. IOW: I compiled-in device-tree.c,
>> but NOT bootfdt.c or bootinfo.c, or any of the others. I merely
>> extracted from those files the binding parsing bits of interest.
>>=20
>> It'd be nice to use them, but the domain construction logic is just too
>> different at present. As for the code I tested with,  I need to do some =
serious
>> cleanup before it's ready for sharing, and even moreso for review, but b=
efore I
>> go through that I'd like to reach consensus on the following points befo=
re
>> investing any more of my time working on the side.
>>=20
>> TL;DR:
>>=20
>> I think we should aim to share binding code wherever possible, using com=
mon
>> datastructures (kernel_info and bootmodule) as dumping ground for the re=
sults
>> of the binding parsing functions. I seek agreement on the following 3 po=
ints
>> for the end goal of DTB multidomain boots on x86 before I start slicing
>> my hacks into reasonable chunks.
>>=20
>>    1. We want common data structures, with arch-specific fields to hold
>>       information from xen,domain DT nodes
>>    2. We want to have a single collection of DTB parsers in the code.
>>    3. We want to operate on the unflattened DTB for the majority of pars=
ing.
>>      (plus a minimal version on the FDT in order to bootstrap, also comm=
on)
>
> As for 3, I can repost my original analysis that went to the working=20
> group on why using this is not the best idea. Doing 3 would require=20
> doing at least two, if not three passes on the DTB for x86 with zero=20
> benefit/need since, unlike Arm, we never have to read from it after=20
> boot. The way the x86 parser is today, we are walking the DTB only once.

Note that some libfdt wrappers are deceptive and have hideous time
complexities. Doing one pass might not mean a monotonically increasing
cursor. Regardless, DTBs are always quite small (particularly so in
x86), so the time complexity of the parsing algorithm is of little
consequence. We could do 512 passes and the time it would take would
still be negligible.

>
> What I would suggest for 2 is that, perhaps, it might be an opportune=20
> time to review the existing DTB parsing code. Providing a common=20
> interface to parse standard/spec DTB structures regardless if it is=20
> coming from an FTB or via the FTB index, aka "unflattened" DTB. Doing so=
=20
> would enable a complete reuse within the DTB parsers and remove then=20
> need for 3.

The biggest reason for using the DTB unflattened is (imo) having arm and
x86 parsing the same data structure. The unflattened tree is not merely
an FDT with pointers. There's logic to merge nodes with the same names,
remove duplicates, etc. A "quirky" DTB (e.g: with overlapping nodes),
would thus behave differently on arm and x86 unless they both use the
FDT or the unflattened DT.

Furthermore, parsing strictly in the order you find properties in
creates a danger to synthesise different systems when fed DTBs that have
properties in different orders. imagebuilder could be instructed to
reduce the danger of this by having a canonical order of properties, but
I really dislike having room for diverging interpretations of identical
source data. This isn't necessarily an issue with FDT parsing per se,
but it is with the way it's been done in the existing series, whereas
the code in dom0less looks up properties in a specific order.

>
>> (2) and (3) are tightly related. There's many reasons for wanting to use=
 the
>> unflattened blobs as much as possible. They range from quirks in specifi=
c "dtc"
>> versions, to complexities parsing phandles, to corner cases involving du=
plicate
>> properties (i.e: due to .dtsi files), etc. Unflattening an FDT brings a
>> lots of "maybe-ok-after-sanitising" FDTs back into canonically correct D=
Ts.
>>=20
>> I'll share the PoC code as soon as as it's in a presentable state.
>> Hopefully by the end of the week. But I'm sending this ahead of time to
>> start collecting thoughts right away.
>>=20
>> So. Thoughts?
>
>
> v/r,
> dps

All this said, the analysis (thanks for sharing) seems still relevant
and also seems like a reasonable goal for all architectures, but having
everyone parsing the DTB in the exact same way leads to far better
predictability. Once all the code is in common and in use, it'll be a
lot easier to simply modify arm to use the FDT on the grounds of keeping
arch-symmetry and the drop of code it'd mean for x86.

For the time being, however, I'm more interested in getting staging to a
working state where it can boot multiple domains off a DTB, without
endangering arch-symmetry. Then the rest is refinement and optimisation.

Cheers,
Alejandro

