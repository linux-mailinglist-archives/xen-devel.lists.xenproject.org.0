Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87499BD2903
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:27:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142060.1476336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Flq-0000YQ-AI; Mon, 13 Oct 2025 10:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142060.1476336; Mon, 13 Oct 2025 10:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Flq-0000Tv-4F; Mon, 13 Oct 2025 10:27:14 +0000
Received: by outflank-mailman (input) for mailman id 1142060;
 Mon, 13 Oct 2025 10:27:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8FcL-0004Hi-Jf
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:17:25 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce87c40d-a81d-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 12:17:23 +0200 (CEST)
Received: from BN9PR03CA0494.namprd03.prod.outlook.com (2603:10b6:408:130::19)
 by IA0PR12MB8207.namprd12.prod.outlook.com (2603:10b6:208:401::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:17:12 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:130:cafe::f5) by BN9PR03CA0494.outlook.office365.com
 (2603:10b6:408:130::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 10:17:12 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Mon, 13 Oct 2025 10:17:12 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:17:08 -0700
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
X-Inumbo-ID: ce87c40d-a81d-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RMtLL1KboKtN3+45xfVb/4+yxSc9LQydqdtnBw49ngBTaRlZ9UHrIWz1pYl1HrJcHPhJ9iSy4bXOCCaeyjNvT0eqhhXGj45xsCYkFVqMsyY8FEjNE27RiBDVulXfBuCZwiEAzwRrRkLawJhWINNcLDP7DnSZyrwy+QAiMstQIDxRHE7RQtf47GuelqUwoHLC/BdG5K6v1Cz+zZ/am9tYfPo0HEECYlrJuvF8HfRyWwqVY4tzyWHr9L6SUo6Ronz4+0PUx5eLBqLN+5cyLl58aeFxV4x/hv5IeMY0ZEgc3AIULLwqVrAmnU/Uqrd5rDyjG+fPdN7VvVuj1IpRdXe+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dW0Z7lJ6siiHrf4a3nIGhXTfSrGLnm+IVIQE9j9Bzbw=;
 b=QD6Ca4oGbM91hDoY6+eaNjL8Evu10GH4dSEr/O45tr2YByP9iDNg6r9c4tWIRpvdplTprMwABfaBCMqxEXrh8TaVFFjpHV0hKhaOCgiLwLir+CjNKCqWyVw+xGQ6pBHInZBtvi4BJzR5Ukb6OY/wG1s7bmj4S1TVHc6QK6znmBKbeQZez0v5zqUehojiawcvbC1VVOwCRhyj8nnN4iGLt7fnsKhvdQq8k+0CiqLIZRe9JNIsdAKvVDDseh6W+8nQC4glw9tDZf52gwO/o78fnATZYEGygrmn2kBh471aDPl/l7UCR7rauuE7Ios/dMXrcPGVaa0TFoorwimDQC0afQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dW0Z7lJ6siiHrf4a3nIGhXTfSrGLnm+IVIQE9j9Bzbw=;
 b=ToSYkXUlq7P6CSpvyu837171WW1+6/RCzpZIQhKUTWN1ZWitHc5+tiAVUzXFPsNZkM9GwsvtqwH2ukY2m1YZvzCSi09NTxcZvLWqleryKkdlneLIOIaKZiaDWRbWNDVj0CkZJlFj0cz+SMWhnhAWvjGh48GdYq1saNLjEFTIESY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Michal
 Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v3 15/28] xen/domctl: wrap domain_kill() with CONFIG_MGMT_HYPERCALLS
