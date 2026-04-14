Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF6UBwX33WlolgkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 10:12:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 569273F6FEC
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 10:12:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281457.1564346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCYsB-00019u-BG; Tue, 14 Apr 2026 08:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281457.1564346; Tue, 14 Apr 2026 08:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCYsB-00017A-80; Tue, 14 Apr 2026 08:11:51 +0000
Received: by outflank-mailman (input) for mailman id 1281457;
 Tue, 14 Apr 2026 08:11:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wCYs9-000174-Fc
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 08:11:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCYs8-005quB-3j
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 10:11:48 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69ddf6b8-bab6-0a2a0a5309dd-0a2a4508d414-32
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 10:11:47 +0200
Received: from [52.101.43.0]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69ddf6c1-fab6-0a2a45080019-34652b0012ee-4
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 10:11:47 +0200
Received: from MN2PR20CA0038.namprd20.prod.outlook.com (2603:10b6:208:235::7)
 by SJ5PPFD5E8DE351.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 08:11:40 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:208:235:cafe::9a) by MN2PR20CA0038.outlook.office365.com
 (2603:10b6:208:235::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 08:11:39 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 08:11:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 14 Apr
 2026 03:11:39 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 14 Apr
 2026 03:11:38 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Tue, 14 Apr 2026 03:11:37 -0500
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
 b=DUCwW21L9PPlcsfIks9yEoRta1EIouMTQKA4p/5Q1VbdlXcYPpadYyaQutXtXlKJTalB15lvYWK8iUk91cQBrItCircLp00P68jChPwlLr9SH90jqMnHpR9pAU98SwNpb4ivKEP/ZVPe/51ZU8eourBhGJNrLOLtsQNZuK7/5Gx5iWvJ3fRPmS63hty/zFLmV/Ksn3KsUqMyC4Vuk5UOgM79MX/XDBdnGw442G32wQa8ycRjDEtK8r3Fu/npczzuc2ZHQbcEN9krQRQaHWvjo+aJPOXHfLUdlMPXC6UM8Aj/uKMa70niypZFw3R+kfcyMW4RXt4YyrimS7FSCe2YOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PP1KyGMUPJvF5Q1ukT7V82w/Lm2EsCmlDdLEROtkou0=;
 b=HeE7Zb9PYVVoqHQHWP96r4oMc4+0pUJZgFH74GWbQ8/trEOGo/qiYz7wG4t+biDYdWwWx+sEV4m4RyxjP0wZsXv87+Tm8olYQ9hYq9SkKBHFIPLphquslOP9GM9umIa2LJ7SPRTDDz2JaGcZ9k4hGnDkbufcKgQ3Qv6/HsEw4c4svFs3FtSiPWee+6nRSZ6h35y7rnOzo97VU5hhGR7nppBwfYhGu3W68bif1pINo5Q5+jiw0jD5dIYJIROo9Jaln/oK6p2PxD3lKGsCJny41hO9MnluADpvH1F3NIFhaeufrtVUQVuAI7Y+P95IYlTCAAfnG8bAXqzD+p7FrmVunw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PP1KyGMUPJvF5Q1ukT7V82w/Lm2EsCmlDdLEROtkou0=;
 b=y2U0zr0J50Uocv8mpPe5kNBlqvPlxcsgAWJq+JcUT5ias7Rv1OSMA1Msr7KK9pdNNV2vgz8VoMOTfXNINFPL1JCspWIlvP+GU6LuI8nBLe+ZHq6hwRGp/rTLTYpRt/ra+Z/m3qD6iDC89NA6JMm1hcCjazHJqGqeFChMZxHY5tw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<Mark.Rutland@arm.com>
Subject: [PATCH] xen/arm64: flushtlb: Optimize ARM64_WORKAROUND_REPEAT_TLBI
Date: Tue, 14 Apr 2026 10:11:24 +0200
Message-ID: <20260414081124.48741-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|SJ5PPFD5E8DE351:EE_
X-MS-Office365-Filtering-Correlation-Id: 182f4983-c2c1-467b-24c8-08de99fd74bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Vb0imuJC/sTDyw+CSlUnl7zUUfRn36atApgSsOxsRIDdCP/4iPUh2Ms2RmWCAym0Xd6r3GwI3I+ky90sJY/vqu74LcHVnsJUA9lofhoDnkvy3H8JAO0dKfnf4jyR2ZevuED8axlOvB7ARIclBKuORGUMdOND8c5uUkKx9auNNdCfYfvxtpXa+yGoGZngo0+vD6p4kd+LPGxEznPEN0N80Q7V+pHATWbv1jfZgkIRLps4gExp/k7j2uXD3spP0nhHMW2QBrVRh1J/yX4lTrZxD3pwzIb+YqoWZzrlzeh6+9PNFiZhheTTl+QH5CLi25oh/eKI85LARvY97yDIRrpfh2Apgefi8GKwX+VByCVmx8oIyOaKI83Y1cgGC7wsrJH2Zmli+g1e4F1gZCgTyKcYIKyKlAWno7S++YD0vBfo6/L/YL5/IlEkROLyiMWydBA6YzifrAOubuCuWrA+7gh6+uwAKui1Gqk9OdCpYXB9rR8KE8eRAtUrmyi6nGfkxmhRMfEAT3q2phSiyHMn4vIYbKyyeVQOZ3bi83uxLWu76YN7RD3Zv5n99AewG74gNsmVrzjsliZBm4DY/h9zik6EuHpbEdJSyjkLp1YhYuFSTb/qBRE+RWon8UPaoXAcwmFyazrUFYaUtoRbwxRbExcw5zGuBcsoHFF2KH5EnFUdB8v1mGjTL9Rjx1H1LKsJIrE8o812jWKVoAnfsSTqwq0IDWPdyibouJKITC+t047zJPgS6sTyYmBYy6BZ44rkSJCZZMIjy+iaMnG49H1IJjXrzA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o1kFbWFtiK3xeI1aUlgDvbUumLAYh/h+ajwt3ii+FpIdIjWjilwDpqSyIP1L3m78pyCoF3HMhgh//Ak1pjkfwXODCQ03lLr8iDjBvLhyxz8HU/uXbJkqa4rHzpbh7VjSyaMXh5uRQ4+4WtwjiXTkD+yQAT+EbfAm+8/1yvmYxdEqlfGDP3PAghehknGaAiNqro9dsHxuTRvqmWIYbuktXW3aTiDzsLW4ZEctdaNCyEmrxN/frMIRyujyfP8/E4xIXZ83QA21mhSkg5FajU1ScBOTryrXg9NehFw+qKddKXHs11TTMxuW6opoAhGqUNfR09tOOk2ZSNBRv99PlQLeF9XSqqO92JR7GaKApxey21snfhhE53AmSV8dv+PhrBv6uKGBRW5pbukIhoAUkQgFcswa+dXTU42Tqn52QaFoCH9MHUWYUk03YT61eqKnb1uG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 08:11:39.7012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 182f4983-c2c1-467b-24c8-08de99fd74bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD5E8DE351
X-purgate-ID: tlsNG-c1860d/1776154307-F6151497-20639DC2/0/0
X-purgate-type: clean
X-purgate-size: 12302
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:Mark.Rutland@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 569273F6FEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The ARM64_WORKAROUND_REPEAT_TLBI workaround is used to mitigate several
errata where broadcast TLBI;DSB sequences don't provide all the
architecturally required synchronization. The workaround performs more
work than necessary, and can have significant overhead. This patch
optimizes the workaround, as explained below.

1. All relevant errata only affect the ordering and/or completion of
   memory accesses which have been translated by an invalidated TLB
   entry. The actual invalidation of TLB entries is unaffected.

2. The existing workaround is applied to both broadcast and local TLB
   invalidation, whereas for all relevant errata it is only necessary to
   apply a workaround for broadcast invalidation.

3. The existing workaround replaces every TLBI with a TLBI;DSB;TLBI
   sequence, whereas for all relevant errata it is only necessary to
   execute a single additional TLBI;DSB sequence after any number of
   TLBIs are completed by a DSB.

   For example, for a sequence of batched TLBIs:

       TLBI <op1>[, <arg1>]
       TLBI <op2>[, <arg2>]
       TLBI <op3>[, <arg3>]
       DSB ISH

   ... the existing workaround will expand this to:

       TLBI <op1>[, <arg1>]
       DSB ISH                  // additional
       TLBI <op1>[, <arg1>]     // additional
       TLBI <op2>[, <arg2>]
       DSB ISH                  // additional
       TLBI <op2>[, <arg2>]     // additional
       TLBI <op3>[, <arg3>]
       DSB ISH                  // additional
       TLBI <op3>[, <arg3>]     // additional
       DSB ISH

   ... whereas it is sufficient to have:

       TLBI <op1>[, <arg1>]
       TLBI <op2>[, <arg2>]
       TLBI <op3>[, <arg3>]
       DSB ISH
       TLBI <opX>[, <argX>]     // additional
       DSB ISH                  // additional

   Using a single additional TBLI and DSB at the end of the sequence can
   have significantly lower overhead as each DSB which completes a TLBI
   must synchronize with other PEs in the system, with potential
   performance effects both locally and system-wide.

4. The existing workaround repeats each specific TLBI operation, whereas
   for all relevant errata it is sufficient for the additional TLBI to
   use *any* operation which will be broadcast, regardless of which
   translation regime or stage of translation the operation applies to.

   For example, for a single TLBI:

       TLBI ALLE2IS
       DSB ISH

   ... the existing workaround will expand this to:

       TLBI ALLE2IS
       DSB ISH
       TLBI ALLE2IS             // additional
       DSB ISH                  // additional

   ... whereas it is sufficient to have:

       TLBI ALLE2IS
       DSB ISH
       TLBI VALE1IS, XZR        // additional
       DSB ISH                  // additional

   As the additional TLBI doesn't have to match a specific earlier TLBI,
   the additional TLBI can be implemented in separate code, with no
   memory of the earlier TLBIs. The additional TLBI can also use a
   cheaper TLBI operation.

5. The existing workaround is applied to both Stage-1 and Stage-2 TLB
   invalidation, whereas for all relevant errata it is only necessary to
   apply a workaround for Stage-1 invalidation.

   Architecturally, TLBI operations which invalidate only Stage-2
   information (e.g. IPAS2E1IS) are not required to invalidate TLB
   entries which combine information from Stage-1 and Stage-2
   translation table entries, and consequently may not complete memory
   accesses translated by those combined entries. In these cases,
   completion of memory accesses is only guaranteed after subsequent
   invalidation of Stage-1 information (e.g. VMALLE1IS).

Rework the workaround logic as follows:
 - add TLB_HELPER_LOCAL() to be used for local TLB ops without a
   workaround,
 - modify TLB_HELPER() workaround to use tlbi vale2is, xzr as a second
   TLB,
 - drop TLB_HELPER_VA(). It's used only by __flush_xen_tlb_one_local
   which is local and does not need workaround and by
   __flush_xen_tlb_one. In the latter case, since it's used in a loop,
   we don't need a workaround in the middle. Add __tlb_repeat_sync with
   a workaround to be used at the end after DSB and before final ISB,
 - TLBI VALE2IS passing XZR is used as an additional TLBI. While there is
   an identity mapping there, it's used very rarely. The performance
   impact is therefore negligible. If things change in the future, we
   can revisit the decision.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Linux counterpart (already merged):
https://lore.kernel.org/linux-arm-kernel/20260218164348.2022831-1-mark.rutland@arm.com/
---
 xen/arch/arm/include/asm/arm32/flushtlb.h |   3 +
 xen/arch/arm/include/asm/arm64/flushtlb.h | 108 ++++++++++++++--------
 xen/arch/arm/include/asm/flushtlb.h       |   1 +
 3 files changed, 71 insertions(+), 41 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/flushtlb.h b/xen/arch/arm/include/asm/arm32/flushtlb.h
index 61c25a318998..5483be08fbbe 100644
--- a/xen/arch/arm/include/asm/arm32/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm32/flushtlb.h
@@ -57,6 +57,9 @@ static inline void __flush_xen_tlb_one(vaddr_t va)
     asm volatile(STORE_CP32(0, TLBIMVAHIS) : : "r" (va) : "memory");
 }
 
