Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E0CC52FB4
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 16:23:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160026.1488272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCgZ-0004V3-V5; Wed, 12 Nov 2025 15:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160026.1488272; Wed, 12 Nov 2025 15:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCgZ-0004PB-Rg; Wed, 12 Nov 2025 15:23:03 +0000
Received: by outflank-mailman (input) for mailman id 1160026;
 Wed, 12 Nov 2025 15:23:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb/2=5U=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vJCgY-0004JE-F6
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 15:23:02 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 772d9bc8-bfdb-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 16:22:57 +0100 (CET)
Received: from SJ0PR03CA0385.namprd03.prod.outlook.com (2603:10b6:a03:3a1::30)
 by CH1PR12MB9574.namprd12.prod.outlook.com (2603:10b6:610:2ae::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 15:22:54 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::57) by SJ0PR03CA0385.outlook.office365.com
 (2603:10b6:a03:3a1::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 15:22:54 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 15:22:53 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 07:22:52 -0800
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
X-Inumbo-ID: 772d9bc8-bfdb-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oa/E9qQfQoNy8YhQAB/KcB0AwKXiUwRXUlW7K36bFU09TUyX10udihHwFNeBNkXYw7Rk5OZYCHlgtDoVsFJBBKK9CdW3EPvAJQciP+oswuBd9Y7E5tXsB5V28keO4M7eu6+5EASB0+TfSHymAXVwijuXLN8P4umaQcs14Lh9GEf7vSx4ihWIyGJvWsVf2+2776Cp8acA0efh4jUL4lWgNxXnKGDG25p/nDrqTBu/nP53UfFNChLw05gvTgJ3SHhGfdd3F0/8Q0FOTrduFv9coZx5Y/RRAdNLmBVcEebHyJVK7IsD4mX/LOtJ5pJcCCB+TvN8uugs990OsDGTIiSIsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSNMRiJhvIm2jM238s1+EHLPCDbys9wV9XE8+uZm1rI=;
 b=fhFHt6aw3qNwA22Vxyi1V5cic5mqRFdRfALJLnQJVEsKyo5HBhf6dT2MF1tv5q/IRQqHJYYq5vIDKyCdswqFaYj7Jxb1GM0vJz0NV4og8rFtZJaEWyQbo9oKhU8JvNJCJ8zcqyIdCJ177Sok7tsGU1bLzoLjTIVk7y7NZqr+uuDHlsYWH1/XlJSQV75hopT+yse+/QyaTLsxGBNxmieX9U8HOZ3bzfamXG6/LaL44w97EESN0On/BKACzCtElhAcXxjtSXwLYaDcOdmE7QZpyLrF0aHMmD4V39oS6XUSbcND5VnUw11xzYZ6A48F71UzBz+TilAlPturEYX/Lk/8yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSNMRiJhvIm2jM238s1+EHLPCDbys9wV9XE8+uZm1rI=;
 b=45stwo0QJsc6fkncuwc/njI+NF9iA0RaSOkb5Xc2zFd5BF0cDCcMyzEiRxFZQY+8Cve10P3mmjKF9Dtv68t1KF6jhTrnASL45dV5U2rcu6wZEwsHU4e5fJaKIMaXlPhmKKLDQL3nY/3vgnTqMTzbtvTkAzt5Ss1BR6rdJj6Fpow=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/2] x86: Conditionalise PV-only fallback branches on CONFIG_PV