Date: Mon, 13 Oct 2025 18:15:27 +0800
Message-ID: <20251013101540.3502842-16-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013101540.3502842-1-Penny.Zheng@amd.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|IA0PR12MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: 74c4c672-4ea4-4866-cd47-08de0a41acfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Me20bK9ROmRFVe4xjGx7LULvDr8HljJyvutsLOkcD7y06VGthoq1nW1Awgpg?=
 =?us-ascii?Q?QPZUawOgIkUxK0X+jP0gE+09e1Kdzz2vntD0xTZbM9BGKou1mjPVq6sAgSFf?=
 =?us-ascii?Q?AZVfAGTKPWhIHqQwTmmpT/Xyk1Py1u1CGmeq3Z7Bmn//91W/9PZf5qGSEtHT?=
 =?us-ascii?Q?1eqbq3IxFfPDpSUuWxLv1UPakuOr+xT3ZvS+7PQsNrYIj6tXFkaPQqxIBkKg?=
 =?us-ascii?Q?bOcA1lhaGLvEtQ6kT0B+GyQYxeaYi9jmkfwtbX6bexJQwPWK99UkUgsbavJK?=
 =?us-ascii?Q?mTt8PDjUxI9gTsPD7fiXHN8rfE6p59TM4ilPolFCTJsciLNkkYwnJ3VZnnGU?=
 =?us-ascii?Q?IqVz51pu2zK6FRphixEu32j+5aImbf4n7yPNxSITvhv6DJ0tC6LW0523AOm+?=
 =?us-ascii?Q?VsfHaK7GR5VxJAZ50C2ULk/bkOGcw5VHGzniXYVu/mFAUTOn5jDTceUlP9H8?=
 =?us-ascii?Q?VLEoLT8RwWP/8dJt5V3yDmyYAfhjGmScCB/HVn+mLQP8XZK/b1rEaHipoFyW?=
 =?us-ascii?Q?zm+8h7nffIwM64+UDo6ZZ3zezYu6KG12cwEcxq76YcJbbjF6nln8RSIDW26S?=
 =?us-ascii?Q?xeskaYtbU8Cmnp7rCyiInIT+Uj9iF2NmAvtHo3Qu5/WP+gTxGxPvopTKximp?=
 =?us-ascii?Q?OtgVOrzsPZDXHu7W20OvN7vP2JnhRCSA4XTgCfCOpVgW4WFZ3IB9yOcAw6M0?=
 =?us-ascii?Q?T6TK9O0dERkcRWvKvcmDtWTxLerR7PcdpggwitRXMrmf8BFiLyknU8UdpqIg?=
 =?us-ascii?Q?QzbVwtk2r3+Dzk34so/G68aC7bxs6/LjRz4DWswBewclC+udwxiEdNKmf8b1?=
 =?us-ascii?Q?xT6yAVk3HVLQ10IMnjAO573oHn6uJ2+rfbnA/mztOd2rxyAZirp+dzb0mtz/?=
 =?us-ascii?Q?Y5OgNqUkxuwygiq1zk8Vxeb6z8ukgP4la12aGb+pCShP8LSPsTAjtuEWD9zz?=
 =?us-ascii?Q?oqL6QeOqS9zyfGD+kvvGPLqkpDSK+kZXl068y1tdxuXWsnETAITRNYW4XYiq?=
 =?us-ascii?Q?XKgDSBRtruH+sgkDcBXmp4QIvtLWu1ObvahSeGFKgtFYHZ/DO2BKwQsBxt/N?=
 =?us-ascii?Q?sGi4X4V6mxZnjDowoLlUYc8AZuaI6rBmtb8wRGiOC1QwGcQ38lyd/P0NniLp?=
 =?us-ascii?Q?FOwR0IkMFgPj4C3pMpmh+F5DZfRUJ9/znUzBUujwmouThFrTbtNTjSpKDcWb?=
 =?us-ascii?Q?MFfEgUDXUsD4PY7wowWap0p7fzvXnFsU6mGOYejA0aL5LUZ19g9g1veyFP26?=
 =?us-ascii?Q?ZojmF+P+Ihpd2Ic6MqotNqSMs9MLy64jzIVGmPZ2FvDNlhao9FlwuMg4MAeJ?=
 =?us-ascii?Q?ZZmLAyEqSFSnVXFWDmr7v2VZ8YGF7Oa16Sdbpdszp+usATFaYOKSjGtZCMSL?=
 =?us-ascii?Q?W5RhNmh08geucA49p7Pj3yJ8PZod/0L6JS8de5s5kQKHScAZWWEuz2nCRv6D?=
 =?us-ascii?Q?XOkRf5UJrEY84xwO8/piUPD25ZSlavkSmpSeF39S7q+u2+FYp/KEn0WHsyxm?=
 =?us-ascii?Q?TBY8DUJaOq9Fl7mdQvwE6+XhNOZTINSxBV07AaG3oBXmpnh4kdy0RHni58NB?=
 =?us-ascii?Q?Q489f6qwmKuRm2/O00g=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:17:12.4163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c4c672-4ea4-4866-cd47-08de0a41acfc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8207

