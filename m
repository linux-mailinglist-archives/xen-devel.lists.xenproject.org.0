Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19299B1934F
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:50:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068400.1432456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMe-000434-2C; Sun, 03 Aug 2025 09:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068400.1432456; Sun, 03 Aug 2025 09:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMd-0003sW-NN; Sun, 03 Aug 2025 09:50:47 +0000
Received: by outflank-mailman (input) for mailman id 1068400;
 Sun, 03 Aug 2025 09:50:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVKi-0005hH-Ap
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:48:48 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060f.outbound.protection.outlook.com
 [2a01:111:f403:200a::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a134efc-704f-11f0-b897-0df219b8e170;
 Sun, 03 Aug 2025 11:48:43 +0200 (CEST)
Received: from BYAPR11CA0065.namprd11.prod.outlook.com (2603:10b6:a03:80::42)
 by SA3PR12MB7903.namprd12.prod.outlook.com (2603:10b6:806:307::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Sun, 3 Aug
 2025 09:48:31 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:80:cafe::ae) by BYAPR11CA0065.outlook.office365.com
 (2603:10b6:a03:80::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.20 via Frontend Transport; Sun,
 3 Aug 2025 09:48:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:48:29 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:48:25 -0500
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
X-Inumbo-ID: 0a134efc-704f-11f0-b897-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0mpicNE+o958B61mbOoh7olUsugO5FEdZe7HOOR5YX6lYgdOhBOSYBzu0AxkKjxqEkjkCMtXCfMLkfwGBEA9+6KU4mhWBMoiNULgnMvbPqImQ/VQ+oFyqOLvfejrRCeH8XeeKmL+TAVSIT5Mex1hn+GIqlOp+5D4tWuosvaYb14hZgVmdTHzYNAb37a9eastFcuP4LCw7Q3GjGFLbtLbP9AcP0EaHd3XKS3Xyhc7VO5xnT5hNq/wQaiA0Hie/ewez3ECAZA0BOP+j63AZJtl9VOSEppKBzSbDb4yCzMPfHRd634ymyvIsuMVRvjgfWLfZj6FzrVIea6ZoL29fZCNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhIqHQV3Qb/Ebi1H+4XtFjW5VqOztqqTnpXGMtgBrfE=;
 b=blRx8Uy7b2Aa9caPHkIRHCl50eEHwYfgeM6HBqcO+CqhIe7FmGUIl1bU+OY6851xPud52PhzfpUGot2n0Bo3AnxfJOIy7F75umYbfQj3lOcAdt6TjgvgYG90UulGrumd3IH/FErOKT/qPz4v0PDDPS+a0UeqKNaOjj2KiKxVUT3saVA2xSRhSON0ZX8iBhcj6jvK3LohFF3iDzFSZGINRhrsymES6adASUzDsltxXl51/2N1T/3LlrtcP88AYfM3XUNfp+DWFKLyKdPbELhfD3mYBNMrUxMaZ9hOcX4GUMI0GopS0HjmBJXQ5kYSespEyt2p5K41N16w3M+ckiSjLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhIqHQV3Qb/Ebi1H+4XtFjW5VqOztqqTnpXGMtgBrfE=;
 b=k55rodgNnaLCsowUKOgv5xip9uOfS2ns7Mb+hJLO+BrD99xEVHiQZZyR3h8H8DDN/TytzzB73efNdcMpdR+DqO8RkC7etJcFs2d+88sv7+CRVeC6wJBzLx1zSsLioWqZaODcPUrMimvZ5UqHWG6Bg2eyEXq3ulSGJFfeUKDALm8=
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
	<roger.pau@citrix.com>, Shawn Anastasio <sanastasio@raptorengineering.com>,
	Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
	<aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v1 09/25] xen/domctl: wrap around XEN_DOMCTL_destroydomain
Date: Sun, 3 Aug 2025 17:47:22 +0800
Message-ID: <20250803094738.3625269-10-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250803094738.3625269-1-Penny.Zheng@amd.com>
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|SA3PR12MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c5869eb-f513-4f26-8017-08ddd272e700
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XvDi+oMbUl6xSi59Q6FcEV4RKl33gk6ZoIsJSLqy14IyMfRHoX1bD1L+su50?=
 =?us-ascii?Q?gLcoLBQsb8v6Ou/LkuFhHPFIiV4ppblnXwkfps4BsR88cOaJJgVRFk6/rF0X?=
 =?us-ascii?Q?w1OAPocqLyQe6JgM03syY7RTBoIonbj1cpPXF7cBfeUXCzrmGUUUSbdSM1Dc?=
 =?us-ascii?Q?k+mY7Ezp3G5F4Fkp2oh8ZGTKwb0sezECfY7LZDirsmF9yNPBd5wCcYlcFpYU?=
 =?us-ascii?Q?PqvbBvRucY/uwCZmkH4ozKK1HPReeP8UbSkCvcSdX3pi23kmyhrWeazm3kVN?=
 =?us-ascii?Q?Z/+xXvdxafnj4EMjH9sRy8FWASm7PoUisH8npP7EMOynkJnKJ3c5qC3dWF0M?=
 =?us-ascii?Q?bONtC3hN94OJvdjsahMHQtBzUv8CmgpdtoC9xzia5I8kW7aGquC3n0VRGUig?=
 =?us-ascii?Q?rRnVbt8Id/Cs5O/enp6m4LgalDE28Z6EivCx1hdI+I0zcaKJvdrsT3rzIAt1?=
 =?us-ascii?Q?yRwE8FC29fJuXhktDrv+aTndWUoOc1/D2Qk1rwkxVogmjP9ssTMq+SDS4CPG?=
 =?us-ascii?Q?BDl0dxrxz61lNgQFnOTEj4sZ1kPSUGEDKzRnQjTUGu/MoAcvHMpLKQRp3ZJ1?=
 =?us-ascii?Q?Kfpjx9rSzB9+wR6kCzo398M2kKmvy3J8UgX4RI3q0xFJtTtlrIXYhL9H2Q0y?=
 =?us-ascii?Q?w89dbd1DF0DdKU/yv3/Pd9V9Eg3NZ4d/GCIvzxmwazdgC4aUiyPpqGsSEACB?=
 =?us-ascii?Q?DdEljroqq9IrzmaaxU+Op6oBBqYs+gjNxRfHQ1yoYXdecKER0kcsAv86L3w8?=
 =?us-ascii?Q?JExmTX8JyscrMf3j0bvtv4Z1tV7Xw9eVV53+ROjsxpJXmke2R3cY8FyQXS9L?=
 =?us-ascii?Q?u3Vj+swHU4XB8QQ1zhdJHPRGNN4G+ojNkRHwCdqw1KBLFfZJk1V9yuwrb7/b?=
 =?us-ascii?Q?LWssYh4t3APxru7jDVNWaZ6+8Y56rSKWsQ8znDdZrXVeDXK+cvAMbV5hfF/3?=
 =?us-ascii?Q?E/YmrWIEPD+legphfuiGMoSDrWBsHNgg8rGQBNgVC0zYlCsACxmp8d9ekp6r?=
 =?us-ascii?Q?638UmjE2b+yDcJCgpyxSOXIuIssqWsyZwB8Ya9A+OvHnTicgvBbvsC/xmhGM?=
 =?us-ascii?Q?J9nUAn4AUoEeHSUCaK8/Yr/RUXCBKTVPH5izwL2PKupi+5CLBx0v0EZGwAHO?=
 =?us-ascii?Q?MzgG2jUKzWL1qwCHa/d0EwogznFNhcQT/PJvMZivBnVz70NHbJhB1g2gZA5J?=
 =?us-ascii?Q?yAAjHaN7HXG8bLtanojRyTPyucE6AyfTB/M4fLaohkdLQ3xJEtswgYalJ7W0?=
 =?us-ascii?Q?O2UaodBgMwDNhJ4A3ZsKM1xW3i7cnoNuK55y/RBG7jygLH2i9/bPKZo5PzJ8?=
 =?us-ascii?Q?SklUyw6OxpTPOfELySbkCs6/Aci5RFfgjP95awHKR/5u11GkuNfc7/TDaWNp?=
 =?us-ascii?Q?xiiG9QHrFFIfN1P1wQWI4xamgrmJYQOUTbkzBxtCuSmjzizWpD/106Vo18BB?=
 =?us-ascii?Q?jpslokiSVHZVbPu47dnqs9Q/ervNb8/C4/zSQzwi2nAbubuo6U7P68YhIUWa?=
 =?us-ascii?Q?EjHcJO/xfwCxDDuplgk19dDmMfzmQYoPme1+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:48:29.8808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5869eb-f513-4f26-8017-08ddd272e700
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7903

Function domain_kill() is responsible for killing domain and relinquish
domain-held resources. Tracking its calling chain, the following
functions shall also be wrapped:
- domain_relinquish_resource
  - pci_release_device
  - relinquish_shared_pages
  - paging_teardown
    - p2m_pod_empty_cache
  - relinquish_memory
  - pit_deinit
  - iommu_release_dt_devices
  - tee_relinquish_resources
    - ffa_relinquish_resources/optee_relinquish_resources
  - relinquish_p2m_mapping
  - p2m_clear_root_pages
- vm_event_cleanup

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/arm/domain.c                 | 3 +++
 xen/arch/arm/include/asm/tee/tee.h    | 2 ++
 xen/arch/arm/mmu/p2m.c                | 4 ++++
 xen/arch/arm/mpu/p2m.c                | 2 ++
 xen/arch/arm/tee/ffa.c                | 4 ++++
 xen/arch/arm/tee/optee.c              | 4 ++++
 xen/arch/arm/tee/tee.c                | 2 ++
 xen/arch/ppc/stubs.c                  | 2 ++
 xen/arch/x86/domain.c                 | 2 ++
 xen/arch/x86/emul-i8254.c             | 2 ++
 xen/arch/x86/mm/mem_sharing.c         | 2 ++
 xen/arch/x86/mm/p2m-pod.c             | 2 ++
 xen/arch/x86/mm/p2m.c                 | 2 ++
 xen/arch/x86/mm/paging.c              | 2 ++
 xen/common/domain.c                   | 2 ++
 xen/common/vm_event.c                 | 2 ++
 xen/drivers/passthrough/device_tree.c | 2 ++
 xen/drivers/passthrough/pci.c         | 2 ++
 18 files changed, 43 insertions(+)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 4124d201d1..e55ff966d2 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -990,6 +990,7 @@ int arch_vcpu_reset(struct vcpu *v)
     return 0;
 }
 
