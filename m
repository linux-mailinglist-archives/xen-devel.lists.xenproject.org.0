Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLEtJx6K52lY9wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 16:30:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE69943C101
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 16:30:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289049.1569276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFC7Z-0005tu-Ie; Tue, 21 Apr 2026 14:30:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289049.1569276; Tue, 21 Apr 2026 14:30:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFC7Z-0005ra-G3; Tue, 21 Apr 2026 14:30:37 +0000
Received: by outflank-mailman (input) for mailman id 1289049;
 Tue, 21 Apr 2026 14:30:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wFC7X-0005rR-Lo
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 14:30:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFC7W-00BYS1-Nz
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 16:30:34 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e789ff-2eae-0a2a0a5409dd-0a2a4506e23e-26
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 16:30:34 +0200
Received: from [40.107.200.58]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e78a08-7371-0a2a45060019-286bc83a879b-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 16:30:34 +0200
Received: from CH2PR14CA0016.namprd14.prod.outlook.com (2603:10b6:610:60::26)
 by IA4PR12MB9811.namprd12.prod.outlook.com (2603:10b6:208:54e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 14:30:29 +0000
Received: from DS2PEPF000061C3.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::af) by CH2PR14CA0016.outlook.office365.com
 (2603:10b6:610:60::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 14:30:29 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF000061C3.mail.protection.outlook.com (10.167.23.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 21 Apr 2026 14:30:29 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 21 Apr
 2026 09:30:28 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 21 Apr
 2026 09:30:28 -0500
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 21 Apr 2026 09:30:26 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTtwaSw+aVl4SH51/el9lBT2yK1EcyEyr6lqy2TgWq5PItBDL0caSo9y6CYfn8nOpAsaKQumNCq6F2mESw10nVCUDEzO4S7oJaP9HFvf/CBta2KJUf6qDlaZDabqMzU1Fl4VaVKya45tJp5iO4QFwYVRVERU4ziRXnA5vGzG/zXllUQLfiY+6CIsgC6qDo3pEmPY/eMlziminOoVRXLXE3orVSZTMrpQdm6TX+9j05VkaypMvtQnGcisGdQu2nN9zLFSOnk7nmrGGBxEnhBN5Fj8ynpAp63kXWvL1Zzd5JPKAHQcJOenPdfJt4fyEHTeMrfEMfZj2nf4NnZRPNvUzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rt4Cg6ARxQ+ti9bjvQsDIwEWRrHzxjbCHaD1tjnpnOQ=;
 b=KRs+BD7WeNONiIzAZdQuWy6cP2ulGv2IrS2jmyN+226KQrd6++clA9MGkHUcDsl6CaGGndstHqJt5zce6e0yrRzlN6ydo8oZiAukJJCTynoJ1PgTV5y0JrgKy6teJVju2tOQfpF/zkbXBm21jDLGNNIPaocVquYdoHnAplt+a7d/ufRVyeHFKTPCHnzjY+KWuuDNaKt/8UjN5ADh4zF0xGYQHH5EGII414vQZATYAr1GnLC1LQSTIcHVNFkb39eWipl60gYT5LkNH0HK9qsipKHG5p6MSAnEZ5S72y/5UqUbtCYO+JHKj/PmaV6PWBuatZKmB56bsvNQkWRgnNmYSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rt4Cg6ARxQ+ti9bjvQsDIwEWRrHzxjbCHaD1tjnpnOQ=;
 b=VF5K6Ou4uhicmzF+4kwgag2e/gQDHhQe3Q0UxAUzaDbTz4O11X0YwqhZkNucAG0NW4k/rf3kHi9+YGXKb5+c4aFvTGLi7vxkLs5DzVGBFiiDHskR2DNDXPmNqSscYU1fZwfrq3qCmpetp4dLNiQG+0xYgM+qpCQidb4YNPtnSTs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <9c54e3e2-949c-4f50-887e-9f98888c81f6@amd.com>
Date: Tue, 21 Apr 2026 16:30:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: skip holes in physical address space when
 setting up frametable
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Luca Fancellu <Luca.Fancellu@arm.com>
References: <20260417091124.39552-1-michal.orzel@amd.com>
 <5ae7ad4f-e7ef-462c-8a90-755d6f5936b6@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <5ae7ad4f-e7ef-462c-8a90-755d6f5936b6@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C3:EE_|IA4PR12MB9811:EE_
X-MS-Office365-Filtering-Correlation-Id: 3af373f1-8df9-4e3c-0c39-08de9fb2898c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PTuBCgkEGfGybaatzH+ElB9N3/lMWfmlN2cpiTZNDJYsEmsTsBAPhvRpUhNvVZ22CToKpT49raXpIPdVREdCuehCAgwZY9GR9CvfTmZj/lSJJhPlpI/KcKaB4cEocT8tvZQqyF0UtOfIt7ytYGCa3XsIxdY3f7jK4oNsWg3N80t/rtCq0J41dqRfzkSI2o33NktOcL7NPLOWlOvuhF4ynwiCZYc9ErfzbPVTTI6LCW6CLoVdbLAHDkcGYSzvmb4xh4sg/PHXvsNI5CIbdUuJfg7DowAHH4ILqmQzWg9qS56cJzT+D9JGUT/FJSnyw2y27cBrnGHTUH8c8LF9SW9DOdbgo0uSka43eDRQc7tM4gHZMbRLV3SZxHWD57TmBYyjEapzj1nQJag0MllGqaJ1CbGAd8x0eTKWu4gol2u7Qd6gqhives0AMLFLAJv4bzaIlJiUJrVft125wMhNddER95PoUIkSF+qSBwnPMDvgcHtTeZvydfr8hW1OmcTCgryn6Eb9CPmSlH4RlC6YS01IyiyRJE1m43paoreWdhWW2bwgtTxY+kqSqrIAAmUV7rOKPxFPnAmS/YC9hjRXy9gmZ9CLnyK7tqQapuoVjecEzI5zNeaP3Q5bAbTIRf4nDNppXPh7DR7nZiSBD1oaVqkMm4y86Kg/gzCToy4rZV9Y8/cSgffXS6ZUCLm/bygO4RS0Pal3fB3ii0mDVu1p31IVmk8YWXP+MUrNUT+6NblupXvm4s2SCX+hoZ+aiLnNj5DUjp51g5tlg5YjdZSkZC/cBQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ona3yVn+fNktJ1KaWDji91Croo5WOO98HpSBgotTXE0rQfofOmRt3Q7qcYIVe84TXeW65OhMc0R5yeutHFchcxuKwF3MtaPdhe60OQplNpAiA+1eclU8yjB2Bx98bX5F1Y3t94gNJf9V03sM8c6NBYzLAF7Zk7Ew3nnuTG9fa4mDcRk2MLZnbALdt9mDgvzipFm6Ji0a40ltHb0rpQYggdqi2gkHCqdWhyEJEw+q+xIkRivNF9OO4OozPL/ijOab3KLUwiX6YoT1AzIGGRrsBYS4KtBmvuE9vSun/ixem3tHtfi+Pt7nAqwHzL1FcGYP/VJwpKFPOY4NgjyQSboP/O9r25ffgQ/X70nTzSxzlUbI9Jdphyu6NJf7KYSzrVSlrO2T/Uar0+no4bZi/mYA0VzHBD8c2Ih3Gy1RAeUyg7o9MWmrc2GJMXA59X0yR27Q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 14:30:29.3102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af373f1-8df9-4e3c-0c39-08de9fb2898c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9811
X-purgate-ID: tlsNG-16d1c6/1776781834-50158D75-64DC150B/0/0
X-purgate-type: clean
X-purgate-size: 1991
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:Luca.Fancellu@arm.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: EE69943C101
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 21/04/2026 15:30, Oleksii Kurochko wrote:
> Hello Michał,
> 
> On 4/17/26 11:11 AM, Michal Orzel wrote:
>> Refactor setup_frametable_mappings() into init_frametable(), modeled
>> after x86's implementation. Instead of mapping one contiguous frametable
>> covering ram_start to ram_end (including holes), iterate the
>> pdx_group_valid bitmap to allocate and map frametable memory only for
>> valid PDX groups, skipping gaps in the physical address space. At the
>> moment we don't really take into account pdx_group_valid bitmap.
>>
>> This reduces memory consumption on systems with sparse RAM layouts by
>> not allocating frametable entries for non-existent memory regions.
>>
>> A file-local pdx_to_page() override is needed because the generic macro
>> in xen/include/xen/pdx.h does not account for ARM's non-zero
>> frametable_base_pdx.
>>
>> Update the MPU implementation to match the new init_frametable()
>> signature. Since MPU has no virtual address translation (ma == va),
>> hole-skipping is not possible and the frametable remains a single
>> contiguous allocation.
>>
>> Signed-off-by: Michal Orzel<michal.orzel@amd.com>
>> ---
>> We've been using this approach at AMD for a while now. Without this we would not
>> be able to boot some of our boards that have huge holes in the PA space, so I
>> consider this patch a great improvement.
>>
>> Two things to consider as a follow-up in the future:
>>   - change generic pdx_to_page, page_to_pdx to take into account offset that
>>     on x86 is zero but on other arches it is not. The page list code is
>>     for now unaffected because the offset cancels out,
>>   - use the same on RISCV.
> 
> Do you have such plans to do that for RISC-V?
My plan for this release cycle is to do this for Arm as we can observe great
improvement in space management. Other things that I mentioned I planned for the
future. I don't want to add new things on our plate in this release.

~Michal