+/* Only for ARM64_WORKAROUND_REPEAT_TLBI */
+static inline void __tlb_repeat_sync(void) {}
+
 #endif /* __ASM_ARM_ARM32_FLUSHTLB_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
index 3b99c11b50d1..1606b26bf28a 100644
--- a/xen/arch/arm/include/asm/arm64/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
@@ -12,9 +12,14 @@
  * ARM64_WORKAROUND_REPEAT_TLBI:
  * Modification of the translation table for a virtual address might lead to
  * read-after-read ordering violation.
- * The workaround repeats TLBI+DSB ISH operation for all the TLB flush
- * operations. While this is strictly not necessary, we don't want to
- * take any risk.
+ * The workaround repeats TLBI+DSB ISH operation for broadcast TLB flush
+ * operations. The workaround is not needed for local operations.
+ *
+ * It is sufficient for the additional TLBI to use *any* operation which will
+ * be broadcast, regardless of which translation regime or stage of translation
+ * the operation applies to. TLBI VALE2IS is used passing XZR. While there is
+ * an identity mapping there, it's only used during suspend/resume, CPU on/off,
+ * so the impact (performance if any) is negligible.
  *
  * For Xen page-tables the ISB will discard any instructions fetched
  * from the old mappings.
@@ -26,69 +31,90 @@
  * Note that for local TLB flush, using non-shareable (nsh) is sufficient
  * (see D5-4929 in ARM DDI 0487H.a). Although, the memory barrier in
  * for the workaround is left as inner-shareable to match with Linux
