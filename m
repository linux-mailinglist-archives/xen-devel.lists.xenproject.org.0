Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCAEAC659E
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:21:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999144.1379889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCyE-0000SC-M9; Wed, 28 May 2025 09:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999144.1379889; Wed, 28 May 2025 09:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCyE-0000Qn-ID; Wed, 28 May 2025 09:21:10 +0000
Received: by outflank-mailman (input) for mailman id 999144;
 Wed, 28 May 2025 09:21:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4yDH=YM=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uKCvg-0001jE-C8
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:18:32 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2415::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b704d4ce-3ba4-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 11:18:29 +0200 (CEST)
Received: from SN7PR04CA0163.namprd04.prod.outlook.com (2603:10b6:806:125::18)
 by DM6PR12MB4418.namprd12.prod.outlook.com (2603:10b6:5:28e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Wed, 28 May
 2025 09:18:25 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:806:125:cafe::7a) by SN7PR04CA0163.outlook.office365.com
 (2603:10b6:806:125::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Wed,
 28 May 2025 09:18:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 09:18:25 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 May 2025 04:18:20 -0500
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
X-Inumbo-ID: b704d4ce-3ba4-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxtMNzr+s/Jp7BgiIHOxtMJKJS1oc5+wzHWPxCODge/hcKhrkDKIrheVDO7Uwk//Wwl/HxK0apXumzcy77TN/Ggy2EaZzLaQ1JiBrLaGpCMYxbk/RJIsHCa60CjyxWuDQR9jehJGf32QPo619kXBGr7nbW+bsMtkF2L/P+10v8x+eJU7lzGyx44il+3Gzkpg3nh97ZlzkI7PzsDt+lsVwfyx7V5+1u5p8yYS28qMg4s2v0UXaAP6x8pvJaZS0KR21aOXpreRumcDeTLHCfkyckybJpt3gIL6JxyPb6cu9156n0kSoDSIfXcsGtgjXORs/9YjPlVpxXaS9H3hSCWQsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvEuxjyrKHpeWz5xkr9emMjeZhe7QGQkfrKWTsEegww=;
 b=Th5B1gAs4e0ZQi5S2hLwXoapaNQpQsf+x6w6C5lDwK8R4cNPSzfvWh1iarV6yZaJ2RMGaS8BYsVZK1yh74NDK6h1ICvAnY1km941SmDLOKlt8/OS6jS849UHMKsBpXL3Y7zujd30SVrg6emXllqZ0cjGPgLPuliKwotYYF2PqZnjbkYXfvRfNIZ5u+e8xdO01ySwj6Pwx7t3xQ8zAOJiUhgIoQPbrqWcExnT+nOF4DUqMtn9brO4h9pYrPyPedp/5hu20/Nrl7ILrEMTuiqWo1BPgbblzcvDtHu/l1cRBI0v5znF3srAtaJPTNSYcjwGRXWhlKN4SydAX1z8PNo6bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvEuxjyrKHpeWz5xkr9emMjeZhe7QGQkfrKWTsEegww=;
 b=k/OgSanCbOn/9N9I2aVjZ5Tfsn512dFEC7mGlqFRSHsyqWaQ/YxvixjH8I+sKlZS995IE3kvAzDqUart/j885ilYWHQbsdsmPrvrRZWpWq+hg/SXKILBYLvXqBdfxDKnRgGoIRQP8R9G99rETRQuQacSoa9VJQQlUxd7astH1V0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, "Bob
 Eshleman" <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v4 16/20] xen/sysctl: wrap around XEN_SYSCTL_physinfo
Date: Wed, 28 May 2025 17:17:04 +0800
Message-ID: <20250528091708.390767-17-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528091708.390767-1-Penny.Zheng@amd.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|DM6PR12MB4418:EE_
X-MS-Office365-Filtering-Correlation-Id: fa155ca8-bb51-4066-1644-08dd9dc89983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?culF3llLHhx9VxWqBxXaKFZfyStp9ITzCEZFTzYMcGpYKC3QKTcjrH+qjfPU?=
 =?us-ascii?Q?Eqec0bV2vRZvj3AjWP6znsMUmtj6ZjAoOHC34IAxnEqlLoh37iSmN89PgyyR?=
 =?us-ascii?Q?6+VA8NB1aRTEoIXtAeqoo1FzL0PUyh/icdDz4ePu7VPH9jVdtr0dXgZaS8pA?=
 =?us-ascii?Q?/eKmUMb/Y876x2jUHl5VeZnyo39VgSoqkfcIXJZO+Y/RbCS/U8eQaIOwF9+G?=
 =?us-ascii?Q?jyqtJBAC1FIj44QvPPQNBjUe+KQVpRpQ86FbGnX+3NHdIQkmsrZAsrXH9/1W?=
 =?us-ascii?Q?QUKm2iU4p29tvvNBU5sbd/kRACowwWXWZE9FPd/72RIW6V4DpATcCusNX4VU?=
 =?us-ascii?Q?bfiNZL5BsYHClVw4rjKbPsTuR+TvAttzF5GekR66ysKgtAoJHBFwwrQcR6U8?=
 =?us-ascii?Q?7FAHwRpPZqOtLbR5a07w9i5WYO+gZEH9GODuIhYozmgHn9Ubre0sVtmn/NMW?=
 =?us-ascii?Q?6C6E2OVql5CpVtf1x4LGGyMzQ2A5eg1q5M+vT87Yv90yhSluN8MGDqQbt+BY?=
 =?us-ascii?Q?HeJ6FE8b/iBMA62z9RPcNw5ZVqM9fa7xTZXC5RDG2wkOqQYHDOIYnIYBnlux?=
 =?us-ascii?Q?fMsHNtOXp8QZWPG8sVs/gHDU+UHIx5suTMigpHtbPF0YyT5FXoideiWhWEbi?=
 =?us-ascii?Q?lajKYWLWr9FFx/kQY8yTfXMyGGevvActMqztAXYaxSWZOjocsBVJ430QgB5R?=
 =?us-ascii?Q?BdjlrtrtFTdMFf+Ye+eUeFoD3ePUK/9kSgsaBATvyvUitkTs5qnf0UiMq9y2?=
 =?us-ascii?Q?g7b4fx3YK/PvrYg+lnVVR46mQtO8ZyujeezOJ5WpZaJBnjMSQeCneNXB6KC8?=
 =?us-ascii?Q?Galfu+mF2UUQ8Ywf7uH7l15P4TcLTaYcUHaE/JA5MvnpOzzrDue941luA6yv?=
 =?us-ascii?Q?JDkQ0bbhvHAGW8ueIDWEp4s3unqjuXACrvm2/wqUHXV1LwnQt8GdAzzFJeSU?=
 =?us-ascii?Q?US2fPzHgPoMQE2Dd0BD35mIdkZ4av5xFlQhuVNgxOqztEouYYkuvgE+dL/yB?=
 =?us-ascii?Q?oIs2T5xXb4piAhjxZyJpwXWwjNd9N/tlWUXBgIUZHH/D2s+OEBmdZfleij+x?=
 =?us-ascii?Q?uk4raRgL3/SL309JzWTujvCU9v58BEWGEbQg3JawZMu0A40mchpK5tzXNdti?=
 =?us-ascii?Q?zR5xUVpNgKBvE4k16DIha0OoTSSC8yUryxhLKq3bYF/Vz/ZzgX8fNK0UK+2W?=
 =?us-ascii?Q?EpsOLQ2nj0UjgZsgdNDJ1/z9sWt5fdjTKSmjxwbfMfJW3u++Lc8B3unji6g2?=
 =?us-ascii?Q?mF5XFeGdH7qYlfFqNnkNmn/N44yQ6AluzJw9A1pqUpVaddQTtIKqnhqL/o3v?=
 =?us-ascii?Q?s8WJIj+snDhJ8I7tbGbB+1zBJAPlrLs5ISPesLD/AENJu1QhEzgtlLZoP+1z?=
 =?us-ascii?Q?NQPekh3JnGtEA4sNRIiaRBVRxMSoJBKW0HIhW5044E8MPEQH5xLmm3iwBx57?=
 =?us-ascii?Q?jqcK2Tyz34CWC8rKw0YZNtSbsPLrgvVJ2W7Vp5FZNTGnxAvEwQnNsxfz//j0?=
 =?us-ascii?Q?6TawHmsmABa7jst1QglfH/qcbK8ANrUacuBF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:18:25.0352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa155ca8-bb51-4066-1644-08dd9dc89983
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4418

The following functions are only used to deal with XEN_SYSCTL_physinfo,
then they shall be wrapped:
- arch_do_physinfo()
- get_outstanding_claims()

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v1 -> v2:
- no need to wrap declaration
- add transient #ifdef in sysctl.c for correct compilation
---
v2 -> v3:
- move #endif up ahead of the blank line
---
v3 -> v4:
- remove transient "#ifdef CONFIG_SYSCTL"
---
 xen/arch/arm/sysctl.c   | 2 ++
 xen/arch/riscv/stubs.c  | 2 ++
 xen/arch/x86/sysctl.c   | 2 ++
 xen/common/page_alloc.c | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index 32cab4feff..2d350b700a 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -15,6 +15,7 @@
 #include <asm/arm64/sve.h>
 #include <public/sysctl.h>
 
+#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
@@ -22,6 +23,7 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
     pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
                                        XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
 }