+#ifdef CONFIG_DOMCTL
 static int relinquish_memory(struct domain *d, struct page_list_head *list)
 {
     struct page_info *page, *tmp;
@@ -1135,6 +1136,8 @@ int domain_relinquish_resources(struct domain *d)
 
 #undef PROGRESS
 
+#endif /* CONFIG_DOMCTL */
+
 void arch_dump_domain_info(struct domain *d)
 {
     p2m_dump_info(d);
diff --git a/xen/arch/arm/include/asm/tee/tee.h b/xen/arch/arm/include/asm/tee/tee.h
index 0169fd746b..dc08e7e0ba 100644
--- a/xen/arch/arm/include/asm/tee/tee.h
+++ b/xen/arch/arm/include/asm/tee/tee.h
@@ -40,12 +40,14 @@ struct tee_mediator_ops {
     int (*domain_teardown)(struct domain *d);
     void (*free_domain_ctx)(struct domain *d);
 
+#ifdef CONFIG_DOMCTL
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
index 51abf3504f..4b13867fa2 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1243,6 +1243,7 @@ static void p2m_invalidate_table(struct p2m_domain *p2m, mfn_t mfn)
     p2m->need_flush = true;
 }
 
+#ifdef CONFIG_DOMCTL
 /*
  * The domain will not be scheduled anymore, so in theory we should
  * not need to flush the TLBs. Do it for safety purpose.
@@ -1262,6 +1263,7 @@ void p2m_clear_root_pages(struct p2m_domain *p2m)
 
     p2m_write_unlock(p2m);
 }
+#endif /* CONFIG_DOMCTL */
 
 /*
  * Invalidate all entries in the root page-tables. This is
@@ -1556,6 +1558,7 @@ int p2m_init(struct domain *d)
     return 0;
 }
 
+#ifdef CONFIG_DOMCTL
 /*
  * The function will go through the p2m and remove page reference when it
  * is required. The mapping will be removed from the p2m.
@@ -1626,6 +1629,7 @@ int relinquish_p2m_mapping(struct domain *d)
 
     return rc;
 }
+#endif /* CONFIG_DOMCTL */
 
 /*
  * Clean & invalidate RAM associated to the guest vCPU.
diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
index f7fb58ab6a..e8c5665ab9 100644
--- a/xen/arch/arm/mpu/p2m.c
+++ b/xen/arch/arm/mpu/p2m.c
@@ -57,10 +57,12 @@ bool p2m_resolve_translation_fault(struct domain *d, gfn_t gfn)
 
 void p2m_flush_vm(struct vcpu *v) {}
 
+#ifdef CONFIG_DOMCTL
 int relinquish_p2m_mapping(struct domain *d)
 {
     return 0;
 }
+#endif /* CONFIG_DOMCTL */
 
 void p2m_domain_creation_finished(struct domain *d) {}
 
diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 3bbdd7168a..bb9b50932c 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -434,10 +434,12 @@ static void ffa_free_domain_ctx(struct domain *d)
     XFREE(d->arch.tee);
 }
 
+#ifdef CONFIG_DOMCTL
 static int ffa_relinquish_resources(struct domain *d)
 {
     return 0;
 }
+#endif /* CONFIG_DOMCTL */
 
 static void ffa_init_secondary(void)
 {
@@ -559,7 +561,9 @@ static const struct tee_mediator_ops ffa_ops =
     .domain_init = ffa_domain_init,
     .domain_teardown = ffa_domain_teardown,
     .free_domain_ctx = ffa_free_domain_ctx,
+#ifdef CONFIG_DOMCTL
     .relinquish_resources = ffa_relinquish_resources,
+#endif
     .handle_call = ffa_handle_call,
 };
 
diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index 5151bd90ed..8d91df4e23 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -632,6 +632,7 @@ static void free_optee_shm_buf_pg_list(struct optee_domain *ctx,
                  cookie);
 }
 