Date: Wed, 12 Nov 2025 16:22:30 +0100
Message-ID: <20251112152235.224001-2-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112152235.224001-1-alejandro.garciavallejo@amd.com>
References: <20251112152235.224001-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|CH1PR12MB9574:EE_
X-MS-Office365-Filtering-Correlation-Id: c88f7379-30de-42ab-fdb2-08de21ff59bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oft3npbfVn16+GLiqMpRtXw9KdtglRns0VeE0PJYy752oa2+3gcPc+Q4MFoC?=
 =?us-ascii?Q?SRqktQz0U+YuOzH5xA0WeTqoTilxj4Edb8yWmU3GrsAa8/snqOVylUwWsjym?=
 =?us-ascii?Q?2T2/q2HP2wmTBDcSWoePZCRazKHcoY+MecLsmEMpuBAcn4ACC/M/tV+66TXO?=
 =?us-ascii?Q?++rXHw13Wf28WRyGMRPf6nAg4EIJ7iS9v8Nz65f0PXZ8CzybS7suhxulcooR?=
 =?us-ascii?Q?0deWK6qQr+sBCttrvXOsm/fSDNrp4cZsO9TPSH/rlfZ6sPlJnAoGqpP+gQSs?=
 =?us-ascii?Q?Y8n4efRoXXrpkXLEG3LIdGncba3/NlQIkNQ8xxnUuQ7JSoU/GEsml+ZM61m7?=
 =?us-ascii?Q?BLQrkzUxDfeUft/Is63HF3/RQC3sB6zz89rVGzMTwnUufJyBNnRlAloJdYFt?=
 =?us-ascii?Q?1Jsg7fT7WpdeboamHEdouT34ZD4P5W231outPjVGy0uWCANlcHV452N7izsi?=
 =?us-ascii?Q?YPxgdmufuSTedStCBbTHI2CCQIj7evVlIEzkMVLaOQEjy9AKrQcPbcGds6cH?=
 =?us-ascii?Q?xe4jSwrWJOcRKOepIT7Ns2RUBpbHw7D/ojHpBisTK4oGGekxbBMCnjda08TT?=
 =?us-ascii?Q?M9ZUmrADH6cq4pNkSgLJ4aSCq3JJagu/JIuQvuu1OiA40Y7mxWOdsR/1BXuP?=
 =?us-ascii?Q?5O6vBH3Pa4vhMlsLycllJpQkCvIzkeReuhp5sBVZXUIppdsNPp/Pfz3tGhVy?=
 =?us-ascii?Q?kDPeo0KWcVNuMOeFlOI1f2GsRLZxymWiPgDhVQPo/HPBujjrG83bF/KTfWII?=
 =?us-ascii?Q?L8kH4OQj7o3TUjmeay5XyUDYuk+dM/aoRGnQAyuearkvoRau9+eyf1Ynm5FJ?=
 =?us-ascii?Q?IQTP5Hf8SheFTFK+VxLNvo64R3dePlH9r7duiuUNOfb2bu9Ka+zGMca/UMqw?=
 =?us-ascii?Q?orkWzzuE8sreqb9XhSUk0LBWDEGI0swVTxwgp06RD72ue9Dy+phoSLsD4Nnl?=
 =?us-ascii?Q?ZqV3BnThrBK6KRg5Bk+9a3qNpfvYzRLwQyL9HirdZUiC35U2WmD1/gKzS/31?=
 =?us-ascii?Q?NllU1CdSkseF6E6BsrrRfg457Q0MOIMtmvO/YWtn7JVLpDPfn/RdCruMqjVu?=
 =?us-ascii?Q?99Ua76bNs3Uia9mtIvjA8vHz65LwfnGeJuhPja4ktKamMoeV1eGiUMyQg1cl?=
 =?us-ascii?Q?D6/dFC+I1jbZnmH5U4H3WX8rDEhQsBwxhLXwy3a9/KALNE5e0no9mYiQnumU?=
 =?us-ascii?Q?zTc6ud6KxrFg7ZDlk58yIgV86fvVT52osdCystfnTORk2w3cntjHUP1XvjpA?=
 =?us-ascii?Q?QomdEGZIFKWSh1OE8Oo/EumnCrUpG8ZYZzIP7zK9GdDfupm4vgTLyQ9v7jeA?=
 =?us-ascii?Q?EwtCSxIIzDfMikubN93zodmEIm+hvhw9RTwq/PAD6XtAwAgkwPkqUp0V+IVY?=
 =?us-ascii?Q?MSLDH4XZDqqNEJaiM82+/TQdG+YZUPvy67SP5x/1yzRJhzxn/U/1rSE1kjrN?=
 =?us-ascii?Q?QHcMVpB6HmLwN5Qxf1RQT2z4pHRHSUxjhqmOmKaeWfiTAfA8TuEhki0Jm8sN?=
 =?us-ascii?Q?D6BrmjAI11t9ai6V3GKX5zj50Svquem9JISGzbZ98gLVppI8sB6owwQ/0gjz?=
 =?us-ascii?Q?OzCTI8+SgGxddV413Y4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 15:22:53.7849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c88f7379-30de-42ab-fdb2-08de21ff59bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9574

A couple of branches rely on PV being the "else" branch, making it
be compiled even when PV support is not itself compiled-in.

Add a explicit conditional on CONFIG_PV in those cases to remove the
code in !CONFIG_PV builds.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/cpuid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index b63a82dd38..2e24c84708 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -297,7 +297,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
             if ( v->arch.hvm.guest_cr[4] & X86_CR4_OSXSAVE )
                 res->c |= cpufeat_mask(X86_FEATURE_OSXSAVE);
         }
-        else /* PV domain */
+        else if ( IS_ENABLED(CONFIG_PV) )
         {
             regs = guest_cpu_user_regs();
 
@@ -509,7 +509,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
             if ( !hap_enabled(d) && !hvm_pae_enabled(v) )
                 res->d &= ~cpufeat_mask(X86_FEATURE_PSE36);
         }
-        else /* PV domain */
+        else if ( IS_ENABLED(CONFIG_PV) )
         {
             /*
              * MTRR used to unconditionally leak into PV guests.  They cannot
-- 
2.43.0