Function domain_kill() is responsible for killing domain and relinquish
domain-held resources. and it is only invoked under
XEN_DOMCTL_destroydomain-case. So it shall be wrapped with
CONFIG_MGMT_HYPERCALLS.
Tracking its calling chain, the following functions could also be wrapped with
CONFIG_MGMT_HYPERCALLS:
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
Otherwise all these functions will become unreachable codes when
MGMT_HYPERCALLS=n, and hence violating Misra rule 2.1.

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
 xen/arch/x86/mm/mem_sharing.c         | 2 ++
 xen/arch/x86/mm/p2m-pod.c             | 2 ++
 xen/arch/x86/mm/p2m.c                 | 2 ++
 xen/arch/x86/mm/paging.c              | 2 ++
 xen/common/domain.c                   | 2 ++
 xen/drivers/passthrough/device_tree.c | 2 ++
 xen/drivers/passthrough/pci.c         | 2 ++
 18 files changed, 43 insertions(+)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 948ca35e19..3070a5fc8f 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -995,6 +995,7 @@ int arch_vcpu_reset(struct vcpu *v)
     return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int relinquish_memory(struct domain *d, struct page_list_head *list)
 {
     struct page_info *page, *tmp;
@@ -1146,6 +1147,8 @@ int domain_relinquish_resources(struct domain *d)
 
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
index ecaffe0d2e..a57cc8595d 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -241,10 +241,12 @@ int arch_vcpu_reset(struct vcpu *v)
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
index 291c8a23e8..3e4280dee1 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -215,10 +215,12 @@ int arch_vcpu_reset(struct vcpu *v)
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
index 5b3c5e8caf..314de75d8e 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2298,6 +2298,7 @@ void sync_vcpu_execstate(struct vcpu *v)
            read_atomic(&v->dirty_cpu) != dirty_cpu);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int relinquish_memory(
     struct domain *d, struct page_list_head *list, unsigned long type)
 {
@@ -2622,6 +2623,7 @@ int domain_relinquish_resources(struct domain *d)
 
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
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index b5a259af1d..af7b7f2538 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1396,6 +1396,7 @@ int __mem_sharing_unshare_page(struct domain *d,
     return rc;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int relinquish_shared_pages(struct domain *d)
 {
     int rc = 0;
@@ -1452,6 +1453,7 @@ int relinquish_shared_pages(struct domain *d)
     p2m_unlock(p2m);
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int range_share(struct domain *d, struct domain *cd,
                        struct mem_sharing_op_range *range)
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
index e2a00a0efd..c1a87cde27 100644
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
index 34e2e501dc..5d81ab3045 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1230,6 +1230,7 @@ int rcu_lock_live_remote_domain_by_id(domid_t dom, struct domain **d)
     return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int domain_kill(struct domain *d)
 {
     int rc = 0;
@@ -1280,6 +1281,7 @@ int domain_kill(struct domain *d)
 
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
index 3edcfa8a04..cd855108c2 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -945,6 +945,7 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
     return ret;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int pci_release_devices(struct domain *d)
 {
     int combined_ret;
@@ -1003,6 +1004,7 @@ int pci_release_devices(struct domain *d)
 
     return combined_ret;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 #define PCI_CLASS_BRIDGE_HOST    0x0600
 #define PCI_CLASS_BRIDGE_PCI     0x0604
-- 
2.34.1


