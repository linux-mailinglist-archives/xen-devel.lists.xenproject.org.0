Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D392CB7D5B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:07:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184964.1507335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuRG-0005oc-4O; Fri, 12 Dec 2025 04:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184964.1507335; Fri, 12 Dec 2025 04:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuRG-0005km-0E; Fri, 12 Dec 2025 04:07:30 +0000
Received: by outflank-mailman (input) for mailman id 1184964;
 Fri, 12 Dec 2025 04:07:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuQj-0007Dl-4x
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:06:57 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fea1d79d-d70f-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 05:06:55 +0100 (CET)
Received: from MN2PR03CA0001.namprd03.prod.outlook.com (2603:10b6:208:23a::6)
 by BL3PR12MB9049.namprd12.prod.outlook.com (2603:10b6:208:3b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 04:06:49 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:23a:cafe::98) by MN2PR03CA0001.outlook.office365.com
 (2603:10b6:208:23a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.16 via Frontend Transport; Fri,
 12 Dec 2025 04:06:49 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:06:49 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:06:45 -0600
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
X-Inumbo-ID: fea1d79d-d70f-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sz8JwfxmHzsdSuAgQaHd56ckYEGXu9kU0BFgiJyz0PrX9Xcu21TE7B81XtIiHXutqZIWLyB+W1FzqkvUCBc1kBR9109P5v4G22z5BS5ciuVQVDwRzofOblFRI+U+s5V2FmjmMJ8aG14aA4JQGBZgUqEjirdUwB1qBBC/1IDvVvUsUaqQH+/jtUG46p7Kty3QUhRBc1EL7PdSj1srhWhOHxNRuL2cuZ2ZJttwkIq69Ou4PCmg8zrTOmCbwLfeRNLuiNGSoaBMCVJQTDNLvMItXDj2ijEvm2nBXmU3Y/GdWM5cJ9fIaoewoKVWUglPyYBxX/0zLDaUP4+hqC1/t2kCHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzuQmmqlcML7KE9IskVKiovSk6+95AR+dO+1iepoyl0=;
 b=giH5Tn3F1XMSzSldZf93Mb6oXxg29RgczuH5F8J0Zmhd9ufse8rpeqAc+bB9XtrBauUws86dFtZbYXaeUIqjTp7jchM03scQFoo73xSr0x4rmOSILPTWHNkznMHK3E1KwqkJQPbKVlCOAK76HqDbQtYzoYYT6q0AYZnVmVlc0g5LEmGRF5Sm8lWSFQ+9ReXmdwPOFiASUDq9yL06HHpceB2t5ISTJNQtBsa5B0UGZQ9RgJCLSA+v3NRugqyhcNt18FCQNzFDnK99i2C74ZZxcIzOW138aim3qfxGNL5lRxuLeBKqBYUNMlqKLoqQ3YgJQ32mxUaT+Bsqmf3ZoRtwCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzuQmmqlcML7KE9IskVKiovSk6+95AR+dO+1iepoyl0=;
 b=48Z0FePR27lT0PdMyFRis0wDVpn6WP5iiEGP89SVz19u/NJN88Y+0xL1wBGfbs/GVFxil24DxWhEVbGw5L+v+R3AuFpSTuL/ffRjMCaKnb8+HFjX7z98qW0VvAXGZS2/+MUOiSjwaKvdYHz+3TH7fRjzHF1o4GrUOYNX8xRq3qI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Michal
 Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v5 09/24] xen/domctl: wrap domain_kill() with CONFIG_MGMT_HYPERCALLS