+#endif
 
 long arch_do_sysctl(struct xen_sysctl *sysctl,
                     XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 83416d3350..295456d0c8 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -321,10 +321,12 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
     BUG_ON("unimplemented");
 }
 
+#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     BUG_ON("unimplemented");
 }
+#endif /* CONFIG_SYSCTL */
 
 /* p2m.c */
 
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 1b04947516..f64addbe2b 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -91,6 +91,7 @@ static long cf_check smt_up_down_helper(void *data)
     return ret;
 }
 
+#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     memcpy(pi->hw_cap, boot_cpu_data.x86_capability,
@@ -104,6 +105,7 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
     if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
 }
+#endif /* CONFIG_SYSCTL */
 
 long arch_do_sysctl(
     struct xen_sysctl *sysctl, XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index dec4cb2ab1..8177d12f50 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -601,6 +601,7 @@ out:
     return ret;
 }
 
+#ifdef CONFIG_SYSCTL
 void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages)
 {
     spin_lock(&heap_lock);
@@ -608,6 +609,7 @@ void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages)
     *free_pages = avail_heap_pages(MEMZONE_XEN + 1, NR_ZONES - 1, -1);
     spin_unlock(&heap_lock);
 }
+#endif /* CONFIG_SYSCTL */
 
 static bool __read_mostly first_node_initialised;
 #ifndef CONFIG_SEPARATE_XENHEAP
-- 
2.34.1