+#ifdef CONFIG_DOMCTL
 static int optee_relinquish_resources(struct domain *d)
 {
     struct arm_smccc_res resp;
@@ -693,6 +694,7 @@ static int optee_relinquish_resources(struct domain *d)
 
     return 0;
 }
+#endif /* CONFIG_DOMCTL */
 
 #define PAGELIST_ENTRIES_PER_PAGE                       \
     ((OPTEE_MSG_NONCONTIG_PAGE_SIZE / sizeof(u64)) - 1)
@@ -1727,7 +1729,9 @@ static const struct tee_mediator_ops optee_ops =
     .probe = optee_probe,
     .domain_init = optee_domain_init,
     .domain_teardown = optee_domain_teardown,
+#ifdef CONFIG_DOMCTL
     .relinquish_resources = optee_relinquish_resources,
+#endif
     .handle_call = optee_handle_call,
 };
 
diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
index 3f65e45a78..c97b19cd6f 100644
--- a/xen/arch/arm/tee/tee.c
+++ b/xen/arch/arm/tee/tee.c
@@ -60,6 +60,7 @@ int tee_domain_teardown(struct domain *d)
     return cur_mediator->ops->domain_teardown(d);
 }
 
+#ifdef CONFIG_DOMCTL
 int tee_relinquish_resources(struct domain *d)
 {
     if ( !cur_mediator )
@@ -67,6 +68,7 @@ int tee_relinquish_resources(struct domain *d)
 
     return cur_mediator->ops->relinquish_resources(d);
 }