Date: Fri, 12 Dec 2025 12:01:54 +0800
Message-ID: <20251212040209.1970553-10-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212040209.1970553-1-Penny.Zheng@amd.com>
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|BL3PR12MB9049:EE_
X-MS-Office365-Filtering-Correlation-Id: 40b072cd-f243-42e9-00d8-08de3933dfe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6D3R8FBVf97GIx5nNLvqOt56sTW5Q1K9hRfM8Iull8jf22GG2deaqPIgode2?=
 =?us-ascii?Q?KKR1RBK+RBZDvb5lYfwBCjlgWk11V4EtCbqb/SWzi2itMNPyBx/uLIAHGo0b?=
 =?us-ascii?Q?jwY6NZ2N5GKKpownrvCYbeajZxqh+iy/UeLINmzNPC5uIvQLIEzAwwdei8N4?=
 =?us-ascii?Q?so7wsJOLADJn5El6sPX2sJRjHjEHBt7iDqa6oKUjvxt29scZReI3vF2/5Q2D?=
 =?us-ascii?Q?dCYfkZYnICB3kGHCtVrH4pPkf6SqcxUvSkG8RcFdeoDfnW0+WGW2GlGHUQyn?=
 =?us-ascii?Q?PKYOMPnYlugKLkUapP9zeiztMKBn8YqXefZaobNaeMzoMcCaaSA6XEO0ZEnq?=
 =?us-ascii?Q?Im+5BuMcgspFHMJsgPT1YYH1hBo0CrGW125boR/LLmd1ke0cAofqYlYCOfjX?=
 =?us-ascii?Q?IZBKvmmzalSO4f4xWWC8TuqmDbehCvlHBbIMbPz127K41IiIE8wDdEc9Vb7i?=
 =?us-ascii?Q?P9tyI1gIK04aFRKQFJSCgoLDiY4P8Gv+sL3lt35v1YE/Zk3072FC22ODgXyi?=
 =?us-ascii?Q?P6YPKnZ62G/xZ1Hizb9poQ6MkFzfRokiBERKHzFqMxmE2UtPNjzMUOf/JIM+?=
 =?us-ascii?Q?0BRmSP2vn3ao1xkPVy0NT3lsdlKpIMICTRijJuLI4DLd3+Mh3YllIWBmbJsd?=
 =?us-ascii?Q?YkNXDUlezv4J3CjlDKyNDTtAehmCJ4Ttqt6Sk3yQi1Cp/kdbrNoYZCqGRp5g?=
 =?us-ascii?Q?s1fMZXY1Xyf4IA/QGdlbnyoThjTBWkpN/BaQUL7t6jnyRLQprcVIcw3BEGNs?=
 =?us-ascii?Q?rDqzPLB9EeHodDKbNvzHxjkwAX/244aWgLyXryapgGrBcWWdRHtjAY6SlH25?=
 =?us-ascii?Q?hPVmgVipMb3vEhDwROSMELDfydzB0MEtICa1o5mKbE533dCXkQdrvGTEKbwB?=
 =?us-ascii?Q?KfCWP6hP9Wgusr6bxX3BxP6ITY4+U4GUX8UCdRaRmKtBcg7oUDVH80uk1ctI?=
 =?us-ascii?Q?zXMkeiv3WkSeh7M61XRKgQAmFKcj5YMhVOiwlOrEJ+phtHCwEXchklrsAZ1N?=
 =?us-ascii?Q?pM1v5eVbOriPzWlpgJ/m96gWfGEUAUdlPKWUkyZC9ogAdpp0nd1phq1B5OcD?=
 =?us-ascii?Q?FOWpHmsD5MDRter2C9cSF/wtUERo47YeYK6I9CWyHqTd6HNGrigLmV869u47?=
 =?us-ascii?Q?iTAjevdZnltkL04ZLynP9EoHQwSnXhbuvLn9PbkjKsRJQapzACOBHMXYoPuG?=
 =?us-ascii?Q?6lFf9i/KWR7Uzt3+l4x5DhfMpQa7RQIXsXjd/TUHHkLULmBte9xfshM8sTEF?=
 =?us-ascii?Q?konOtjMaFcmjZ1TC3aXYdp4+XuolaOQcOOQLfwJ/6WZkomvaqAaWPNxZrj1d?=
 =?us-ascii?Q?u/WlYBoob7SVUZ4vHaLEFBlJYBogHDw+E8EIQ3TZAR9iHoICtg3Z0YYl9Fkv?=
 =?us-ascii?Q?5RDCHHAKo8Ub3u/9j+DfypmE3sWqGnnrBqW9dJOzhUAZzOr7sAJyRGHqKgxC?=
 =?us-ascii?Q?RARGMifHZWm/lZpGbYHqCnUfQUu0g+YkmmWajiyGcvNjaLv3rJ1dpba8VHZm?=
 =?us-ascii?Q?WF32oJZK9OZdvFDrAN2yBPQoo5V51ymu8/K2UbMJeOM2IX0Pkq7W0Ek4nUwx?=
 =?us-ascii?Q?k5lL9KYyFpJxj4jNMYA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:06:49.5061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b072cd-f243-42e9-00d8-08de3933dfe2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9049

