Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFD6C7895D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 11:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168593.1494620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOr0-0001Ym-6M; Fri, 21 Nov 2025 10:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168593.1494620; Fri, 21 Nov 2025 10:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOqz-0001VN-Uj; Fri, 21 Nov 2025 10:59:01 +0000
Received: by outflank-mailman (input) for mailman id 1168593;
 Fri, 21 Nov 2025 10:59:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOqy-0008Dv-GV
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:59:00 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13b3aa70-c6c9-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 11:58:57 +0100 (CET)
Received: from PH8PR22CA0009.namprd22.prod.outlook.com (2603:10b6:510:2d1::25)
 by DS0PR12MB8416.namprd12.prod.outlook.com (2603:10b6:8:ff::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:58:52 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::b8) by PH8PR22CA0009.outlook.office365.com
 (2603:10b6:510:2d1::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 10:58:50 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 10:58:51 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:58:47 -0800
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
X-Inumbo-ID: 13b3aa70-c6c9-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fnRs17zHX/kRzDu/wQ2cCk5wEKKuVkRDQ55ER7jp1WLUyWF/47vV5KWGaFUo62hMlYknloSOFTzWvvJ9B74917lZpx8M+PRWWZm0bu+POxOthesgvCQB3fdWxUMMyjr4tCV0h6q5Sdtau3oUwURWLWlUEjsv0WfbLjsKp9IEJMacNVT0Wm0wTY83hakGUHIJsI76aI9uxD29VLA8yrwpbKgnrk/7MD/nESidQvLxulACCIhVLNowJ3Pfmut+vHDF96H1H1a0WDxcA1Yqob0CwbTHUfwkCS+njVnXuYNyOnKRbSZFwvvdiOp4VoAXh6Uulpvrefs4tjnBG69NoitRcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltg8NEd19K9zNxJWI1ScsZ54nXB2wMydfRY2hEDjijY=;
 b=v3sSCvIjz5/uw6c5QRFCftgcXRAABP70QfwAv4OquHCKiTLLEx3zpXJXvcPcqhxxV0/Gb+ucaFgfXAp5TY2vQl9zk6q9tE0pd29Bm84TO0w8H8iSw0QST5KUKgRwgab6UEQ6xzDOezW1FWXlUhkb8yGzZE2FWtwJX0LgpWsIXwCOWU2F+bKLIfzKwJ9SyjHWuI1fYSmeisL7GYB2yDPkGoAUjOaLKy6UApX9l/BYJGjGKIbRdz3dQtOonA6QXmKH4G6Y3sD9r0ja18enfoxHHVcxg18svwM7PmGLigty29C5ng13p0yppCyl/sxHPzGjYBW9WSYEcZF4bORAfdc1VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltg8NEd19K9zNxJWI1ScsZ54nXB2wMydfRY2hEDjijY=;
 b=gMzby3sZHYBfl7la3998BaxPf4ilakhfS3Wmt8AHkjw9tzBKs4MwpnWEsc/hp11FwoZbbI9qe1BHhGbegp8p916oMAZ0pDQcDN5U9rEyQH0Ja3ggVMwdIjOdcAhL9CWMXnuQ1S4UAHqPTcLaPsPAwcUa8eE7mSQY45qRPGmJ+nM=
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
Subject: [PATCH v4 08/24] xen/domctl: wrap domain_kill() with CONFIG_MGMT_HYPERCALLS
Date: Fri, 21 Nov 2025 18:57:45 +0800
Message-ID: <20251121105801.1251262-9-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121105801.1251262-1-Penny.Zheng@amd.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|DS0PR12MB8416:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d4d8650-655a-4907-0f4b-08de28ecf4f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BdyO40/hMnyNxsSp2gzGDwjAV9UxeLM+oRVUNzSPV/npYwlq0Ke9NDHLfct2?=
 =?us-ascii?Q?dQGHhFAOokP6wEp3881rbZoXXIOAw36Y0XG7k4S0ClIzpONg1QQ+/Ad5WHvV?=
 =?us-ascii?Q?AbYISagU7SoJ+9x3CXjpkkeAJ5SP8weqEXvDNWLV21zbgAnnL74UtKkUfFPz?=
 =?us-ascii?Q?+jQvWhvvwaMhyoV0+xDDETyN2hXPt8zYi7KuFkpfAWbXml/tRg6jL9JKCpdP?=
 =?us-ascii?Q?t03iwiSxiCJJazHI3aos5avEofq+QKR7n3eWhSWEtaNtJRJMLga6G3GzuKMP?=
 =?us-ascii?Q?YvTcZHqUfoe0JsBNRFQuWmRv6KaEdnSZmShJT84GbXbJdRvb3eWWPTeQD74i?=
 =?us-ascii?Q?XIu95HS2ADuJmguQRDcaoefcgrcbacxEr5cACtaBJM3mwyTr/crIBBo5b7s7?=
 =?us-ascii?Q?2ElzUVW8Aspli5kEueepMLagNwi6/W9h2BPHCU6swBFYBUeTm89V5gTZziLy?=
 =?us-ascii?Q?tbY5rj+BCXik9O1q4grwNcpZ1SKbS9iCX0oVuA8KKyQ3COzC8CZdtxjHZml6?=
 =?us-ascii?Q?hNp8lyd7sX3ixHGly73BVczWyTyzL9QN4ATjiNaKUvSe712V20SAX6YrXNRH?=
 =?us-ascii?Q?IljL0ynhRuKwG+7EOJMlB144spF7hsuOIkUoCQBp2ukBUXUYXtnU+Daen3Hi?=
 =?us-ascii?Q?kzHUQ6l4dwA7cq5zi0AbhewlY+bHkYCdKHVp5/WCmfwqmGLFEhmthZ6KqXpO?=
 =?us-ascii?Q?YfBxYYHX6GOOJqs5CKhc2Rxaz1kvrW5azp85sWxjWz0a8U/3WIzVWgZoPZn5?=
 =?us-ascii?Q?5Q+iFwVMmYlkdsr1ZC2iSeJ/Kpbg5kkQNq59JkbT3SfPbaD3sgUQSpG1eyRq?=
 =?us-ascii?Q?AUZZ4W7X/ax/PRivBqukTqfyjLkt60xY7hXqbzsOm5nSSknidzb0LffY38TS?=
 =?us-ascii?Q?775BPwELxkPGCW+Ns9kf9sBcJAL08qUWKGRXGGDawqsSS7gEfgHfkj/VsT9u?=
 =?us-ascii?Q?h7Klrt5Y67g/NMmprLY7Wf+svvoCvi+rG2XB65YaTRV8NTaZ6bdHssFTrvXb?=
 =?us-ascii?Q?znnbVMx5NT5zs2XRB9tYFcdcpbQ3IDypU+Q4eY1YCE23eASdkM6CRDUTgvR3?=
 =?us-ascii?Q?JIEF2/79UgzSJbyAOWtSnXHtmNpAcBG/F7W4N8/IaieTpB6i/uGQ5rNH1ZLE?=
 =?us-ascii?Q?HJGMlJHA7kJE2ghzWsbN5Fc+DMOrQgc33wrbM7+fLOa+mkppnQ0yYt5InBse?=
 =?us-ascii?Q?B7z459i9jUwjGsUpZX/Ov+E5VezIYXVZ1fGuf2DSUnSTPhoflGjmryUbYf5/?=
 =?us-ascii?Q?cpl6K0mb+YEDITpgO71VWS6nWhC7pfkcHLaLxpgO+UglrZJbcj91ZB90NhNz?=
 =?us-ascii?Q?iRLTVhzHe6dAJNCI2C7TBWLfFmKYDM6Xvg/hTNDmbLR5TkQs+jTYE/SocFAe?=
 =?us-ascii?Q?r4tGFfznoiTbTmlLXpEAnzjExHRFITM+vhFbNN8ThMO9kgd5su1oYdRVvmMw?=
 =?us-ascii?Q?1VW0PqiFjY6rv42Z1OeVFI6s8yCgCXYKfXTv0/cuTFyGmRBYQ+oghQvv3//n?=
 =?us-ascii?Q?WCoeKLe5fHTEkQcwp72JXlRanDdLIXRfxnuDYOdNsMOfJwAZs0s7HIAJsZOA?=
 =?us-ascii?Q?/cLKChDlvnYwB2z3Ec0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:58:51.9449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4d8650-655a-4907-0f4b-08de28ecf4f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8416

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
index ab78444335..e1fa76e1e8 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -988,6 +988,7 @@ int arch_vcpu_reset(struct vcpu *v)
     return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int relinquish_memory(struct domain *d, struct page_list_head *list)
 {
     struct page_info *page, *tmp;
@@ -1139,6 +1140,8 @@ int domain_relinquish_resources(struct domain *d)
 
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
index 75ebcae5e2..e70e1a12cb 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -234,10 +234,12 @@ int arch_vcpu_reset(struct vcpu *v)
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
index 37b4346d3f..42bac26aa7 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -208,10 +208,12 @@ int arch_vcpu_reset(struct vcpu *v)
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
index 3a21e035f4..fff5cf7238 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2305,6 +2305,7 @@ void sync_vcpu_execstate(struct vcpu *v)
            read_atomic(&v->dirty_cpu) != dirty_cpu);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int relinquish_memory(
     struct domain *d, struct page_list_head *list, unsigned long type)
 {
@@ -2629,6 +2630,7 @@ int domain_relinquish_resources(struct domain *d)
 
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
index c6b0f931dc..e8a5c30557 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1211,6 +1211,7 @@ int rcu_lock_live_remote_domain_by_id(domid_t dom, struct domain **d)
     return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int domain_kill(struct domain *d)
 {
     int rc = 0;
@@ -1261,6 +1262,7 @@ int domain_kill(struct domain *d)
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 
 void __domain_crash(struct domain *d)
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index f5850a2607..015ffa15d4 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -108,6 +108,7 @@ int iommu_dt_domain_init(struct domain *d)
     return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int iommu_release_dt_devices(struct domain *d)
 {
     const struct domain_iommu *hd = dom_iommu(d);
@@ -136,6 +137,7 @@ int iommu_release_dt_devices(struct domain *d)
 
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