+#endif /* CONFIG_DOMCTL */
 
 uint16_t tee_get_type(void)
 {
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index b2b97c6eb7..0d8563f11f 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -263,10 +263,12 @@ int arch_vcpu_reset(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
+#ifdef CONFIG_DOMCTL
 int domain_relinquish_resources(struct domain *d)
 {
     BUG_ON("unimplemented");
 }
+#endif /* CONFIG_DOMCTL */
 
 void arch_dump_domain_info(struct domain *d)
 {
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 13ccaf1c79..a0d650cb86 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2235,6 +2235,7 @@ void sync_vcpu_execstate(struct vcpu *v)
            read_atomic(&v->dirty_cpu) != dirty_cpu);
 }
 
+#ifdef CONFIG_DOMCTL
 static int relinquish_memory(
     struct domain *d, struct page_list_head *list, unsigned long type)
 {
@@ -2559,6 +2560,7 @@ int domain_relinquish_resources(struct domain *d)
 
     return 0;
 }
+#endif /* CONFIG_DOMCTL */
 
 void arch_dump_domain_info(struct domain *d)
 {
diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
index 144aa168a3..bb9718bb97 100644
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -651,6 +651,7 @@ void pit_init(struct domain *d)
     pit_reset(d);
 }
 
+#ifdef CONFIG_DOMCTL
 void pit_deinit(struct domain *d)
 {
     PITState *pit = domain_vpit(d);
@@ -664,6 +665,7 @@ void pit_deinit(struct domain *d)
         destroy_periodic_time(&pit->pt0);
     }
 }
+#endif /* CONFIG_DOMCTL */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index da28266ef0..7858565429 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1391,6 +1391,7 @@ int __mem_sharing_unshare_page(struct domain *d,
     return rc;
 }
 