Function domain_kill() is responsible for killing domain and relinquish
domain-held resources. and it is only invoked under
XEN_DOMCTL_destroydomain-case. So it shall be wrapped with
CONFIG_MGMT_HYPERCALLS.
Tracking its calling chain, the following functions could also be wrapped with
CONFIG_MGMT_HYPERCALLS:
- domain_relinquish_resource
  - pci_release_device
  - paging_teardown
    - p2m_pod_empty_cache
  - relinquish_memory
  - pit_deinit
  - iommu_release_dt_devices
  - tee_relinquish_resources
    - ffa_relinquish_resources/optee_relinquish_resources
  - relinquish_p2m_mapping
  - p2m_clear_root_pages
Otherwise all these functions will become unreachable codes when
MGMT_HYPERCALLS=n, and hence violating Misra rule 2.1.
The reason why {arch_}domain_teardown() is not wrapped is that it is also used
on the failure path of domain_create(). And the exclusion of
paging_final_teardown() is blocked by domain_destroy(), which will be
triggered when d->refcnt equals zero.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap XEN_DOMCTL_destroydomain-case transiently
---
v2 -> v3:
- add back stub wrapping in ppc/riscv
- address "violating Misra rule 2.1" in commit message
- remove transient wrapping around XEN_DOMCTL_destroydomain-case
---
v3 -> v4:
- remove diff in mem_sharing.c
- add description for some functions to aid review
---
 xen/arch/arm/domain.c                 | 3 +++
 xen/arch/arm/include/asm/tee/tee.h    | 2 ++
 xen/arch/arm/mmu/p2m.c                | 4 ++++
 xen/arch/arm/mpu/p2m.c                | 2 ++
 xen/arch/arm/tee/ffa.c                | 4 ++++
 xen/arch/arm/tee/optee.c              | 4 ++++
 xen/arch/arm/tee/tee.c                | 2 ++
 xen/arch/ppc/stubs.c                  | 2 ++
 xen/arch/riscv/stubs.c                | 2 ++
 xen/arch/x86/domain.c                 | 2 ++
 xen/arch/x86/emul-i8254.c             | 2 ++
 xen/arch/x86/mm/p2m-pod.c             | 2 ++
 xen/arch/x86/mm/p2m.c                 | 2 ++
 xen/arch/x86/mm/paging.c              | 2 ++
 xen/common/domain.c                   | 2 ++
 xen/drivers/passthrough/device_tree.c | 2 ++
 xen/drivers/passthrough/pci.c         | 2 ++
 17 files changed, 41 insertions(+)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 47973f99d9..049cc8923b 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -959,6 +959,7 @@ int arch_vcpu_reset(struct vcpu *v)
     return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int relinquish_memory(struct domain *d, struct page_list_head *list)
 {
     struct page_info *page, *tmp;
@@ -1110,6 +1111,8 @@ int domain_relinquish_resources(struct domain *d)
 
 #undef PROGRESS
 
+#endif /* CONFIG_MGMT_HYPERCALLS */
+
 void arch_dump_domain_info(struct domain *d)
 {
     p2m_dump_info(d);
diff --git a/xen/arch/arm/include/asm/tee/tee.h b/xen/arch/arm/include/asm/tee/tee.h
index 15d664e28d..f4187c5dc3 100644
--- a/xen/arch/arm/include/asm/tee/tee.h
+++ b/xen/arch/arm/include/asm/tee/tee.h
@@ -40,12 +40,14 @@ struct tee_mediator_ops {
     int (*domain_teardown)(struct domain *d);
     void (*free_domain_ctx)(struct domain *d);
 
+#ifdef CONFIG_MGMT_HYPERCALLS
     /*
      * Called during domain destruction to relinquish resources used
      * by mediator itself. This function can return -ERESTART to indicate
      * that it does not finished work and should be called again.
      */
     int (*relinquish_resources)(struct domain *d);
+#endif
 
     /* Handle SMCCC call for current domain. */
     bool (*handle_call)(struct cpu_user_regs *regs);
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 51abf3504f..30d6071e91 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1243,6 +1243,7 @@ static void p2m_invalidate_table(struct p2m_domain *p2m, mfn_t mfn)
     p2m->need_flush = true;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 /*
  * The domain will not be scheduled anymore, so in theory we should
  * not need to flush the TLBs. Do it for safety purpose.
@@ -1262,6 +1263,7 @@ void p2m_clear_root_pages(struct p2m_domain *p2m)
 
     p2m_write_unlock(p2m);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /*
  * Invalidate all entries in the root page-tables. This is
@@ -1556,6 +1558,7 @@ int p2m_init(struct domain *d)
     return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 /*
  * The function will go through the p2m and remove page reference when it
  * is required. The mapping will be removed from the p2m.
@@ -1626,6 +1629,7 @@ int relinquish_p2m_mapping(struct domain *d)
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /*
  * Clean & invalidate RAM associated to the guest vCPU.
diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
index f7fb58ab6a..c44297a9e3 100644
--- a/xen/arch/arm/mpu/p2m.c
+++ b/xen/arch/arm/mpu/p2m.c
@@ -57,10 +57,12 @@ bool p2m_resolve_translation_fault(struct domain *d, gfn_t gfn)
 
 void p2m_flush_vm(struct vcpu *v) {}
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int relinquish_p2m_mapping(struct domain *d)
 {
     return 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void p2m_domain_creation_finished(struct domain *d) {}
 
diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 1d0239cf69..f9ba9b60bf 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -469,10 +469,12 @@ static void ffa_free_domain_ctx(struct domain *d)
     XFREE(d->arch.tee);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int ffa_relinquish_resources(struct domain *d)
 {
     return 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static void ffa_init_secondary(void)
 {
@@ -623,7 +625,9 @@ static const struct tee_mediator_ops ffa_ops =
     .domain_init = ffa_domain_init,
     .domain_teardown = ffa_domain_teardown,
     .free_domain_ctx = ffa_free_domain_ctx,
+#ifdef CONFIG_MGMT_HYPERCALLS
     .relinquish_resources = ffa_relinquish_resources,
+#endif
     .handle_call = ffa_handle_call,
 };
 
diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index 5151bd90ed..1ed0fd231d 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -632,6 +632,7 @@ static void free_optee_shm_buf_pg_list(struct optee_domain *ctx,
                  cookie);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int optee_relinquish_resources(struct domain *d)
 {
     struct arm_smccc_res resp;
@@ -693,6 +694,7 @@ static int optee_relinquish_resources(struct domain *d)
 
     return 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 #define PAGELIST_ENTRIES_PER_PAGE                       \
     ((OPTEE_MSG_NONCONTIG_PAGE_SIZE / sizeof(u64)) - 1)
@@ -1727,7 +1729,9 @@ static const struct tee_mediator_ops optee_ops =
     .probe = optee_probe,
     .domain_init = optee_domain_init,
     .domain_teardown = optee_domain_teardown,
+#ifdef CONFIG_MGMT_HYPERCALLS
     .relinquish_resources = optee_relinquish_resources,
+#endif
     .handle_call = optee_handle_call,
 };
 
diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
index 8501443c8e..a8e160700f 100644
--- a/xen/arch/arm/tee/tee.c
+++ b/xen/arch/arm/tee/tee.c
@@ -65,6 +65,7 @@ int tee_domain_teardown(struct domain *d)
     return cur_mediator->ops->domain_teardown(d);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int tee_relinquish_resources(struct domain *d)
 {
     if ( !cur_mediator )
@@ -72,6 +73,7 @@ int tee_relinquish_resources(struct domain *d)
 
     return cur_mediator->ops->relinquish_resources(d);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 uint16_t tee_get_type(void)
 {
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index 9953ea1c6c..4d03a927ee 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -229,10 +229,12 @@ int arch_vcpu_reset(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int domain_relinquish_resources(struct domain *d)
 {
     BUG_ON("unimplemented");
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void arch_dump_domain_info(struct domain *d)
 {
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index cb19a83280..c2e6af2c43 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -203,10 +203,12 @@ int arch_vcpu_reset(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int domain_relinquish_resources(struct domain *d)
 {
     BUG_ON("unimplemented");
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void arch_dump_domain_info(struct domain *d)
 {
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 5e37bfbd17..b103301d7a 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2289,6 +2289,7 @@ void sync_vcpu_execstate(struct vcpu *v)
            read_atomic(&v->dirty_cpu) != dirty_cpu);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int relinquish_memory(
     struct domain *d, struct page_list_head *list, unsigned long type)
 {
@@ -2613,6 +2614,7 @@ int domain_relinquish_resources(struct domain *d)
 
     return 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void arch_dump_domain_info(struct domain *d)
 {
diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
index 144aa168a3..f106ab794c 100644
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -651,6 +651,7 @@ void pit_init(struct domain *d)
     pit_reset(d);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 void pit_deinit(struct domain *d)
 {
     PITState *pit = domain_vpit(d);
@@ -664,6 +665,7 @@ void pit_deinit(struct domain *d)
         destroy_periodic_time(&pit->pt0);
     }
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index 05633fe2ac..4e915808f4 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -366,6 +366,7 @@ void p2m_pod_get_mem_target(const struct domain *d, xen_pod_target_t *target)
     pod_unlock(p2m);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int p2m_pod_empty_cache(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
@@ -409,6 +410,7 @@ int p2m_pod_empty_cache(struct domain *d)
     unlock_page_alloc(p2m);
     return p2m->pod.count ? -ERESTART : 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 int
 p2m_pod_offline_or_broken_hit(struct page_info *p)
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 2763f9a6be..a5db8e6d4a 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2097,6 +2097,7 @@ int xenmem_add_to_physmap_one(
     return rc;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 /*
  * Remove foreign mappings from the p2m, as that drops the page reference taken
  * when mapped.
@@ -2160,6 +2161,7 @@ int relinquish_p2m_mapping(struct domain *d)
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void p2m_log_dirty_range(struct domain *d, unsigned long begin_pfn,
                          unsigned long nr, uint8_t *dirty_bitmap)
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 65455a6867..116389d4e9 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -768,6 +768,7 @@ void paging_vcpu_teardown(struct vcpu *v)
         shadow_vcpu_teardown(v);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 /* Call when destroying a domain */
 int paging_teardown(struct domain *d)
 {
@@ -794,6 +795,7 @@ int paging_teardown(struct domain *d)
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /* Call once all of the references to the domain have gone away */
 void paging_final_teardown(struct domain *d)
diff --git a/xen/common/domain.c b/xen/common/domain.c
index f24f3675aa..6819494649 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1221,6 +1221,7 @@ int rcu_lock_live_remote_domain_by_id(domid_t dom, struct domain **d)
     return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int domain_kill(struct domain *d)
 {
     int rc = 0;
@@ -1271,6 +1272,7 @@ int domain_kill(struct domain *d)
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 
 void __domain_crash(struct domain *d)
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index eb0c233977..bdbae0f8bf 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -109,6 +109,7 @@ int iommu_dt_domain_init(struct domain *d)
     return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int iommu_release_dt_devices(struct domain *d)
 {
     const struct domain_iommu *hd = dom_iommu(d);
@@ -137,6 +138,7 @@ int iommu_release_dt_devices(struct domain *d)
 
     return 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int iommu_dt_xlate(struct device *dev,
                           const struct dt_phandle_args *iommu_spec,
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 52c22fa50c..422e45f5a6 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -946,6 +946,7 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
     return ret;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int pci_release_devices(struct domain *d)
 {
     int combined_ret;
@@ -1004,6 +1005,7 @@ int pci_release_devices(struct domain *d)
 
     return combined_ret;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 #define PCI_CLASS_BRIDGE_HOST    0x0600
 #define PCI_CLASS_BRIDGE_PCI     0x0604
-- 
2.34.1