- * v6.1-rc8.
+ * v6.19.
  */
-#define TLB_HELPER(name, tlbop, sh)              \
+#define TLB_HELPER_LOCAL(name, tlbop)            \
 static inline void name(void)                    \
 {                                                \
     asm_inline volatile (                        \
-        "dsb  "  # sh  "st;"                     \
+        "dsb  nshst;"                            \
         "tlbi "  # tlbop  ";"                    \
-        ALTERNATIVE(                             \
-            "nop; nop;",                         \
-            "dsb  ish;"                          \
-            "tlbi "  # tlbop  ";",               \
-            ARM64_WORKAROUND_REPEAT_TLBI,        \
-            CONFIG_ARM64_WORKAROUND_REPEAT_TLBI) \
-        "dsb  "  # sh  ";"                       \
+        "dsb  nsh;"                              \
         "isb;"                                   \
         : : : "memory");                         \
 }
 
-/*
- * FLush TLB by VA. This will likely be used in a loop, so the caller
- * is responsible to use the appropriate memory barriers before/after
- * the sequence.
- *
- * See above about the ARM64_WORKAROUND_REPEAT_TLBI sequence.
- */
-#define TLB_HELPER_VA(name, tlbop)               \
-static inline void name(vaddr_t va)              \
-{                                                \
-    asm_inline volatile (                        \
-        "tlbi "  # tlbop  ", %0;"                \
-        ALTERNATIVE(                             \
-            "nop; nop;",                         \
-            "dsb  ish;"                          \
-            "tlbi "  # tlbop  ", %0;",           \
-            ARM64_WORKAROUND_REPEAT_TLBI,        \
-            CONFIG_ARM64_WORKAROUND_REPEAT_TLBI) \
-        : : "r" (va >> PAGE_SHIFT) : "memory");  \
+#define TLB_HELPER(name, tlbop)                       \
+static inline void name(void)                         \
+{                                                     \
+    asm_inline volatile (                             \
+        "dsb  ishst;"                                 \
+        "tlbi "  # tlbop  ";"                         \
+        ALTERNATIVE(                                  \
+            "nop; nop;",                              \
+            "dsb  ish;"                               \
+            "tlbi vale2is, xzr;",                     \
+            ARM64_WORKAROUND_REPEAT_TLBI,             \
+            CONFIG_ARM64_WORKAROUND_REPEAT_TLBI)      \
+        "dsb  ish;"                                   \
+        "isb;"                                        \
+        : : : "memory"); \
 }
 
 /* Flush local TLBs, current VMID only. */
-TLB_HELPER(flush_guest_tlb_local, vmalls12e1, nsh)
+TLB_HELPER_LOCAL(flush_guest_tlb_local, vmalls12e1)
 
 /* Flush innershareable TLBs, current VMID only */
-TLB_HELPER(flush_guest_tlb, vmalls12e1is, ish)
+TLB_HELPER(flush_guest_tlb, vmalls12e1is)
 
 /* Flush local TLBs, all VMIDs, non-hypervisor mode */
-TLB_HELPER(flush_all_guests_tlb_local, alle1, nsh)
+TLB_HELPER_LOCAL(flush_all_guests_tlb_local, alle1)
 
 /* Flush innershareable TLBs, all VMIDs, non-hypervisor mode */
-TLB_HELPER(flush_all_guests_tlb, alle1is, ish)
+TLB_HELPER(flush_all_guests_tlb, alle1is)
 
 /* Flush all hypervisor mappings from the TLB of the local processor. */
-TLB_HELPER(flush_xen_tlb_local, alle2, nsh)
+TLB_HELPER_LOCAL(flush_xen_tlb_local, alle2)
+
+#undef TLB_HELPER_LOCAL
+#undef TLB_HELPER
+
+/*
+ * FLush TLB by VA. This will likely be used in a loop, so the caller
+ * is responsible to use the appropriate memory barriers before/after
+ * the sequence.
+ */
 
 /* Flush TLB of local processor for address va. */
-TLB_HELPER_VA(__flush_xen_tlb_one_local, vae2)
+static inline void __flush_xen_tlb_one_local(vaddr_t va)
+{
+    asm_inline volatile (
+        "tlbi vae2, %0" : : "r" (va >> PAGE_SHIFT) : "memory");
+}
 
 /* Flush TLB of all processors in the inner-shareable domain for address va. */
-TLB_HELPER_VA(__flush_xen_tlb_one, vae2is)
+static inline void __flush_xen_tlb_one(vaddr_t va)
+{
+    asm_inline volatile (
+        "tlbi vae2is, %0" : : "r" (va >> PAGE_SHIFT) : "memory");
+}
 
-#undef TLB_HELPER
-#undef TLB_HELPER_VA
+/*
+ * ARM64_WORKAROUND_REPEAT_TLBI:
+ * For all relevant erratas it is only necessary to execute a single
+ * additional TLBI;DSB sequence after any number of TLBIs are completed by DSB.
+ */
+static inline void __tlb_repeat_sync(void)
+{
+    asm_inline volatile (
+        ALTERNATIVE(
+            "nop; nop;",
+            "tlbi vale2is, xzr;"
+            "dsb  ish;",
+            ARM64_WORKAROUND_REPEAT_TLBI,
+            CONFIG_ARM64_WORKAROUND_REPEAT_TLBI)
+        : : : "memory");
+}
 
 #endif /* __ASM_ARM_ARM64_FLUSHTLB_H__ */
 /*
diff --git a/xen/arch/arm/include/asm/flushtlb.h b/xen/arch/arm/include/asm/flushtlb.h
index e45fb6d97b02..c292c3c00d29 100644
--- a/xen/arch/arm/include/asm/flushtlb.h
+++ b/xen/arch/arm/include/asm/flushtlb.h
@@ -65,6 +65,7 @@ static inline void flush_xen_tlb_range_va(vaddr_t va,
         va += PAGE_SIZE;
     }
     dsb(ish); /* Ensure the TLB invalidation has completed */
+    __tlb_repeat_sync();
     isb();
 }
 
-- 
2.43.0