+#ifdef CONFIG_DOMCTL
 int relinquish_shared_pages(struct domain *d)
 {
     int rc = 0;
@@ -1447,6 +1448,7 @@ int relinquish_shared_pages(struct domain *d)
     p2m_unlock(p2m);
     return rc;
 }
+#endif /* CONFIG_DOMCTL */
 
 static int range_share(struct domain *d, struct domain *cd,
                        struct mem_sharing_op_range *range)
diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index 05633fe2ac..98a846bb55 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -366,6 +366,7 @@ void p2m_pod_get_mem_target(const struct domain *d, xen_pod_target_t *target)
     pod_unlock(p2m);
 }
 
+#ifdef CONFIG_DOMCTL
 int p2m_pod_empty_cache(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
@@ -409,6 +410,7 @@ int p2m_pod_empty_cache(struct domain *d)
     unlock_page_alloc(p2m);
     return p2m->pod.count ? -ERESTART : 0;
 }
+#endif /* CONFIG_DOMCTL */
 
 int
 p2m_pod_offline_or_broken_hit(struct page_info *p)
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index b9a7c2dc53..c2840131ad 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2088,6 +2088,7 @@ int xenmem_add_to_physmap_one(
     return rc;
 }
 
+#ifdef CONFIG_DOMCTL
 /*
  * Remove foreign mappings from the p2m, as that drops the page reference taken
  * when mapped.
@@ -2151,6 +2152,7 @@ int relinquish_p2m_mapping(struct domain *d)
 
     return rc;
 }
+#endif /* CONFIG_DOMCTL */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 1216a181c3..3da99ad371 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -768,6 +768,7 @@ void paging_vcpu_teardown(struct vcpu *v)
         shadow_vcpu_teardown(v);
 }
 
+#ifdef CONFIG_DOMCTL
 /* Call when destroying a domain */
 int paging_teardown(struct domain *d)
 {
@@ -794,6 +795,7 @@ int paging_teardown(struct domain *d)
 
     return rc;
 }
+#endif /* CONFIG_DOMCTL */
 
 /* Call once all of the references to the domain have gone away */
 void paging_final_teardown(struct domain *d)
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 604217d782..be722c9f09 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1222,6 +1222,7 @@ int rcu_lock_live_remote_domain_by_id(domid_t dom, struct domain **d)
     return 0;
 }
 
+#ifdef CONFIG_DOMCTL
 int domain_kill(struct domain *d)
 {
     int rc = 0;
@@ -1272,6 +1273,7 @@ int domain_kill(struct domain *d)
 
     return rc;
 }
+#endif /* CONFIG_DOMCTL */
 
 
 void __domain_crash(struct domain *d)
diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index 1666ff615f..102745117e 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -559,6 +559,7 @@ static void cf_check mem_sharing_notification(struct vcpu *v, unsigned int port)
 }
 #endif
 
+#ifdef CONFIG_DOMCTL
 /* Clean up on domain destruction */
 void vm_event_cleanup(struct domain *d)
 {
@@ -589,6 +590,7 @@ void vm_event_cleanup(struct domain *d)
     }
 #endif
 }
+#endif /* CONFIG_DOMCTL */
 
 int vm_event_domctl(struct domain *d, struct xen_domctl_vm_event_op *vec)
 {
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index f5850a2607..704910de3d 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -108,6 +108,7 @@ int iommu_dt_domain_init(struct domain *d)
     return 0;
 }
 
+#ifdef CONFIG_DOMCTL
 int iommu_release_dt_devices(struct domain *d)
 {
     const struct domain_iommu *hd = dom_iommu(d);
@@ -136,6 +137,7 @@ int iommu_release_dt_devices(struct domain *d)
 
     return 0;
 }
+#endif /* CONFIG_DOMCTL */
 
 static int iommu_dt_xlate(struct device *dev,
                           const struct dt_phandle_args *iommu_spec,
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 3edcfa8a04..41638b71d6 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -945,6 +945,7 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
     return ret;
 }
 
+#ifdef CONFIG_DOMCTL
 int pci_release_devices(struct domain *d)
 {
     int combined_ret;
@@ -1003,6 +1004,7 @@ int pci_release_devices(struct domain *d)
 
     return combined_ret;
 }
+#endif /* CONFIG_DOMCTL */
 
 #define PCI_CLASS_BRIDGE_HOST    0x0600
 #define PCI_CLASS_BRIDGE_PCI     0x0604
-- 
2.34.1


